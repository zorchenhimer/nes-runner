
ifeq ($(OS),Windows_NT)
export PATH := $(PATH);../tools/cc65/bin;../tools/ld65-labels
else
export PATH := $(PATH):../tools/cc65/bin:../tools/ld65-labels
endif

# Assembler and linker paths
CA = ca65
LD = ld65
CL = ld65-labels

# Tool to generate credits data
CR = go run ../credits/generate-credits.go

# Mapper configuration for linker
NESCFG = nes_001.cfg

# Name of the main source file, minus the extension
NAME = runner

# any CHR files included
CHR = runner.chr credits.chr

# List of all the sources files
SOURCES = $(NAME).asm nes2header.inc game.asm \
		  utils.asm utils_ram.asm \
		  title.asm ded.asm seed.asm scores.asm \
		  credits.asm credits_ram.asm credits_data.i

# misc
RM = rm

.PHONY: clean default cleanSym symbols clrNames

default: all
all: bin/$(NAME).nes bin/$(NAME).mlb
symbols: cleanSym bin/$(NAME).mlb
names: clrNames credits_data.i

clean:
	-$(RM) bin/*.*
cleanSym:
	-$(RM) bin/*.mlb
clrNames:
	-$(RM) credits_data.i

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
	$(CL) bin/$(NAME).nes.db

credits_data.i: subscriber-list.csv
	$(CR) -x zorchenhimer -o credits_data.i -i subscriber-list.csv

