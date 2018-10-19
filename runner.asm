.case -

; TODO
;   Title Screen
;       start with "start", "high scores", and maybe "credits"
;       make this menu easily extensible
;   Player Sprite
;       Simple jump physics (collision can come later)
;   Better map generation
;   Background art (mountains or some shit.  happy little trees?)
;   Score display
;       include distance/timer?
;   High Scores table
;   Sound engine

.include "nes2header.inc"
nes2mapper 1
nes2prg 4 * 16 * 1024
nes2chr 2 *  8 * 1024
nes2bram 1 * 8 * 1024
nes2mirror 'V'
nes2tv 'N'
nes2end

.segment "PATTERN0"
    .incbin "runner.chr"

.segment "PATTERN1"
    .incbin "credits.chr"

.segment "VECTORS"
    .word NMI
    .word RESET
    .word IRQ

.segment "ZEROPAGE"
    .include "utils_ram.asm"
    .include "credits_ram.asm"

sleeping:       .res 1
nmi_draw:       .res 1

map_column_addr:    .res 2  ; start address of the meta_columns
meta_tile_addr:     .res 2  ; tiles that make up the meta tile (eg Meta_Sky, Meta_Ground, etc)
meta_tile_id:       .res 1
obs_countdown:      .res 1  ; obstacle countdown

calc_scroll:        .res 1
coarse_scroll:      .res 1
fine_scroll:        .res 1

meta_column_offset: .res 1  ; meta tile column wraps at 32
last_meta_offset:   .res 1  ; used to determine if rng is needed
map_meta_tmp:       .res 1
rng_result:         .res 1

gamestate_changed:  .res 1
current_gamestate:  .res 1
GS_TITLE        = 0
GS_GAME         = 1
GS_DED          = 2
GS_HIGHSCORE    = 3
GS_CREDITS      = 4

PauseOn:        .res 1
PauseOff:       .res 1
SkipNMI:        .res 1
VertDraw:       .res 1

PaletteAddr:    .res 2
TmpCounter:     .res 1
TmpPPUAddr:     .res 2

TitleColor:     .res 1  ; current color, lol
TitleGameStates:.res 10 ; list of gamestates

PPU_CTRL_VERT   = %10010100
PPU_CTRL_HORIZ  = %10010000

; no emphasize colors, show bg & sprites,
; show left 8px bg & sprite, no grayscale
PPU_MASK        = %00011110

; no drawing
PPU_MASK_OFF    = %00000110

PAGEID_GAME     = 0
PAGEID_CREDITS  = 1
PAGEID_IDK      = 2

.segment "SAVERAM"
    ; battery backed RAM

rng_seed:       .res 2
; eventually high scores too

.segment "BSS"
    ; non-zeropage ram

meta_columns:       .res 128
tile_column_buffer: .res 16
PaletteRAM:         .res 32

.segment "OAM"
    ; sprite stuff
sprites:            .res 256

.segment "PAGE0"
    ; main game
    .byte $00   ; current Page ID
    .include "game.asm"

.segment "PAGE1"
    ; credits
    .byte $01   ; current Page ID
    .include "credits.asm"

.segment "PAGE2"
    ; ???
    .byte $02

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
    jsr MMC1_Setup
    jsr MMC1_Page0

    lda #0
    sta current_gamestate
    jsr ChangeGamestate

DoFrame:
    jsr ReadControllers
    lda current_gamestate
    beq @title

    cmp #GS_CREDITS
    beq @credits

    cmp #GS_DED
    beq @ded
    bcs @highscore

    ; less than (GS_GAME)
    jsr FrameStart
    jmp WaitFrame

@credits:
    lda #BUTTON_A
    sta btnPressedMask
    jsr ButtonPressedP1
    beq WaitFrame

    lda #GS_TITLE
    sta current_gamestate
    inc gamestate_changed
    jmp WaitFrame

@title:

    inc TitleColor
    lda TitleColor
    cmp #$1D
    bne @t_nocolorwrap
    lda #$11
    sta TitleColor

@t_nocolorwrap:

    ; load palette into ram
    lda TitleColor
    sta PaletteRAM+30
    sta PaletteRAM+29
    sta PaletteRAM+28

    lda #$0F
    sta PaletteRAM+31

    lda #BUTTON_START
    sta btnPressedMask
    jsr ButtonPressedP1
    beq @t_nostart

    lda #GS_GAME
    sta current_gamestate
    inc gamestate_changed
    jmp WaitFrame

@t_nostart:
    lda #BUTTON_A
    sta btnPressedMask
    jsr ButtonPressedP1
    beq WaitFrame

    lda #GS_CREDITS
    sta current_gamestate
    inc gamestate_changed
    jmp WaitFrame

@ded:
    nop
    jmp WaitFrame

@highscore:
    nop
    jmp WaitFrame

WaitFrame:
    lda gamestate_changed
    beq @nochange

    lda #0
    sta gamestate_changed
    jsr ChangeGameState

@nochange:
    lda #1
    sta sleeping
    ;inc sleeping
@loop:
    lda sleeping
    bne @loop
    jmp DoFrame

NMI:
    pha
    txa
    pha
    tya
    pha
    lda SkipNMI
    bne @end

    jsr UpdatePalette

    ; Write sprites to PPU
    bit $2002
    lda #$00
    sta $2003
    lda #$02
    sta $4014

    ; Scroll
    lda current_gamestate
    cmp #GS_GAME
    bne @ScreenA
    jsr Draw_Column
    jsr update_scroll

    jmp @after_scroll

@ScreenA:
    bit $2000
    lda #0
    sta $2005
    sta $2005

    lda #PPU_CTRL_HORIZ
    sta $2000

@after_scroll:
@end:
    lda #0
    sta sleeping
    pla
    tay
    pla
    tax
    pla
    rti

IRQ:
    rti

DrawHoriz:
    lda #0
    sta VertDraw

    lda #PPU_CTRL_HORIZ
    sta $2000
    rts

DrawVert:
    lda #1
    sta VertDraw

    lda #PPU_CTRL_VERT
    sta $2000
    rts

MMC1_Setup:
    ;lda #80
    ;sta $8000
    ; control stuff
    ; vertical mirroring, switchable $8000, fixed $C000, chr 8k
    ; %0000 1110
    lda #%00001110
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
    ;lda #80
    ;sta $8000
    ; select bank PRG 0, enable RAM
    lda #%00000000
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

MMC1_Page1:
    ;lda #80
    ;sta $8000
    ; select bank PRG 1, enable RAM
    lda #%00000001
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

MMC1_Page2:
    ;lda #80
    ;sta $8000
    ; select bank PRG 2, enable RAM
    lda #%00000010
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
    ;lda #80
    ;sta $8000
    lda #%00000000
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

MMC1_Pattern1:
    ;lda #80
    ;sta $8000
    lda #%00000010
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

    lda current_gamestate
    beq @title

    cmp #GS_CREDITS
    beq @credits

    ;lda CurrentPage
    lda $8000
    cmp #PAGEID_GAME
    beq @noswap
    jsr MMC1_Page0

@noswap:
    cmp #GS_DED
    beq @ded
    bcs @highscore

    jsr MMC1_Pattern0
    ; GS_GAME
    jmp Game_Init

@ded:
    jmp DedInit

@highscore:
    jmp HSInit

@credits:

    jsr MMC1_Page1
    jsr MMC1_Pattern1
    jmp Credits_Init

@title:
    jsr MMC1_Pattern0
    ;; Init title
    jmp InitTitle

InitTitle:
    jsr DrawHoriz

    lda #PPU_MASK_OFF
    sta $2001
    inc SkipNMI

    lda #<TitlePalette
    sta PaletteAddr
    lda #>TitlePalette
    sta PaletteAddr+1

    jsr LoadPalette

    lda #$3F
    sta $2006
    lda #$00
    sta $2006

    ;lda #0F
    ;sta TitleColor_0F
    lda #$11
    sta TitleColor
    ;sta TitleColor+1
    ;sta TitleColor+2

    lda #$0F
    sta $2007
    lda #$11
    sta $2007
    lda #$11
    sta $2007
    lda #$11
    sta $2007

    lda #$20
    sta $2006
    lda #$00
    sta $2006

    ldx #0
    ldy #0
    lda #' '
@loop:
    sta $2007
    inx
    cpx #$20
    bne @loop

    iny
    ldx #0
    cpy #$1E
    bne @loop

    lda #$20
    sta $2006
    lda #$CA
    sta $2006

    lda TitleText
    sta TmpCounter
    inc TmpCounter
    ldx #1
@loop2:
    lda TitleText, x
    sta $2007
    inx
    dec TmpCounter
    bne @loop2

    lda #$21
    sta TmpPPUAddr
    lda #$8C
    sta TmpPPUAddr+1


    ; Draw menu items
    ldx #0
    ldy #0
@menuLoopTop:
    lda TmpPPUAddr
    sta $2006
    lda TmpPPUAddr+1
    sta $2006

    ; next letter
@menuLoopText:
    lda TitleData, x
    beq @textDone

    sta $2007
    inx
    jmp @menuLoopText

@textDone:
    inx
    lda TitleData, x
    sta TitleGameStates, y
    iny

    inx
    lda TitleData, x
    beq @menuDone

    ; go to the next line of text on screen
    lda TmpPPUAddr+1
    clc
    adc #64
    sta TmpPPUAddr+1

    lda TmpPPUAddr
    adc #0
    sta TmpPPUAddr
    jmp @menuLoopTop

@menuDone:

    lda #PPU_MASK
    sta $2001

    bit $2002
    lda #$00
    sta $2005
    sta $2005

    lda #0
    sta SkipNMI
    rts

TitleText:
    .byte $07, $22, "runner", $22

LoadPalette:
    ldx #31
    ldy #0
@loop:
    lda (PaletteAddr), y
    sta PaletteRAM, x
    dex
    iny
    cpy #32
    bne @loop
    rts

UpdatePalette:
    jsr DrawHoriz

    lda #$3F
    sta $2006
    lda #$00
    sta $2006
    ldx #31
@loop:
    lda PaletteRAM, x
    sta $2007
    dex
    bne @loop

    lda PaletteRAM
    sta $2007
    rts

TitleData:
    .byte "Start Game", $00, GS_GAME
    .byte "Credits", $00, GS_CREDITS
    .byte $00

TitlePalette:
    .byte $0F,$11,$14,$0F, $0F,$15,$0F,$05, $0F,$15,$0F,$0F, $0F,$11,$11,$11
    .byte $0F,$10,$00,$30, $0F,$05,$05,$05, $0F,$0A,$0A,$0A, $0F,$11,$11,$11

    .include "utils.asm"
