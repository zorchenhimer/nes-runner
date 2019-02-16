; TODO
;   High Scores table
;       new high score notification
;       scores for a given seed?
;   Better map generation
;   Game states and substates
;   Player Sprite
;   more Background art (mountains or some shit.  happy little trees?)
;   Sound engine

; Just prints stuff.  Eventually this will be used with the sound engine 
; (and maybe some logic stuff too).
.ifdef NTSC
    .out "NTSC is defined"
.else
    .ifdef PAL
        .out "PAL is defined"
    .else
        .out "Neither PAL nor NTSC is defined"
    .endif
.endif

.include "nes2header.inc"
nes2mapper 1
nes2prg 4 * 16 * 1024
nes2chr 2 *  8 * 1024
nes2bram 1 * 8 * 1024
nes2mirror 'V'
nes2tv 'N'
nes2end

.segment "PATTERN0"
    .incbin "runner_00.chr"
    .incbin "runner_01.chr"

.segment "PATTERN1"
    .incbin "credits_00.chr"
    .incbin "credits_01.chr"

.segment "VECTORS"
    .word NMI
    .word RESET
    .word IRQ

.segment "ZEROPAGE"
    .include "utils_ram.asm"
    .include "credits_ram.asm"

sleeping:       .res 1
column_ready:   .res 1
frame_odd:      .res 1

meta_tile_addr:     .res 2  ; tiles that make up the meta tile (eg Meta_Sky, Meta_Ground, etc)
obs_countdown:      .res 1  ; obstacle countdown

; meta column offsets
meta_last_buffer:       .res 1
meta_last_gen:          .res 1
meta_cols_to_buffer:    .res 1

calc_scroll:        .res 1
coarse_scroll:      .res 1
player_scroll:      .res 1

meta_column_offset: .res 1  ; meta tile column wraps at 32
last_meta_offset:   .res 1  ; used to determine if rng is needed
map_meta_tmp:       .res 1
rng_result:         .res 1
ColCache:           .res 8

; Pointer to the current frame routine
DoFramePointer:     .res 2
DoNMIPointer:       .res 2
Ded_Fading:         .res 1  ; are we fading?
Ded_Pal:            .res 1  ; current fade palette
Ded_FadeNext:       .res 1  ; frames until next palette
DED_FADESPEED       = 10

gamestate_changed:  .res 1
current_gamestate:  .res 1

; main state in is high bits
; sub state is in low bits

.enum STATES
    GS_TITLE

    GS_CREDITS

    GS_GAME
    GS_DED

    GS_HIGHSCORE
    GS_SEED
.endenum

PauseOn:        .res 1
PauseOff:       .res 1
SkipNMI:        .res 1

TmpCounter:     .res 1
TmpAttr:        .res 1
TmpAddr:        .res 2
TmpAddr2:       .res 2
TmpY:           .res 1
TmpX:           .res 1
TmpZ:           .res 1

JumpPeak:       .res 1

TitleIndex:     .res 1  ; curretly selected thing
TitleLength:    .res 1  ; number of menu options
TitleColor:     .res 1  ; current color, lol
TitleColor2:    .res 1
TitleGameStates:.res 10 ; list of gamestates
TitleScroll:    .res 1
TitlePPUCtrl:   .res 1
title_clear:    .res 1

; Base-100 numbers of the score
PlayerScoreBase100: .res 0
PlayerScore3:   .res 1  ; 12
PlayerScore2:   .res 1  ; 34
PlayerScore1:   .res 1  ; 56
PlayerScore0:   .res 1  ; 78

; ASCII for the full score
; 12,345,678
PlayerScoreText:    .res 8

PlayerJumpFrame:    .res 1  ; current frame of the jump
;LevelSeed:          .res 2

; For address $2000
PPU_CTRL_VERT   = %10010100
PPU_CTRL_HORIZ  = %10010000
PPU_CTRL_TITLE  = %10000000

PPUUpdates:     .res 1
PPU_UPDATE_MASK = %10000000
;PPU_UPDATE_CTRL = %10000000

NewPPUMask:     .res 1
; no emphasize colors, show bg & sprites,
; show left 8px bg & sprite, no grayscale
PPU_MASK        = %00011110

; no drawing
PPU_MASK_OFF    = %00000110

PAGEID_GAME     = 0
PAGEID_CREDITS  = 1
PAGEID_IDK      = 2

Seed_Attr_Buffer:   .res 5
Seed_Input0:        .res 1
Seed_Input1:        .res 1
Seed_Input2:        .res 1
Seed_Input3:        .res 1

working_seed:       .res 2

clear_nt_tile:      .res 1
game_paused:        .res 1
rngFlipFlop:        .res 1

; Score stuff
SavedScore:         .res 4  ; Address of a score
TmpScoreEntry:      .res 16

bg_TransStart:          .res 1
bg_current_column:      .res 1
bg_lookup_data_pointer: .res 2
bg_lookup_pointer:      .res 2
bg_meta_data_pointer:   .res 2
bg_odd:                 .res 1
bg_tile_row:            .res 1
bg_drawcolumn_cmp:      .res 1

framesub_index:     .res 1
framesub_next:      .res 1
framesub_pointer:   .res 2
nmisub_pointer:     .res 2

GameFullInit:       .res 1

.segment "SAVERAM"
    ; battery backed RAM
rng_seed:       .res 2

.segment "BSS"
    ; non-zeropage ram

meta_columns:       .res 128
tile_column_buffer: .res 16
PaletteRAM:         .res 32
TileBuffer:         .res 64

; Start address to draw the tile_column_buffer
tile_column_addr_high:  .res 1
tile_column_addr_low:   .res 1

; Parameters for background drawing
BGNametable:    .res 1  ; High byte of nametable: $20, $24, $28, or $2C
BGYStart:       .res 1  ; Number of rows down the screen to draw
BGTheme:        .res 1  ; Theme ID of the background

; ID's (indexes) for themes
.enum BackgroundThemes
    City
.endenum

DED_START_PAL   = $03AA
DED_SPZ_PAL     = $039E
DED_SPZ_BG_PAL  = $03A6 ; for the BG tile under sprite zero

.segment "OAM"
    ; sprite stuff
spritezero:         .res 4
SPZ_Y   = spritezero+0
SPZ_IDX = spritezero+1
SPZ_ATT = spritezero+2
SPZ_X   = spritezero+3

sprites:            .res 252

; use this byte for sprite Y position.  it's the bottom right sprite.
SP_COLLIDE_Y    = sprites+28

SP_TITLEY0      = sprites+0
SP_TITLEY1      = sprites+4

SP_TITLETILE0   = sprites+1
SP_TITLETILE1   = sprites+5

SP_TITLEATTR0   = sprites+2
SP_TITLEATTR1   = sprites+6

SP_TITLEX0      = sprites+3
SP_TITLEX1      = sprites+7

.segment "PAGE0"
    ; main game
    .byte $00, $EA   ; current Page ID
    .include "game.asm"
    .include "ded.asm"
    .include "background.asm"

.segment "PAGE1"
    ; credits
    .byte $01, $EA   ; current Page ID
    .include "credits_data.i"

.segment "PAGE2"
    ; ???
    .byte $02, $EA

.segment "PAGE3"
    ; fixed bank
RESET:
    sei         ; Disable IRQs
    cld         ; Disable decimal mode

    ldx #$40
    stx $4017   ; Disable APU frame IRQ

    ldx #$FF
    txs         ; Setup new stack

    inx         ; Now X = 0

    stx $2000   ; disable NMI
    stx $2001   ; disable rendering
    stx $4010   ; disable DMC IRQs

@vblankwait1:   ; First wait for VBlank to make sure PPU is ready.
    bit $2002   ; test this bit with ACC
    bpl @vblankwait1 ; Branch on result plus

@clrmem:
    lda #$00
    sta $0000, x
    sta $0100, x
    sta $0200, x
    sta $0300, x
    sta $0400, x
    sta $0500, x
    sta $0600, x
    sta $0700, x

    inx
    bne @clrmem  ; loop if != 0

@vblankwait2:    ; Second wait for vblank.  PPU is ready after this
    bit $2002
    bpl @vblankwait2

; Main init
    jsr MMC1_Setup_Vert
    jsr MMC1_Page0

    jsr ClearNametable0
    jsr ClearNametable1

    jsr ClearAttrTable0
    jsr ClearAttrTable1

    lda #STATES::GS_TITLE
    sta current_gamestate
    jsr ChangeGameState

    lda #0
    sta SkipNMI

DoFrame:
    jsr ReadControllers
    jmp (DoFramePointer)

WaitSpriteZero:
    ; wait for vblank to end
    bit $2002
    bvs WaitSpriteZero

; wait for sprite zero hit
@loop_sprite2:
    bit $2002
    bvc @loop_sprite2

    ; update scroll for status bar (only X matters here)
    lda #00
    sta $2005
    ; first nametable
    lda #PPU_CTRL_VERT
    sta $2000

WaitFrame:
    lda #1
    sta sleeping
    ;inc sleeping
@loop:
    lda sleeping
    bne @loop
    jmp DoFrame

WritePalettes:
    lda #PPU_CTRL_HORIZ
    sta $2000

    bit $2002
    lda #$3F
    sta $2006
    lda #$00
    sta $2006
    ldx #31
@loop:
    lda PaletteRAM, x
    sta $2007
    dex
    lda PaletteRAM, x
    sta $2007
    dex
    lda PaletteRAM, x
    sta $2007
    dex
    lda PaletteRAM, x
    sta $2007
    dex
    bpl @loop
    rts

WriteSprites:
    ; Write sprites to PPU
    bit $2002
    lda #$00
    sta $2003
    lda #$02
    sta $4014
    rts

NMI:
    ; Only backup A.  If the NMI isn't skipped, X and Y are not in the middle
    ; of counting something (ie, the CPU is in the WaitFrame loop).
    pha

    ; Skip NMI if we're currently drawing the whole screen
    lda SkipNMI
    bne NMI_skip

    lda #PPU_MASK
    sta $2001

@skipOn:
    lda gamestate_changed
    beq @nochange

    jsr ChangeGameState
    jmp NMI_Finished
@nochange:

    jmp (DoNMIPointer)

NMI_Finished:
    lda #0
    sta SkipNMI

NMI_skip:
    lda #0
    sta sleeping
    pla
    rti

IRQ:
    rti

MMC1_Setup_Vert:
    ; control stuff
    ; vertical mirroring, switchable $8000, fixed $C000, chr 8k
    ; %0000 1110
    lda #%00001110
    jmp MMC1_Setup

MMC1_Setup_Horiz:
    lda #%00001111

MMC1_Setup:
    sta $8000
    lsr a
    sta $8000
    lsr a
    sta $8000
    lsr a
    sta $8000
    lsr a
    sta $8000
    rts

MMC1_Page0:
    ; select bank PRG 0, enable RAM
    lda #%00000000
    jmp MMC1_Page

MMC1_Page1:
    ; select bank PRG 1, enable RAM
    lda #%00000001
    jmp MMC1_Page

MMC1_Page2:
    ; select bank PRG 2, enable RAM
    lda #%00000010

MMC1_Page:
    sta $E000
    lsr a
    sta $E000
    lsr a
    sta $E000
    lsr a
    sta $E000
    lsr a
    sta $E000
    rts

MMC1_Pattern0:
    ; select CHR 0
    lda #%00000000
    jmp MMC1_Pattern

MMC1_Pattern1:
    ; select CHR 1
    lda #%00000010

MMC1_Pattern:
    sta $A000
    lsr a
    sta $A000
    lsr a
    sta $A000
    lsr a
    sta $A000
    lsr a
    sta $A000
    rts

ChangeGameState:
    lda #0
    sta gamestate_changed

    jsr MMC1_Setup_Horiz
    jsr MMC1_Page0
    jsr MMC1_Pattern0

    lda current_gamestate
    asl a
    tax

    lda GameState_InitTable, x
    sta TmpAddr
    inx
    lda GameState_InitTable, x
    sta TmpAddr+1

    jmp (TmpAddr)
    ; RTS handled in the init code

GameState_InitTable:
    .word InitTitle
    .word Credits_Init
    .word Game_Init
    .word DedInit
    .word Scores_Init
    .word InitSeed

    .include "title.asm"
    .include "title_trans.asm"
    .include "scores.asm"
    .include "utils.asm"
    .include "seed.asm"
    .include "credits.asm"
