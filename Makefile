
export PATH := $(PATH):../tools/cc65/bin

EXT=
ifeq ($(OS),Windows_NT)
EXT=.exe
endif

# Assembler and linker paths
CA = ca65
LD = ld65

# Mapper configuration for linker
NESCFG = nes_001.cfg

# Tool that generates CHR data from Bitmap images
BMP2CHR = bmp2chr$(EXT)

# Tool that generates credits from an input CSV file
GENCRED = generate-credits$(EXT)

# Name of the main source file, minus the extension
NAME = runner

# any CHR files included
CHR = runner_00.chr runner_01.chr credits_00.chr credits_01.chr

# List of all the sources files
SOURCES = $(NAME).asm nes2header.inc game.asm \
		  background.asm utils.asm utils_ram.asm \
		  title.asm ded.asm seed.asm scores.asm \
		  credits.asm credits_ram.asm credits_data.i \
		  title_trans.asm sound.asm sound_bss.asm \
		  sound_zp.asm music_data.asm

# misc
RM = rm
TVFORMAT = -D NTSC

.PHONY: clean default cleanSym symbols pal set_pal

default: all
all: bin/$(NAME).nes
names: clrNames credits_data.i bin/$(NAME).nes

clean:
	-$(RM) bin/*.* credits_data.i *.chr $(BMP2CHR) $(GENCRED)

clrNames:
	-$(RM) credits_data.i

set_pal:
	$(eval export TVFORMAT=-D PAL)
pal: set_pal all

bin/:
	-mkdir bin

%.chr: %.bmp $(BMP2CHR)
	./$(BMP2CHR) -i $< -o $@

$(BMP2CHR): bmp2chr.go
	go build bmp2chr.go

$(GENCRED): generate-credits.go
	go build generate-credits.go

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

credits_data.i: $(GENCRED)
	./$(GENCRED) -x zorchenhimer -o credits_data.i -i subscriber-list.csv

music_data.asm: music-convert/music-convert.exe
	#-music-convert/music-convert.exe RunnJumper_music.txt > music_data.asm

music-convert/music-convert.exe: music-convert/*.go
	#-cd music-convert && go build
