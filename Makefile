
export PATH := $(PATH):../tools/cc65/bin

# Assembler and linker paths
CA = ca65
LD = ld65

# Tool to generate credits data
CR = go run generate-credits.go

# Mapper configuration for linker
NESCFG = nes_001.cfg

# Name of the main source file, minus the extension
NAME = runner

# any CHR files included
CHR = runner_00.chr runner_01.chr credits_00.chr credits_01.chr

# List of all the sources files
SOURCES = $(NAME).asm nes2header.inc game.asm \
		  background.asm utils.asm utils_ram.asm \
		  title.asm ded.asm seed.asm scores.asm \
		  credits.asm credits_ram.asm credits_data.i \
		  title_trans.asm

# misc
RM = rm
TVFORMAT = -D NTSC

.PHONY: clean default cleanSym symbols pal set_pal

default: all
all: bin/$(NAME).nes
symbols: cleanSym bin/$(NAME).mlb
names: clrNames credits_data.i bin/$(NAME).nes

clean:
	-$(RM) bin/*.* credits_data.i *.chr
cleanSym:
	-$(RM) bin/*.mlb

set_pal:
	$(eval export TVFORMAT=-D PAL)
pal: set_pal all

bin/:
	mkdir bin

%.chr: %.bmp
	go run ./bmp2chr.go -i $< -o $@

bin/$(NAME).o: bin/ $(SOURCES) $(CHR)
	$(CA) -g \
		-t nes \
		-o bin/$(NAME).o\
		$(TVFORMAT) \
		$(NAME).asm

bin/$(NAME).nes: bin/$(NAME).o $(NESCFG)
	$(LD) -o bin/$(NAME).nes \
		-C $(NESCFG) \
		--dbgfile bin/$(NAME).dbg \
		bin/$(NAME).o

credits_data.i:
	$(CR) -x zorchenhimer -o credits_data.i -i subscriber-list.csv

