; asmsyntax=ca65

CLEAR_ATTR_ID = $00

; Was a button pressed this frame?
ButtonPressedP1:
    sta btnPressedMask

    and controller1
    sta controllerTmp

    lda controller1_Old
    and btnPressedMask

    cmp controllerTmp
    bne btnPress_stb

    ; no button change
    rts

ButtonPressedP2:
    sta btnPressedMask

    and controller2
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

; Load a single four-byte palette into RAM.  Palette address
; is expected in TmpAddr.
LoadPaletteBG0:
    ldx #31
    jmp loadSinglePalLoop

LoadPaletteBG1:
    ldx #27
    jmp loadSinglePalLoop

LoadPaletteBG2:
    ldx #23
    jmp loadSinglePalLoop

LoadPaletteBG3:
    ldx #19
    jmp loadSinglePalLoop

LoadPaletteSP0:
    ldx #15
    jmp loadSinglePalLoop

LoadPaletteSP1:
    ldx #11
    jmp loadSinglePalLoop

LoadPaletteSP2:
    ldx #7
    jmp loadSinglePalLoop

LoadPaletteSP3:
    ldx #3
    ;jmp loadSinglePalLoop  ; jmp not really needed.

loadSinglePalLoop:
    ldy #0
:
    lda (TmpAddr), y
    sta PaletteRAM, x
    dex
    iny
    cpy #4
    bne :-
    rts

; Load a full set of eight palettes into RAM.  Palette address is
; expected in PaletteAddr.
; TODO: Change this to use TmpAddr
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

ClearSprites:
    ldx #$00
    lda #$00
@loop:
.repeat 4
    sta $0200, x
    inx
.endrepeat
    bne @loop
    rts

FillNametable0:
    sta clear_nt_tile

    bit $2002
    lda #$20
    sta $2006
    jmp utils_ClearNametable

FillNametable1:
    sta clear_nt_tile

    bit $2002
    lda #$24
    sta $2006
    jmp utils_ClearNametable

FillNametable2:
    sta clear_nt_tile

    bit $2002
    lda #$28
    sta $2006
    jmp utils_ClearNametable

FillNametable3:
    sta clear_nt_tile

    bit $2002
    lda #$2C
    sta $2006
    jmp utils_ClearNametable

ClearNametable0:
    lda #CLEAR_TILE_ID
    sta clear_nt_tile

    bit $2002
    lda #$20
    sta $2006
    jmp utils_ClearNametable

ClearNametable1:
    lda #CLEAR_TILE_ID
    sta clear_nt_tile

    bit $2002
    lda #$24
    sta $2006
    jmp utils_ClearNametable

ClearNametable2:
    lda #CLEAR_TILE_ID
    sta clear_nt_tile

    bit $2002
    lda #$28
    sta $2006
    jmp utils_ClearNametable

ClearNametable3:
    lda #CLEAR_TILE_ID
    sta clear_nt_tile

    bit $2002
    lda #$2C
    sta $2006
    jmp utils_ClearNametable

utils_ClearNametable:
    lda #00
    sta $2006

    ldx #30
    lda clear_nt_tile
@loop2:
.repeat 32
    sta $2007
.endrepeat
    dex
    bne @loop2
    rts

ClearAttrTable0:
    bit $2002
    lda #$23
    sta $2006
    jmp utils_ClearAttrTable

ClearAttrTable1:
    bit $2002
    lda #$27
    sta $2006
    jmp utils_ClearAttrTable

ClearAttrTable2:
    bit $2002
    lda #$2B
    sta $2006
    jmp utils_ClearAttrTable

ClearAttrTable3:
    bit $2002
    lda #$2F
    sta $2006
    jmp utils_ClearAttrTable

utils_ClearAttrTable:
    lda #$C0
    sta $2006
    ldx #8
    lda #$00
@loop:
.repeat 8
    sta $2007
.endrepeat
    dex
    bne @loop
    rts

; Binary value in A, ASCII Hex values output in TmpX and TmpY
BinToHex:
    ; TmpX "rng_result"
    ; TmpY "rng_text"
    ;lda rng_seed
    sta TmpX
    lda #0
    sta TmpY

@tens:
    lda TmpX
    cmp #$10
    bcs @addtens
    jmp @ones

@addtens:
    inc TmpY
    sec
    sbc #$10
    sta TmpX
    jmp @tens

@ones:
    lda TmpY
    clc
    adc #$30
    cmp #$3A
    bcc @ynoletter
    adc #$06
@ynoletter:
    sta TmpY

    lda TmpX
    clc
    adc #$30
    cmp #$3A
    bcc @xnoletter
    adc #$06
@xnoletter:
    sta TmpX
    rts

; Draw a number of tiles.
; Start value is in X
; Length in Y
DrawSequential:
    stx $2007
    inx
    dey
    bne DrawSequential
    rts
