TITLE_SPTOP     = $48

InitTitle:
    ; set the draw orientation
    lda #PPU_CTRL_TITLE
    sta $2000

    lda #PPU_MASK_OFF
    sta $2001
    inc SkipNMI

; Load the title palette's ROM addr
    lda #<TitlePalette
    sta PaletteAddr
    lda #>TitlePalette
    sta PaletteAddr+1

    ; Then load ROM -> RAM
    jsr LoadPalettes
    jsr UpdatePalettes

    lda #0
    sta TitleIndex

    jsr ClearSprites
    jsr ClearNametable0
    jsr ClearAttrTable0

    lda #$26
    sta bg_ZNT1

    lda #$22
    sta bg_ZNT0

    lda #$40
    sta bg_XStart

    lda #$60
    sta bg_XNTSwitch

    lda #$23
    sta bg_TransHigh0

    lda #$27
    sta bg_TransHigh1

    lda #$A0
    sta bg_TransLow

    lda #0
    jsr DrawBackground

; Attributes for skyline
    lda #$23
    sta $2006
    lda #$E0
    sta $2006

    ldx #32
    lda #$55
:   sta $2007
    dex
    bne :-

; Init the cursor sprite
    ; Y coord
    lda #TITLE_SPTOP
    sta SP_TITLEY0
    sta SP_TITLEY1

    ; X coord
    lda #$4E
    sta SP_TITLEX0
    lda #$56
    sta SP_TITLEX1

    ; no attributes
    lda #$00
    sta SP_TITLEATTR0
    sta SP_TITLEATTR1

    ; '->'
    lda #$01        ; '-'
    sta SP_TITLETILE0
    lda #$02        ; '>'
    sta SP_TITLETILE1

    ; Sprite Zero
    lda #135
    sta SPZ_Y
    lda #$F8
    sta SPZ_X
    lda #3
    sta SPZ_IDX
    lda #3
    sta SPZ_ATT

; RAINBOW start
    lda #$11
    sta TitleColor

    lda #$1C
    sta TitleColor2
; /RAINBOW

    ; Draw Title
    lda #$20
    sta $2006
    lda #$CA
    sta $2006

    ldx #0
@loop2:
    lda TitleText, x
    beq @titleTextDone
    sta $2007
    inx
    jmp @loop2
@titleTextDone:

    lda #$21
    sta TmpAddr
    lda #$2C
    sta TmpAddr+1

    ; Draw menu items
    ldx #0
    ldy #0
@menuLoopTop:
    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006

    ; next letter
@menuLoopText:
    lda TitleData, x
    beq @textDone

    sta $2007
    inx
    jmp @menuLoopText

@textDone:
    ; Load gamestate into array in RAM
    inx
    lda TitleData, x
    sta TitleGameStates, y
    iny

    ; peek next byte for NUL byte
    inx
    lda TitleData, x
    beq @menuDone

    ; go to the next line of text on screen
    lda TmpAddr+1
    clc
    adc #64
    sta TmpAddr+1

    lda TmpAddr
    adc #0
    sta TmpAddr
    jmp @menuLoopTop

@menuDone:
    tya
    sta TitleLength

    lda #$22
    sta $2006
    lda #$3F
    sta $2006
    lda #$0F
    sta $2007

    lda #<Frame_Title
    sta DoFramePointer
    lda #>Frame_Title
    sta DoFramePointer+1

    lda #<NMI_Title
    sta DoNMIPointer
    lda #>NMI_Title
    sta DoNMIPointer+1

    ; reset scroll
    bit $2002
    lda #$00
    sta $2005
    sta $2005

    dec TurnPPUOn
    rts

NMI_Title:
    bit $2002
    lda #0
    sta $2005
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000

    jmp NMI_Finished

Frame_Title:
    ; only update colors every other frame
    lda frame_odd
    beq @t_nocolorwrap

    inc TitleColor
    dec TitleColor2
    lda TitleColor
    cmp #$1D
    bne @t_nocolorwrap
    lda #$11
    sta TitleColor
    lda #$1C
    sta TitleColor2

;    lda $03A8
;    cmp #$24
;    beq @b24
;    lda #$24
;    sta $03A8
;
;    jmp @bb
;@b24:
;    lda #$30
;    sta $03A8
;@bb:

@t_nocolorwrap:

    ; load palette into ram
    lda TitleColor
    sta PaletteRAM+30

    lda #$0F
    sta PaletteRAM+31

    lda TitleColor2
    sta PaletteRAM+14

    lda #BUTTON_SELECT
    jsr ButtonPressedP1
    beq @t_noselect

    inc TitleIndex
    lda TitleIndex
    cmp TitleLength
    bcc @t_sel_nowrap

    ; wrap the index around to zero
    lda #0
    sta TitleIndex

@t_sel_nowrap:
    ; calculate Y for cursor
    lda TitleIndex
    asl a
    asl a
    asl a
    asl a
    clc
    adc #TITLE_SPTOP
    sta SP_TITLEY0
    sta SP_TITLEY1

@t_noselect:

    lda frame_odd
    bne @tf_setev

    lda #1
    sta frame_odd
    jmp @tf_wot
@tf_setev:
    lda #0
    sta frame_odd

@tf_wot:
    lda #BUTTON_START
    jsr ButtonPressedP1
    beq @t_nostart

    ldx TitleIndex
    lda TitleGameStates, x
    sta current_gamestate
    inc gamestate_changed

@t_nostart:
    bit $2002
    bvs @t_nostart

:   bit $2002
    bvc :-

    lda #PPU_CTRL_HORIZ
    sta $2000
    jmp WaitFrame

TitleText:
    .byte '"', "runner", '"', $00

TitleSeedText:
    .byte "Current seed: ", $00

TitleData:
    .byte "Start Game", $00, GS_GAME
    .byte "Enter Seed", $00, GS_SEED
    .byte "High Scores", $00, GS_HIGHSCORE
    .byte "Credits", $00, GS_CREDITS
    .byte $00

Title_BG1:
    .byte $D0, $D4, $D0, $D4, $D0, $D4
Title_BG2:
    .byte $DF, $D1, $D5, $D1, $D5, $D1, $D5
Title_BG3:
    .byte $D7, $D6, $DA, $D6, $DA, $D6, $DA, $D6, $DA
Title_BG4:
    .byte $DD, $DB, $D8, $D9, $D8, $D9, $D8, $D9, $03

Title_BG5:
    .byte $D2, $D0, $D4, $D0, $D4, $D0, $D4, $D0, $D4
Title_BG6:
    .byte $D3, $D1, $D5, $D1, $D5, $D1, $D5, $D1, $D5

TitlePalette:
    .byte $0F,$30,$30,$30, $0F,$04,$34,$0F, $0F,$15,$0F,$0F, $0F,$11,$11,$11
    .byte $0F,$10,$00,$30, $0F,$05,$05,$05, $0F,$0A,$0A,$0A, $0F,$0F,$11,$11
    .byte $EA, $EA
