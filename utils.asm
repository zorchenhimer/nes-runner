; Was a button pressed this frame?
ButtonPressedP1:
    lda controller1
    and btnPressedMask
    sta controllerTmp

    lda controller1_Old
    and btnPressedMask

    cmp controllerTmp
    bne btnPress_stb

    ; no button change
    rts

ButtonPressedP2:
    lda controller2
    and btnPressedMask
    sta controllerTmp

    lda controller2_Old
    and btnPressedMask

    cmp controllerTmp
    bne btnPress_stb

    ; no button change
    rts

btnPress_stb:
    ; button released
    lda controllerTmp
    bne btnPress_stc
    rts

btnPress_stc:
    ; button pressed
    lda #1
    rts

; Player input
ReadControllers:
    lda controller1
    sta controller1_Old

    lda controller2
    sta controller2_Old

    ; Freeze input
    lda #1
    sta $4016
    lda #0
    sta $4016

    LDX #$08
@player1:
    lda $4016
    lsr A           ; Bit0 -> Carry
    rol controller1 ; Bit0 <- Carry
    dex
    bne @player1

    ldx #$08
@player2:
    lda $4017
    lsr A           ; Bit0 -> Carry
    rol controller2 ; Bit0 <- Carry
    dex
    bne @player2
    rts

LoadPalettes:
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

UpdatePalettes:
    bit $2002

    lda #PPU_CTRL_HORIZ
    sta $2000

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

ClearSprites:
    ldx #$00
@loop:
    lda #$00
    sta $0200, x
    inx
    bne @loop
    rts

