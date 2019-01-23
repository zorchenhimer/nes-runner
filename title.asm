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

    lda #$FF
    sta bg_ZNT1

    lda #$28
    sta bg_ZNT0

    lda #$00
    sta bg_XStart

    lda #$20
    sta bg_XNTSwitch

    lda #$29
    sta bg_TransHigh0

    lda #$27
    sta bg_TransHigh1

    lda #$60
    sta bg_TransLow

    lda #0
    jsr DrawBackground

; Attributes for skyline
    lda #$2B
    sta $2006
    lda #$C0
    sta $2006

    ldx #24
    lda #$55
:   sta $2007
    dex
    bne :-

    ;lda #$2B
    ;sta $2006
    ;lda #$D8
    ;sta $2006

    ldx #8
    lda #$AA
:   sta $2007
    dex
    bne :-

    ldx #8
    lda #$FF
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
    lda #$88
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
    lda #$22
    sta $2006
    lda #$4A
    sta $2006

    ldx #0
@loop2:
    lda TitleText, x
    beq @titleTextDone
    sta $2007
    inx
    jmp @loop2
@titleTextDone:

    lda #$22
    sta TmpAddr
    lda #$AD
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

    ; Tile for sprite zero hit
    lda #$23
    sta $2006
    lda #$BF
    sta $2006
    ;lda #$0F
    lda #$20
    sta $2007

    ; Draw blank playfield
    lda #$29
    sta $2006
    lda #$80
    sta $2006

; Sky metatiles
    ldx #16
:
    lda Meta_Sky+0
    sta $2007
    lda Meta_Sky+2
    sta $2007
    dex
    bne :-

    ldx #16
:
    lda Meta_Sky+1
    sta $2007
    lda Meta_Sky+3
    sta $2007
    dex
    bne :-

    ldx #16
:
    lda Meta_Sky+0
    sta $2007
    lda Meta_Sky+2
    sta $2007
    dex
    bne :-

    ldx #16
:
    lda Meta_Sky+1
    sta $2007
    lda Meta_Sky+3
    sta $2007
    dex
    bne :-

; Ground metatiles
    ldx #16
:
    lda Meta_Ground+0
    sta $2007
    lda Meta_Ground+2
    sta $2007
    dex
    bne :-

    ldx #16
:
    lda Meta_Ground+1
    sta $2007
    lda Meta_Ground+3
    sta $2007
    dex
    bne :-

    ldx #16
:
    lda Meta_Ground+0
    sta $2007
    lda Meta_Ground+2
    sta $2007
    dex
    bne :-

    ldx #16
:
    lda Meta_Ground+1
    sta $2007
    lda Meta_Ground+3
    sta $2007
    dex
    bne :-

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
    lda #95
    sta $2005

    dec TurnPPUOn
    rts

NMI_Title:
    bit $2002
    lda #0
    sta $2005
    lda #95
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000

    jmp NMI_Finished

title_Colors:
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

@t_nocolorwrap:

    ; load palette into ram
    lda TitleColor
    sta PaletteRAM+30

    ;lda #$0F
    ;sta PaletteRAM+31

    lda TitleColor2
    sta PaletteRAM+14

    lda frame_odd
    bne @tf_setev

    lda #1
    sta frame_odd
    jmp @tf_wot
@tf_setev:
    lda #0
    sta frame_odd

@tf_wot:
    rts

Frame_Title:
    jsr title_Colors

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

    lda #BUTTON_START
    jsr ButtonPressedP1
    beq t_nostart

    ldx TitleIndex
    lda TitleGameStates, x
    sta current_gamestate
    cmp #GS_GAME
    beq Title_GameTrans
    inc gamestate_changed

t_nostart:
    bit $2002
    bvs t_nostart

:   bit $2002
    bvc :-

    lda #PPU_CTRL_HORIZ
    sta $2000
    jmp WaitFrame

Title_GameTrans:
    lda #95
    sta TitleScroll

    lda #PPU_CTRL_HORIZ
    sta TitlePPUCtrl

    lda #<Title_Trans_Frame_Fading
    sta DoFramePointer
    lda #>Title_Trans_Frame_Fading
    sta DoFramePointer+1

    lda #<Title_Trans_NMI
    sta DoNMIPointer
    lda #>Title_Trans_NMI
    sta DoNMIPointer+1

Title_Trans_Frame_Fading:
    lda TitleColor
    cmp #$1C
    beq :+
    jsr title_Colors
    jmp t_nostart
:
    lda frame_odd
    beq :+
    lda #$0C
    sta PaletteRAM+30
    lda #$01
    sta PaletteRAM+14

    lda #<Title_Trans_Frame_Scrolling
    sta DoFramePointer
    lda #>Title_Trans_Frame_Scrolling
    sta DoFramePointer+1

:   lda #$FF
    sta frame_odd
    jmp t_nostart
    ;jmp WaitFrame

Title_Trans_Frame_Scrolling:
    lda #$1F
    sta PaletteRAM+30
    sta PaletteRAM+14

    lda #$00
    sta SP_TITLETILE0
    sta SP_TITLETILE1

    lda frame_odd
    beq :+
    lda #$00
    sta frame_odd
    jmp :++

:   lda #$FF
    sta frame_odd
    inc TitleScroll
    dec SPZ_Y
    lda SPZ_Y

:   lda TitleScroll
    cmp #$E8
    bne :+

    lda #<Title_Trans_Frame_Load
    sta DoFramePointer
    lda #>Title_Trans_Frame_Load
    sta DoFramePointer+1

    lda #0
    sta TitleScroll
    lda #PPU_CTRL_HORIZ
    ora #$02
    sta TitlePPUCtrl

:   jmp t_nostart
    ;jmp WaitFrame

Title_Trans_Frame_Load:
    inc gamestate_changed
    jmp WaitFrame

Title_Trans_NMI:
    bit $2002
    lda #0
    sta $2005
    lda TitleScroll
    sta $2005

    lda TitlePPUCtrl
    sta $2000
    jmp NMI_Finished

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
    .byte $1A,$30,$21,$15, $1A,$04,$34,$0F, $1A,$0A,$39,$06, $1A,$17,$25,$35
    .byte $1A,$10,$00,$30, $1A,$05,$05,$05, $1A,$0A,$0A,$0A, $1A,$0F,$11,$11
    .byte $EA, $EA
