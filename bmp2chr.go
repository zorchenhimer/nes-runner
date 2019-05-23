package main

import (
	"encoding/binary"
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

//const inputFilename string = "before.bmp"
var doubleHigh bool

func main() {

	var inputFilename string
	var outputFilename string

	flag.StringVar(&inputFilename, "i", "", "Input BMP file")
	flag.StringVar(&outputFilename, "o", "", "Output filename (optional)")
	flag.BoolVar(&doubleHigh, "16", false, "8x16 tiles")
	flag.Parse()

	if len(inputFilename) == 0 {
		fmt.Println("Missing input file")
		os.Exit(1)
	}

	// Default the same name but with .chr extension
	if len(outputFilename) == 0 {
		outputFilename = inputFilename
		ext := filepath.Ext(inputFilename)
		outputFilename = outputFilename[0:len(outputFilename)-len(ext)] + ".chr"
	}

	if doubleHigh {
		fmt.Println("8x16 tiles are not yet supported")
		os.Exit(1)
	}

	// Read input file
	rawBmp, err := ioutil.ReadFile(inputFilename)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	// Parse some headers
	fileHeader, err := ParseFileHeader(rawBmp)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	imageHeader, err := ParseImageHeader(rawBmp)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	// Validate image dimensions
	if imageHeader.Width != 128 {
		fmt.Println("Image width must be 128")
		os.Exit(1)
	}

	if imageHeader.Height%8 != 0 {
		fmt.Println("Image height must be a multiple of 8")
		os.Exit(1)
	}

	// Isolate the pixel data
	rawBmpPixels := rawBmp[fileHeader.Offset:len(rawBmp)]

	// Invert rows; They're stored top to bottom in BMP
	row := (len(rawBmpPixels) / 128) - 1
	uprightRows := []byte{}

	for row > -1 {
		// Get the row
		rawRow := rawBmpPixels[row*128 : row*128+128]
		// normalize each pixel's palette index
		for _, b := range rawRow {
			uprightRows = append(uprightRows, byte(int(b)%4))
		}
		row--
	}

	// split out the 8x8 or 8x16 tiles
	tileID := 0
	tiles := []*RawTile{}
	numRows := 8
	if doubleHigh {
		numRows = 16
	}

	for tileID < (len(uprightRows) / 64) {
		// The first pixel offset in the current tile
		startOffset := (tileID/16)*(128*8) + (tileID%16)*8
		if doubleHigh {
			// From SlashLife for 8x16 tiles: lookupTileId = (tileId / 32) * 32 + (tileId % 32) / 2 + (tileId % 2) * 16
			// TODO: this isn't tested
			startOffset = (tileID/32)*32 + (tileID%32)/2 + (tileID%2)*16
		}

		tileBytes := []byte{}
		for y := 0; y < numRows; y++ {
			for x := 0; x < 8; x++ {
				tileBytes = append(tileBytes, uprightRows[startOffset+x+128*y])
			}
		}
		tiles = append(tiles, &RawTile{Data: tileBytes})
		tileID++
	}

	chrFile, err := os.Create(outputFilename)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer chrFile.Close()

	for _, tile := range tiles {
		_, err = chrFile.Write(tile.ToChr())
		if err != nil {
			fmt.Println(err)
			return
		}
	}
}

type FileHeader struct {
	Size   int // size of file in bytes
	Offset int // offset to start of pixel data
}

func (f FileHeader) String() string {
	return fmt.Sprintf("Size: %d Offset: %d", f.Size, f.Offset)
}

// Size, offset, error
func ParseFileHeader(input []byte) (*FileHeader, error) {
	if len(input) < 4 {
		return nil, fmt.Errorf("Data too short for header")
	}
	header := input[0:14]

	size := binary.LittleEndian.Uint32(header[2:6])
	offset := binary.LittleEndian.Uint32(header[10:14])
	return &FileHeader{Size: int(size), Offset: int(offset)}, nil
}

type ImageHeader struct {
	headerSize  int
	Width       int
	Height      int
	BitDepth    int
	Compression int
	Size        int // image size

	// "Pixels per meter"
	ppmX int
	ppmY int

	ColorMapEntries   int
	SignificantColors int
}

func (i ImageHeader) String() string {
	return fmt.Sprintf("(%d, %d) %d bpp @ %d bytes", i.Width, i.Height, i.BitDepth, i.Size)
}

func ParseImageHeader(input []byte) (*ImageHeader, error) {
	if len(input) < (14 + 12) {
		return nil, fmt.Errorf("Data too short for image header")
	}

	header := &ImageHeader{}
	header.headerSize = int(binary.LittleEndian.Uint32(input[14:18]))

	//headerRaw := input[14 : 14+header.Size]

	header.Width = int(binary.LittleEndian.Uint32(input[18:22]))
	header.Height = int(binary.LittleEndian.Uint32(input[22:26]))
	header.BitDepth = int(binary.LittleEndian.Uint16(input[28:30]))

	header.Size = int(binary.LittleEndian.Uint32(input[38:42]))

	return header, nil
}

type RawTile struct {
	Data []byte // IDs of colors in palette
	//DoubleHigh bool   // 8x16 tile?
}

/*
CHR
	each byte is a single row of pixels
	each tile is 16 bytes long
	first 8 bytes are the first half of the plane	(color 0 & 1)
	second 8 bytes are the second half of the plane	(color 2 & 3)
*/
func (t *RawTile) ToChr() []byte {
	// These are a max of 8 bytes each
	planeA := []byte{}
	planeB := []byte{}

	rowCount := 8
	if doubleHigh {
		rowCount = 16
	}

	// Foreach row
	for rowNum := 0; rowNum < rowCount; rowNum++ {
		a := byte(0)
		b := byte(0)

		// Get the byte for the given row
		// The 8 here isn't row, it's column
		for _, d := range t.Data[rowNum*8 : ((rowNum + 1) * 8)] {
			// Normalize index to be between 0 and 3, inclusively
			d = d % 4

			// Get the bit for each plane and shift it onto their bytes
			a = a<<0x1 | byte(d)&0x1
			b = b<<0x1 | byte(d)>>1
		}

		// Add the bytes to their respective planes
		planeA = append(planeA, a)
		planeB = append(planeB, b)
	}

	// return the tiles two planes
	return append(planeA, planeB...)
}
