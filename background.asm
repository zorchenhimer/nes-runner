; Master id of themes
Background_Themes:
    .word bg_data_City

; Lookup table of lookup tables
Background_Theme_Lookups:
    .word bg_meta_City_Lookup

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
    cmp bg_XNTSwitch ;#32
    bne @noNTChange

    ; Set second nametable
    lda bg_ZNT1
    sta TmpZ

    lda #12
    sta TmpY

    lda bg_XStart
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

    lda bg_ZNT0
    sta TmpZ    ; nametable
    sta $2006

    lda bg_XStart
    sta TmpX    ; column - max of 32 per nametable
    sta $2006

    ; Load up the pointer to the column metadata
    lda Background_Themes, x
    sta bg_data_pointer
    lda Background_Themes+1, x
    sta bg_data_pointer+1

    ; Load up the pointer to the meta column lookup table
    lda Background_Theme_Lookups, x
    sta bg_lookup_pointer
    lda Background_Theme_Lookups+1, x
    sta bg_lookup_pointer+1

    lda #0
    sta frame_odd
    sta TmpCounter
@bg_loop:
    ldy TmpCounter
    lda frame_odd
    beq @firstHalf
    ; second half of data byte

    ; load column metadata id
    ; eg, an ID out of the bg_data_City table
    lda (bg_data_pointer), y
    and #$0F
    asl a   ; offset for a word table
    tay
    jmp @readData

@firstHalf:
    lda (bg_data_pointer), y
    and #$F0
    lsr a   ; offset for a word table
    lsr a
    lsr a
    tay

@readData:
    ; Lookup the ID from above in bg_meta_City_Lookup table
    lda (bg_lookup_pointer), y
    tax
    iny
    lda (bg_lookup_pointer), y
    tay

    ; Save the pointer to the meta column definition
    ; (eg, the address for bg_meta_City_02)
    txa
    sta bg_lookup_data_pointer
    tya
    sta bg_lookup_data_pointer+1

    ; Draw a column of 11 (+1 duplicate) tiles
    jsr bg_DrawColumn

    lda frame_odd
    bne @IncIndex
    lda #1
    sta frame_odd
    jmp @bg_loop

@IncIndex:
    lda #0
    sta frame_odd

    ; Draw 64 columns of tiles
    inc TmpCounter
    ldy TmpCounter
    cpy #32
    bne @bg_loop

    lda #PPU_CTRL_HORIZ
    sta $2000

    ; Load up the palette
    ldx #31
:
    lda (bg_data_pointer), y
    sta PaletteRAM, x
    dex
    iny
    cpy #36
    bne :-

; This is the transition row, but I cannot assign a palette to it
; because it doesn't align with the attribute table.  Instead,
; use the last (unused) byte of the background palette.
    bit $2002
    lda bg_TransHigh0
    sta $2006
    lda bg_TransLow
    sta $2006

    lda (bg_data_pointer), y
    sta TmpCounter
    ldx #16
@transitionLoop:

    ldy TmpCounter
    tya
    sta $2007
    iny
    tya
    sta $2007
    iny
    tya
    sta $2007
    iny
    tya
    sta $2007


    cpx #9
    beq @secondNT

    dex
    bne @transitionLoop
    rts

@secondNT:
    ; on the second nametable
    dex

    bit $2002
    lda bg_TransHigh1
    sta $2006
    lda bg_TransLow
    sta $2006
    jmp @transitionLoop

; Draw a column of 11 (+1 duplicate) tiles
bg_DrawColumn:
    ; Load up the CHR row
    ldy #0
    lda (bg_lookup_data_pointer), y
    and #$F0
    sta bg_tile_row

    ; Reload tile and draw it
    lda (bg_lookup_data_pointer), y

    jsr bg_WriteByte

    ; Unpack tiles and OR them with the CHR row
    ; id to get the real tile ID
    iny
@loop:
    ; First half of byte
    lda (bg_lookup_data_pointer), y
    and #$F0

    ; shift to prep OR'ing with CHR row
    lsr a
    lsr a
    lsr a
    lsr a

    ora bg_tile_row     ; get real tile ID
    jsr bg_WriteByte    ; draw it

    ; Second half of byte
    lda (bg_lookup_data_pointer), y
    and #$0F
    ora bg_tile_row     ; get real tile ID
    jsr bg_WriteByte    ; draw it
    iny

    ; six total bytes of data
    cpy #6
    bne @loop

    ; Redraw the last byte.  This will be overwritten eventually.
    jmp bg_WriteByte
    ;rts

; Meta rows
;   Define a column of tiles.  Reference these columns in the data.
;       16 possible columns ($00-$0F), each 11 tiles high (5.5 bytes).
;   Define a transition row of 2 or 4 tiles.  These tiles will repeat.
;   First byte, first half is row of CHR. second byte is first tile.
;   Five more bytes of two tiles each.
;   Last tile row is drawn as one "transition line" between the background and forground.

; pointed to by bg_lookup_data_pointer
bg_meta_City_A_Left:    .byte $10, $00, $01, $AB, $23, $AB
bg_meta_City_A_Right:   .byte $20, $00, $01, $AB, $23, $AB
bg_meta_City_03:        .byte $10, $00, $00, $15, $45, $45 ;, [...]
bg_meta_City_B_Left:    .byte $10, $06, $78, $98, $98, $98
bg_meta_City_B_Right:   .byte $20, $06, $78, $98, $98, $98
bg_meta_City_C_Left:    .byte $10, $67, $89, $89, $89, $89
bg_meta_City_C_Right:   .byte $20, $67, $89, $89, $89, $89
bg_meta_City_D_Left:    .byte $30, $00, $00, $00, $12, $12
bg_meta_City_D_Right:   .byte $40, $00, $00, $34, $12, $12
bg_meta_City_E_Left:    .byte $30, $00, $00, $34, $21, $21
bg_meta_City_E_Right:   .byte $40, $00, $00, $00, $21, $21
bg_meta_City_F_Left:    .byte $10, $00, $00, $32, $32, $32
bg_meta_City_F_Right:   .byte $20, $00, $00, $32, $32, $32
bg_meta_City_G:         .byte $20, $00, $00, $03, $23, $23

; pointed to by bg_lookup_pointer
bg_meta_City_Lookup:
    .word bg_meta_City_A_Left
    .word bg_meta_City_A_Right
    .word bg_meta_City_03
    .word bg_meta_City_B_Left
    .word bg_meta_City_B_Right

    .word bg_meta_City_C_Left
    .word bg_meta_City_C_Right
    .word bg_meta_City_D_Left
    .word bg_meta_City_D_Right
    .word bg_meta_City_E_Left

    .word bg_meta_City_E_Right
    .word bg_meta_City_F_Left
    .word bg_meta_City_F_Right
    .word bg_meta_City_G

; pointed to by bg_data_pointer
; Each byte contains two tile columns
bg_data_City:
    .byte $01, $23, $41, $BC
    .byte $01, $23, $41, $56
    .byte $BC, $D3, $41, $56
    .byte $01, $23, $47, $89
    .byte $A2, $13, $41, $56
    .byte $34, $01, $21, $BC
    .byte $01, $23, $41, $56
    .byte $BC, $D3, $41, $BC

    ; Palette data
    .byte $1A,$04,$34,$0F ;$24

    ; Start byte for the four transition tiles
    .byte $70
