
# Assembler and linker paths
CA = c:/cc65/bin/ca65.exe
LD = c:/cc65/bin/ld65.exe

# Mapper configuration for linker
NESCFG = nes_001.cfg

# Name of the main source file, minus the extension
NAME = runner

# any CHR files included
CHR = runner.chr credits.chr

# List of all the sources files
SOURCES = $(NAME).asm nes2header.inc game.asm \
		  utils.asm utils_ram.asm \
		  title.asm \
		  credits.asm credits_ram.asm credits_data.i

# misc
RM = rm

.PHONY: clean default cleanSym symbols

default: all
all: bin/$(NAME).nes bin/$(NAME).mlb
symbols: cleanSym bin/$(NAME).mlb

clean:
	-$(RM) bin/*.*
cleanSym:
	-$(RM) bin/*.mlb

bin/:
	mkdir bin

bin/$(NAME).o: bin/ $(SOURCES) $(CHR)
	$(CA) -g \
		-t nes \
		-o bin/$(NAME).o\
		-l bin/$(NAME).lst \
		$(NAME).asm

bin/$(NAME).nes: bin/$(NAME).o $(NESCFG)
	$(LD) -o bin/$(NAME).nes \
		-C $(NESCFG) \
		-m bin/$(NAME).nes.map -vm \
		-Ln bin/$(NAME).labels \
		--dbgfile bin/$(NAME).nes.db \
		bin/$(NAME).o

bin/$(NAME).mlb: bin/$(NAME).nes.db
	#perl.exe ../nes-symbols.pl bin/$(NAME).labels
	../tools/ld65-labels/ld65-labels.exe bin/$(NAME).nes.db

credits_data.i: subscriber-list.csv
	# TODO: improve this utility
	go run ../credits/generate-credits.go

