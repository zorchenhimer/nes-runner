package main

import (
	//"bytes"
	"encoding/csv"
	"flag"
	"fmt"
	"os"
	"strings"
)

const CLEAR_TILE_ID = "$20"

var excludeNames = []string{}

var verbose bool

type DataChunk interface {
	AsmString(num int) string
	String() string
	AttributeValue() uint
}

type OP_CODE int

const (
	CR_OP_EOC       OP_CODE = iota
	CR_OP_CLEAR_ROW         // Clear 32 tiles
	CR_OP_INC_BYTE          // Increment byte N times given the start value
	CR_OP_RLE               // Run Length Encoded
	CR_OP_BYTE_LIST         // List of bytes, NULL terminated
	CR_OP_ATTR              // One bite value for the row, as well as End of Data
	CR_OP_NAME
	CR_OP_EOD
)

type GenericChunk struct {
	Comment   string
	OpCodes   []*GenericData
	Attribute uint
}

func (c *GenericChunk) AsmString(num int) string {
	length := 0
	codestrings := []string{}
	for _, code := range c.OpCodes {
		codestrings = append(codestrings, code.AsmString())
		length += code.Length
	}

	if length > 64 {
		panic("Generic code chunk length greater than 64")
	}

	comment := ""
	if len(c.Comment) > 0 {
		comment = "; " + c.Comment + "\n"
	}

	return fmt.Sprintf("%scr_data_chunk_%02d:\n    %s\n", comment, num, strings.Join(codestrings, "\n    "))

}

func (c GenericChunk) AttributeValue() uint {
	return c.Attribute
}

func (c *GenericChunk) String() string {
	return "idk, lol"
}

type GenericData struct {
	OpCode OP_CODE
	Length int
	Data   []byte
}

// will hold the twitch logo and header and things
func NewGenericData(code OP_CODE, length int, data []byte) *GenericData {
	gc := &GenericData{OpCode: code}
	switch code {
	case CR_OP_INC_BYTE:
		if length == 0 || len(data) == 0 {
			panic("Missing length or data for CR_OP_INC_BYTE")
		}
		if len(data) > 1 {
			panic("Too much data for CR_OP_INC_BYTE")
		}
		gc.Length = length
		gc.Data = data

	case CR_OP_RLE:
		if length == 0 || len(data) == 0 {
			panic("Missing length or data for CR_OP_RLE")
		}
		if len(data) > 1 {
			panic("Too much data for CR_OP_RLE")
		}
		gc.Length = length
		gc.Data = data

	case CR_OP_BYTE_LIST:
		if len(data) == 0 {
			panic("Missing data for CR_OP_BYTE_LIST")
		}
		gc.Length = len(data)
		gc.Data = data

	case CR_OP_ATTR:
		if len(data) == 0 {
			panic("Missing data for CR_OP_ATTR")
		}
		if len(data) > 1 {
			panic("Too much data for CR_OP_ATTR")
		}
		gc.Data = data
	}
	return gc
}

func (c *GenericData) AsmString() string {
	switch c.OpCode {
	case CR_OP_EOD:
		return ".byte CR_OP_EOD"

	case CR_OP_EOC:
		return ".byte CR_OP_EOC"

	case CR_OP_CLEAR_ROW:
		return ".byte CR_OP_CLEAR_ROW"

	case CR_OP_INC_BYTE:
		return fmt.Sprintf(".byte CR_OP_INC_BYTE, %d, $%02X", c.Length, c.Data[0])

	case CR_OP_RLE:
		return fmt.Sprintf(".byte CR_OP_RLE, %d, $%02X", c.Length, c.Data[0])

	case CR_OP_BYTE_LIST:
		bytes := []string{}
		for _, b := range c.Data {
			bytes = append(bytes, fmt.Sprintf("$%02X", b))
		}
		return fmt.Sprintf(".byte CR_OP_BYTE_LIST, %s, $00", strings.Join(bytes, ", "))

	case CR_OP_ATTR:
		return fmt.Sprintf(".byte CR_OP_ATTR, $%02X", c.Data[0])
	}
	panic(fmt.Sprintf("Invalid OP Code: %d", c.OpCode))
}

type Subscriber struct {
	Username string
	Tier     int
}

func NewSub(row []string) (*Subscriber, error) {
	if len(row) < 3 {
		return nil, fmt.Errorf("Invalid row: %q", row)
	}

	sub := &Subscriber{
		Username: row[0],
		Tier:     1,
	}

	switch string(row[2][5]) {
	case "2":
		sub.Tier = 2
	case "3":
		sub.Tier = 3
	}

	return sub, nil
}

const asmTemplate = "cr_data_chunk_%02d: .byte CR_OP_NAME, $%02X, %q" // prefix, suffix, attribute, name

func (s *Subscriber) AsmString(num int) string {
	length := len(s.Username)
	half := int(length / 2)
	offset := 16 - half
	trailing := 32 - (offset + length)

	chunkLength := length + offset + trailing
	if chunkLength != 32 {
		panic(fmt.Sprintf("Chunklength is not 64 bytes (%d)! %q length:%d offset:%d trailing:%d half:%d", chunkLength, s.Username, length, offset, trailing, half))
	}

	attr_len := (s.Tier-1)<<uint(6) | len(s.Username)
	//attr = s.AttributeValue()
	//attr = attr << uint(2) | s.AttributeValue()
	//tier_attr = tier_attr << uint(2) | s.Tier - 1

	//return fmt.Sprintf(asmTemplate, num, offset, trailing, tier_attr, s.Username)
	return fmt.Sprintf(asmTemplate, num, attr_len, s.Username)
}

func (s Subscriber) AttributeValue() uint {
	return uint(s.Tier - 1)
}

func (s *Subscriber) String() string {
	return fmt.Sprintf("%s: Tier %d", s.Username, s.Tier)
}

func main() {
	var inputFile string
	var inputFileRequired string
	var outputName string
	var dummyNames bool
	var exclude string

	flag.StringVar(&inputFile, "i", "", "Input csv file.  Dummy names used if nonexistent.")
	flag.StringVar(&inputFileRequired, "I", "", "Required input csv file.  Error if nonexistent.")
	flag.StringVar(&outputName, "o", "credits_data.i", "Output assembly file.")
	flag.BoolVar(&dummyNames, "dummy", false, "Use dummy names instead of an input csv file.")
	flag.BoolVar(&verbose, "verbose", false, "Verbose output.")
	flag.StringVar(&exclude, "x", "", "A comma separated list of names to exclude.")
	flag.Parse()

	if len(exclude) > 0 {
		excludeNames = strings.Split(exclude, ",")
	}

	if len(inputFileRequired) > 0 {
		if len(inputFile) > 0 && inputFileRequired != inputFile {
			fmt.Println("ERROR: Cannot provide both an optional and required input file!")
			os.Exit(1)
		} else if dummyNames {
			fmt.Println("ERROR: Cannot provide both a required input file and dummy names option!")
			os.Exit(1)
		} else {
			inputFile = inputFileRequired
		}
	}

	subList := []DataChunk{}
	if !exists(inputFile) && !dummyNames {
		if len(inputFileRequired) > 0 && inputFile == inputFileRequired {
			fmt.Printf("ERROR: The required input file %q does not exist!\n", inputFileRequired)
			os.Exit(1)
		}

		if len(inputFile) > 0 {
			fmt.Printf("WARNING: %q does not exist! Using dummy names for credits!\n", inputFile)
		} else {
			fmt.Println("WARNING: No input file given, using dummy names for credits!")
		}
		dummyNames = true
	}

	if !dummyNames {
		file, err := os.Open(inputFile)
		if err != nil {
			fmt.Println("ERROR: Unable to open subscriber-list.csv: ", err)
			os.Exit(1)
		}

		reader := csv.NewReader(file)

		records, err := reader.ReadAll()
		if err != nil {
			fmt.Println("ERROR: Unable to read subscriber-list.csv: ", err)
			os.Exit(1)
		}

		for _, row := range records[1:] {
			exclude := false
			for _, ex := range excludeNames {
				if ex == strings.ToLower(row[0]) {
					exclude = true
				}
			}
			if !exclude {
				sub, err := NewSub(row)
				if err != nil {
					fmt.Println("WARNING: Error parsing subscriber: ", err)
				} else {
					subList = append(subList, sub)
				}
			}
		}
	} else {
		if verbose {
			fmt.Println("Using dummy names")
		}
		subList = []DataChunk{
			&Subscriber{"01 Connie Klein", 1},
			&Subscriber{"02 Stephanie Blake", 1},
			&Subscriber{"03 Rosie Burgess", 1},
			&Subscriber{"04 Ida Harmon", 1},
			&Subscriber{"05 Emmett Murray", 1},
			&Subscriber{"06 Paul Lowe", 1},
			&Subscriber{"07 Christina Clayton", 1},
			&Subscriber{"08 Lucille Scott", 1},
			&Subscriber{"09 Jennifer Carpenter", 1},
			&Subscriber{"10 Doyle Ryan", 1},
			&Subscriber{"11 Ricky Robbins", 1},
			&Subscriber{"12 Tyler Hammond", 1},
			&Subscriber{"13 Rene Palmer", 1},
			&Subscriber{"14 Damon Hopkins", 1},
			&Subscriber{"15 Sandra Willis", 2},
			&Subscriber{"16 Pete Russell", 1},
			&Subscriber{"17 Dean Waters", 1},
			&Subscriber{"18 Anne Cook", 1},
			&Subscriber{"19 Seth Coleman", 1},
			&Subscriber{"20 Ellis Walton", 1},
			&Subscriber{"21 Doris Cooper", 3},
			&Subscriber{"22 Vicky Parker", 1},
			&Subscriber{"23 Ernestine Larson", 1},
			&Subscriber{"24 Edna Jefferson", 1},
			&Subscriber{"25 Judy Garner", 1},
			&Subscriber{"26 Leon Barker", 3},
			&Subscriber{"27 Claire Rogers", 2},
			&Subscriber{"28 Priscilla Caldwell", 3},
			&Subscriber{"29 Lillian Carpenter", 1},
			&Subscriber{"30 Justin Graves", 1},
			&Subscriber{"31 Katrina Walton", 1},
			&Subscriber{"32 Cody Ross", 1},
			&Subscriber{"33 Nettie Curry", 1},
			&Subscriber{"34 Benny Lewis", 1},
			&Subscriber{"35 Lindsey Sullivan", 1},
			&Subscriber{"36 Lionel Banks", 1},
			&Subscriber{"37 Katie Casey", 1},
			&Subscriber{"38 Erika Cook", 1},
			&Subscriber{"39 Wanda Klein", 1},
			&Subscriber{"40 Dewey Rice", 1},
			&Subscriber{"41 Jermaine Harrison", 1},
			&Subscriber{"42 Mandy Jensen", 1},
			&Subscriber{"43 Abraham West", 1},
			&Subscriber{"44 Perry Williamson", 1},
			&Subscriber{"45 Lindsay Francis", 1},
		}
	}

	headerChunks := []DataChunk{
		// a blank row (two tile rows)
		&GenericChunk{
			Comment:   "Blank row before special thanks",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},
		// top half of header
		&GenericChunk{
			Comment:   "Top half of header",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				// Padding
				NewGenericData(CR_OP_RLE, 7, []byte(" ")),
				// Twitch logo row one
				NewGenericData(CR_OP_INC_BYTE, 3, []byte{0x10}),
				// "Twitch.tv/"
				NewGenericData(CR_OP_INC_BYTE, 7, []byte{0x02}),
				// padding
				NewGenericData(CR_OP_RLE, 22, []byte(" ")),
				// Twitch logo row two
				NewGenericData(CR_OP_INC_BYTE, 3, []byte{0x13}),
				// top of "Zorchenhimer"
				NewGenericData(CR_OP_INC_BYTE, 15, []byte{0x80}),
				// padding
				NewGenericData(CR_OP_RLE, 7, []byte(" ")),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},
		// bottom half of header
		&GenericChunk{
			Comment:   "Bottom half of header",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				// padding
				NewGenericData(CR_OP_RLE, 7, []byte(" ")),
				// Twitch logo row three
				NewGenericData(CR_OP_INC_BYTE, 3, []byte{0x16}),
				// bottom of "Zorchenhimer"
				NewGenericData(CR_OP_INC_BYTE, 15, []byte{0x90}),
				// padding
				NewGenericData(CR_OP_RLE, 7, []byte(" ")),
				// blank row
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},

		&GenericChunk{
			Comment:   "Blank row before Miha's credit",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},

		// Special thanks
		&GenericChunk{
			Comment:   "Special thanks for MihaBrumecArt",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				// First Row
				NewGenericData(CR_OP_RLE, 8, []byte(" ")),
				NewGenericData(CR_OP_INC_BYTE, 16, []byte{0xA0}),
				NewGenericData(CR_OP_RLE, 16, []byte(" ")),

				// Second row
				NewGenericData(CR_OP_INC_BYTE, 16, []byte{0xB0}),
				NewGenericData(CR_OP_RLE, 8, []byte(" ")),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0F}),
			},
		},
		&GenericChunk{
			Comment:   "Special thanks for MihaBrumecArt",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				// First Row
				NewGenericData(CR_OP_RLE, 8, []byte(" ")),
				NewGenericData(CR_OP_INC_BYTE, 16, []byte{0xC0}),
				NewGenericData(CR_OP_RLE, 16, []byte(" ")),

				// Second row
				NewGenericData(CR_OP_INC_BYTE, 16, []byte{0xD0}),
				NewGenericData(CR_OP_RLE, 8, []byte(" ")),
				//NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0xF}),
			},
		},

		&GenericChunk{
			Comment:   "Blank row before music credit",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},


		// Special thanks for music
		&GenericChunk{
			Comment:   "Special thanks for music",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				// First Row
				NewGenericData(CR_OP_RLE, 13, []byte(" ")),
				NewGenericData(CR_OP_INC_BYTE, 7, []byte{0x09}),
				NewGenericData(CR_OP_RLE, 21, []byte(" ")),

				// Second row
				NewGenericData(CR_OP_INC_BYTE, 14, []byte{0xE1}),
				NewGenericData(CR_OP_RLE, 9, []byte(" ")),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0xF0}),
			},
		},

		&GenericChunk{
			Comment: "Special thanks for music, pt2",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_RLE, 9, []byte(" ")),
				NewGenericData(CR_OP_INC_BYTE, 14, []byte{0xF1}),
				NewGenericData(CR_OP_RLE, 9, []byte(" ")),

				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_ATTR, 0, []byte{0xF0}),
			},
		},

		&GenericChunk{
			Comment:   "Blank row before names",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},

	}

	footerChunks := []DataChunk{
		&GenericChunk{
			Comment:   "Bottom padding for Attribute",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},
		&Subscriber{"Thank you!!", 1},
		&GenericChunk{
			Comment:   "Bottom padding for Attribute",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
			},
		},
		&GenericChunk{
			Comment:   "Bottom padding for Attribute",
			Attribute: uint(0),
			OpCodes: []*GenericData{
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				NewGenericData(CR_OP_CLEAR_ROW, 0, nil),
				// attribute
				NewGenericData(CR_OP_ATTR, 0, []byte{0x0}),
				NewGenericData(CR_OP_EOD, 0, []byte{0x0}),
			},
		},
	}

	allChunks := append(headerChunks, subList...)
	allChunks = append(allChunks, footerChunks...)

	outFile, err := os.Create(outputName)
	if err != nil {
		fmt.Println("ERROR: Unable to create credits_data.i: ", err)
		os.Exit(1)
	}

	fmt.Fprintln(outFile, "credits_data_chunks:")
	//for i, _ := range allChunks {
	//    fmt.Fprintf(outFile, "    .word cr_data_chunk_%02d\n", i)
	//}
	//fmt.Fprintln(outFile, "credits_data_chunks_end:\n")

	count := 0
	//attr := uint(0)
	for i, s := range allChunks {
		// calculate the attribute byte
		//attr = s.AttributeValue()
		//attr = attr << uint(2) | s.AttributeValue()

		if verbose {
			fmt.Printf("  %02d %s\n", i, s.String())
		}
		fmt.Fprintln(outFile, s.AsmString(i))
		//if i % 2 == 0 {
		//    fmt.Fprintf(outFile, "    .byte CR_OP_EOD\n\n")
		//    if verbose { fmt.Println("no attribute byte") }
		//} else {
		// Swap the lower and upper bits of the attribute byte
		//attrA := attr & 0xF0
		//attrB := attr & 0x0F

		//attrA = attrA >> uint(4)
		//attrB = attrB << uint(4)

		//attr = attrA | attrB

		// Print the attribute OP code
		//fmt.Fprintf(outFile, "    .byte CR_OP_ATTR, $%02X\n\n", attr)
		//if verbose { fmt.Printf("Attribute byte: %02X\n", attr) }
		//}
		count += 1
	}

	fmt.Printf("Chunks in credits: %d\n", count)
}

// exists returns whether the given file or directory exists or not.
// Taken from https://stackoverflow.com/a/10510783
func exists(path string) bool {
	_, err := os.Stat(path)
	if err == nil {
		return true
	}
	if os.IsNotExist(err) {
		return false
	}
	return true
}
