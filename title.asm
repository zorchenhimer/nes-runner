; asmsyntax=ca65

TITLE_SPTOP     = $48

InitTitle:

    ; Ignore input the next five frames (that it is checked)
    lda #5
    sta IgnoreInput

    ; set the draw orientation
    lda #PPU_CTRL_TITLE
    sta $2000

    lda #PPU_MASK_OFF
    sta $2001
    inc SkipNMI

    jsr ClearSprites

    bit $2002
    lda #$3F
    sta $2006
    lda #$00
    sta $2006
    lda #$0F
    sta $2007

    lda #$21
    sta $2006
    lda #$80
    sta $2006

    lda #$20
    ldx #18
:
.repeat 32
    sta $2007
.endrepeat
    dex
    bne :-

; Load the title palette's ROM addr
    lda #<TitlePalette
    sta PaletteAddr
    lda #>TitlePalette
    sta PaletteAddr+1

    ; Then load ROM -> RAM
    jsr LoadPalettes
    ;jsr WritePalettes

    lda #0
    sta TitleIndex

    jsr ClearSprites
    jsr ClearAttrTable0
    jsr ClearAttrTable2

; Draw the visible Skyline
    lda #BackgroundThemes::City
    sta BGTheme

    lda #$28
    sta BGNametable

    lda #$00
    sta BGYStart
    jsr DrawBackground

; Draw the offscreen skyline
    lda #$20
    sta BGNametable

    lda #$00
    sta BGYStart
    jsr DrawBackground

; Attributes for skyline
    lda #$23
    sta $2006
    lda #$D8
    sta $2006

    lda #$55
.repeat 32
    sta $2007
.endrepeat

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

    lda TitleData, x
    beq @menuDone   ; null terminated table (in the index column)

    sta TmpX    ; start tile index
    inx
    lda TitleData, x
    sta TmpY
    inx
    lda TitleData, x
    sta TitleGameStates, y
    inx
    iny

    ; next letter
@menuLoopText:
    lda TmpX
    sta $2007
    inc TmpX
    dec TmpY
    bne @menuLoopText

    ;jmp @menuLoopTop

@textDone:
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
    lda #$0F
    ;lda #$20
    sta $2007

    lda #$29
    sta $2006
    lda #$80
    sta $2006
    lda #$20
    ldx #18
:
.repeat 32
    sta $2007
.endrepeat
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
    rts

NMI_Title:

    jsr WritePalettes
    jsr WriteSprites

    ; Scroll half way down the screen
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
    sta PaletteRAM+26

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

; Move selection up
t_sel_up:
    dec TitleIndex
    bpl :+

    ; Wrap around to end
    lda TitleLength
    sec
    sbc #1
    sta TitleIndex

:   rts

; Move selection down
t_sel_down:
    inc TitleIndex
    lda TitleIndex
    cmp TitleLength
    bcc :+

    ; wrap the index around to zero
    lda #0
    sta TitleIndex

:   rts

t_sel_go:
    ldx TitleIndex
    lda TitleGameStates, x
    sta current_gamestate
    cmp #STATES::GS_GAME
    beq @trans
    inc gamestate_changed
    rts
@trans:
    jmp Title_GameTrans

; This is the default frame
Frame_Title:
    jsr title_Colors

    lda #BUTTON_START
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_go
    jmp @button_done

:   lda #BUTTON_A
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_go
    jmp @button_done

:   lda #BUTTON_UP
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_up
    jmp @button_done

:   lda #BUTTON_DOWN
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_down
    jmp @button_done

:   lda #BUTTON_SELECT
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_down

:
@button_done:
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

t_spritezero:
    bit $2002
    bvs t_spritezero

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
    ; Start tile id, length, game state
    .byte $56, 9, STATES::GS_GAME  ; Start Game
    .byte $44, 9, STATES::GS_SEED
    .byte $30, 9, STATES::GS_HIGHSCORE
    .byte $1A, 6, STATES::GS_CREDITS
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
    ; Background
    .byte $0F,$0F,$0F,$0F
    .byte $0F,$17,$25,$09
    .byte $0F,$16,$39,$06
    .byte $0F,$30,$21,$15

    ; Sprites
    .byte $0F,$10,$00,$30
    .byte $0F,$05,$05,$05
    .byte $0F,$0A,$0A,$0A
    .byte $0F,$0F,$11,$11

    .byte $EA, $EA
