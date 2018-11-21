InitTitle:
    ; set the draw orientation
    lda #PPU_CTRL_HORIZ
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

; Init the cursor sprite
    ; Y coord
    lda #$60
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

; RAINBOW start
    lda #$3F
    sta $2006
    lda #$00
    sta $2006

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
    lda TmpPPUAddr+1
    clc
    adc #64
    sta TmpPPUAddr+1

    lda TmpPPUAddr
    adc #0
    sta TmpPPUAddr
    jmp @menuLoopTop

@menuDone:
    tya
    sta TitleLength

    bit $2002
    lda #$22
    sta $2006
    lda #$C7
    sta $2006

    ldx #0
@seedLabelLoop:
    lda TitleSeedText, x
    beq @seedLabelDone
    sta $2007
    inx
    jmp @seedLabelLoop

@seedLabelDone:

    lda rng_seed
    jsr BinToHex
    lda TmpY
    sta $2007
    lda TmpX
    sta $2007

    lda rng_seed+1
    jsr BinToHex
    lda TmpY
    sta $2007
    lda TmpX
    sta $2007

    lda #<Frame_Title
    sta DoFramePointer
    lda #>Frame_Title
    sta DoFramePointer+1

    lda #<NMI_Title
    sta DoNMIPointer
    lda #>NMI_Title
    sta DoNMIPointer+1

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

    lda #PPU_CTRL_HORIZ
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

@t_nocolorwrap:

    ; load palette into ram
    lda TitleColor
    sta PaletteRAM+30
    sta PaletteRAM+29
    sta PaletteRAM+28

    lda #$0F
    sta PaletteRAM+31
    sta PaletteRAM+15

    lda TitleColor2
    sta PaletteRAM+14
    sta PaletteRAM+13
    sta PaletteRAM+12

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
    adc #$60
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
    jmp WaitFrame

@t_nostart:
    jmp WaitFrame

TitleText:
    .byte '"', "runner", '"', $00

TitleSeedText:
    .byte "Current seed: ", $00

TitleData:
    .byte "Start Game", $00, GS_GAME
    .byte "Enter Seed", $00, GS_SEED
    .byte "Credits", $00, GS_CREDITS
    .byte $00

TitlePalette:
    .byte $0F,$30,$30,$30, $0F,$15,$0F,$05, $0F,$15,$0F,$0F, $0F,$11,$11,$11
    .byte $0F,$10,$00,$30, $0F,$05,$05,$05, $0F,$0A,$0A,$0A, $0F,$11,$11,$11
    .byte $EA, $EA
