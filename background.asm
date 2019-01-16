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
    sta TmpCounter
@loop:
    ldy TmpCounter
    ; load column metadata id
    ; eg, an ID out of the bg_data_City table
    lda (bg_data_pointer), y
    asl a
    tay

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

    ; Draw 64 columns of tiles
    inc TmpCounter
    ldy TmpCounter
    cpy #64
    bne @loop

    lda #PPU_CTRL_HORIZ
    sta $2000

    ; Load up the palette
    ldx #31
:
    lda (bg_data_pointer), y
    sta PaletteRAM, x
    dex
    iny
    cpy #68
    bne :-

    rts

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

bg_meta_City_01:    .byte $10, $00, $12, $32, $32, $32
bg_meta_City_02:    .byte $20, $00, $12, $32, $32, $32
bg_meta_City_03:    .byte $20, $00, $00, $15, $45, $45 ;, [...]

bg_meta_City_Lookup:
    .word bg_meta_City_01
    .word bg_meta_City_02
    .word bg_meta_City_03

; TODO: combine these bytes just like the meta column definitions above
;       (ie, two IDs per byte)
bg_data_City:
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01
    .byte $00, $01, $02, $01, $00, $01, $00, $01

    ; Palette data
    .byte $0F,$04,$34,$24
