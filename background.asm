; all op-code based, kinda like the credits data

BG_OP_EOD       = 0
BG_OP_BYTELIST  = 1
BG_OP_RLE       = 2
BG_OP_RLE_REP   = 3 ; run length repeating
;BG_OP_ADDR      = 4
BG_OP_ATTR      = 4

bg_OPCodes:
    .word bg_op_EOD-1
    .word bg_op_ByteList-1
    .word bg_op_Runlength-1
    .word bg_op_Runlength_Repeating-1
    .word bg_op_Attribute-1

Background_Themes:
    .word bg_data_empty
    .word bg_data_City

; Increment the pointer to the theme data table (pointed to by TmpAddr).
bg_IncrementAddress:
    inc TmpAddr
    bne :+
    inc TmpAddr+1
:   rts

bg_WriteByte:
    pha
    dec TmpY
    bne @noAddrSet

    lda #12
    sta TmpY

    inc TmpX
    lda TmpX
    cmp #32
    bne @noNTChange

    ; Set second nametable
    lda #$24
    sta TmpZ

    lda #12
    sta TmpY

    lda #0
    sta TmpX

@noNTChange:
    bit $2000
    lda TmpZ
    sta $2006
    lda TmpX
    sta $2006

    clc
    adc #1
    cmp #32
    bne @noAddrSet

@noAddrSet:
    pla
    sta $2007
    rts

; Background data index in A
DrawBackground:
    asl a
    tax

    lda #PPU_CTRL_VERT
    sta $2000
    bit $2000

    lda #13
    sta TmpY    ; row - Counts down from 12. on zero, increment TmpX.

    lda #$20
    sta TmpZ    ; nametable
    sta $2006

    lda #0
    sta TmpX    ; column - max of 32 per nametable
    sta $2006

    lda Background_Themes, x
    sta TmpAddr
    lda Background_Themes+1, x
    sta TmpAddr+1

bg_Decode_Opcode:
    ; this will use the RTS trick
    ldy #0
    lda (TmpAddr), y
    asl a
    tax

    lda bg_OPCodes+1, x
    pha
    lda bg_OPCodes, x
    pha
    rts

bg_op_EOD:
    rts

bg_op_ByteList:
    jmp bg_Decode_Opcode

bg_op_Runlength:
    jsr bg_IncrementAddress
    ldy #0
    lda (TmpAddr), y
    tax
    jsr bg_IncrementAddress
    lda (TmpAddr), y
    jsr bg_IncrementAddress

:   jsr bg_WriteByte
    dex
    bne :-

    jmp bg_Decode_Opcode

bg_op_Runlength_Repeating:
    jsr bg_IncrementAddress

    ; times to repeat
    ldy #0
    lda (TmpAddr), y
    tax

    ; length of data
    jsr bg_IncrementAddress
    lda (TmpAddr), y
    sta TmpCounter

    ; start of data
    jsr bg_IncrementAddress

    ldy #0
@loop:
    lda (TmpAddr), y
    jsr bg_WriteByte
    iny
    cpy TmpCounter
    beq @nextItter
    jmp @loop

@nextItter:
    ldy #0
    dex
    bne @loop

:   jsr bg_IncrementAddress
    dec TmpCounter
    bne :-

    ;jsr bg_IncrementAddress
    jmp bg_Decode_Opcode

bg_op_Attribute:
    jsr bg_IncrementAddress

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$23
    sta $2006
    lda #$C0
    sta $2006

    lda #$FF
    ldy #0
:   sta $2007
    iny
    cpy #24
    bne :-

    lda #$27
    sta $2006
    lda #$C0
    sta $2006


    lda #$FF
    ldy #0
:   sta $2007
    iny
    cpy #24
    bne :-

    ; Load Palette
    ldy #0
    ldx #19
:   lda (TmpAddr), y
    sta PaletteRAM, x
    iny
    dex
    cpx #15
    bne :-

    rts

bg_data_City:
    .byte BG_OP_RLE, 3, $00
    .byte BG_OP_RLE, 1, $13
    .byte BG_OP_RLE_REP, 4, 2, $15, $11
    .byte BG_OP_RLE, 3, $00
    .byte BG_OP_RLE, 1, $14
    .byte BG_OP_RLE_REP, 4, 2, $16, $12
    .byte BG_OP_ATTR, $0F,$04,$34,$24

bg_data_empty:
    .byte BG_OP_RLE, 255, $00
    .byte BG_OP_RLE, 255, $00
    .byte BG_OP_RLE, 255, $00
    .byte BG_OP_RLE, 3, $00
    .byte BG_OP_ATTR, $0F,$0F,$0F,$0F
