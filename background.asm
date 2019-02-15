; Load the palette with ID BGTheme into RAM
bg_loadPalette:
    lda BGTheme
    asl a
    asl a
    tax
    ldy #31
:
    lda bg_table_palettes, x
    sta PaletteRAM, y
    inx
    dey
    cpy #27
    bne :-
    rts

; A is the row offset
bg_writePPUAddress:
    tax ; used as the loop counter
    ; Find the correct offest for the given Y (row) start
    ; while (x > 0)
    lda #0
@loop:
    cpx #0
    beq @foundStart

    ; A += 32
    clc
    adc #32

    ; if A > 256 (wrapped around)
    bcc @next
    iny    ; Y++

@next:
    ; X--
    dex
    jmp @loop
@foundStart:

    bit $2002
    sty $2006
    clc
    adc bg_current_column
    sta $2006
    rts

; This is the transition row, but I cannot assign a palette to it
; because it doesn't align with the attribute table.  Instead,
; use the last (unused) byte of the background palette.
bg_drawTransition:
    lda #0
    sta bg_current_column

    ; get the nametable
    ldy BGNametable ; Y == high byte (eg $20)

    ; Add 12 rows to the start.  This will be drawn at the bottom of everything.
    lda BGYStart    ; low byte (eg $00)
    clc
    adc #11
    bcc @noRollover
    iny ; roll over if needed
@noRollover:
    jsr bg_writePPUAddress

    ; Load tile ID to start at
    ldy BGTheme
    ldx bg_table_transitions, y
    stx TmpX

    ; Draw in chunks of four tiles
    ldy #8
:   ldx TmpX
    stx $2007
    inx
    stx $2007
    inx
    stx $2007
    inx
    stx $2007
    dey
    bne :-

    rts

bg_drawOneScreen:
    lda #0
    sta bg_current_column

    lda #PPU_CTRL_VERT
    sta $2000

    lda BGTheme
    asl a
    tax

    ; Load up a screen data address
    ldy BGNametable
    cpy #$20
    beq @left
    cpy #$28
    beq @left

    ; right.  screen b
    lda bg_table_screen_B, x
    sta TmpAddr
    inx
    lda bg_table_screen_B, x
    sta TmpAddr+1
    jmp @loadColumns

@left:
    ; left. screen a
    lda bg_table_screen_A, x
    sta TmpAddr
    inx
    lda bg_table_screen_A, x
    sta TmpAddr+1

; start loading up the columns
@loadColumns:

    ; Get the address of the table that contains meta column definitions
    dex
    lda bg_table_column_lookups, x
    sta bg_meta_data_pointer
    inx
    lda bg_table_column_lookups, x
    sta bg_meta_data_pointer+1

    lda #0
    sta bg_odd
    sta TmpY

; load a column. loop this 32 times
@loadLoop:
    ldy TmpY
    lda (TmpAddr), y    ; load a byte with two column IDs
    bit bg_odd          ; split the byte
    bvs @secondNibble

    ; first nibble
    and #$F0
    lsr a
    lsr a
    lsr a
    jmp @drawcolumn

@secondNibble:
    and #$0F
    asl a

@drawcolumn:
    ; A now contains the offeset of the meta column address in the table
    ; load the address of the meta column definition into bg_lookup_data_pointer
    tay
    lda (bg_meta_data_pointer), y
    sta bg_lookup_data_pointer
    iny
    lda (bg_meta_data_pointer), y
    sta bg_lookup_data_pointer+1

    jsr bg_DrawColumn
    inc bg_current_column

    ; Flip flop bg_odd
    lda bg_odd
    beq :+

    ; increment read byte (indexed in TmpY) ever other read
    lda #0
    sta bg_odd
    inc TmpY
    jmp :++

:   lda #$FF
    sta bg_odd
:

    lda bg_current_column
    cmp #32     ; only draw 32 columns
    bne @loadLoop
    rts

; Draw a screen of twevle columns
DrawBackground:
    jsr bg_loadPalette

    lda #PPU_CTRL_HORIZ
    sta $2000
    jsr bg_drawTransition

    jsr bg_drawOneScreen

    lda #PPU_CTRL_HORIZ
    sta $2000
    rts

; Draw a column of 11 (+1 duplicate) tiles
bg_DrawColumn:
    lda BGYStart
    ldy BGNametable
    jsr bg_writePPUAddress

    ; Load up the CHR row
    ldy #0
    lda (bg_lookup_data_pointer), y
    and #$F0
    sta bg_tile_row

    ; Reload tile and draw it
    lda (bg_lookup_data_pointer), y

    ;jsr bg_WriteByte
    sta $2007

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

    ora bg_tile_row ; get real tile ID
    sta $2007       ; draw it

    ; Second half of byte
    lda (bg_lookup_data_pointer), y
    and #$0F
    ora bg_tile_row ; get real tile ID
    sta $2007       ; draw it
    iny

    ; six total bytes of data
    cpy #6
    bne @loop
    rts

; Meta rows
;   Define a column of tiles.  Reference these columns in the data.
;       16 possible columns ($00-$0F), each 11 tiles high (5.5 bytes).
;   Define a transition row of 2 or 4 tiles.  These tiles will repeat.
;   First byte, first half is row of CHR. second byte is first tile.
;   Five more bytes of two tiles each.
;   Last tile row is drawn as one "transition line" between the background and forground.

; Table of palettes.
bg_table_palettes:
    .byte $1A,$04,$34,$0F ;$24

; Table of transition tile start IDs
bg_table_transitions:
    .byte $70

; table of pointers the first screen's column data
bg_table_screen_A:
    .word bg_meta_city_screen_a

; table of pointers the second screen's column data
bg_table_screen_B:
    .word bg_meta_city_screen_b

; table of lookup tables that define columns
bg_table_column_lookups:
    .word bg_meta_City_Lookup
; No more tables use the BackgroundThemes index

; Meta column definitions.  Two per byte.
; Each screen has 32 columns in 16 bytes.
bg_meta_city_screen_a:
    .byte $01, $23, $41, $BC
    .byte $01, $23, $41, $56
    .byte $BC, $D3, $41, $56
    .byte $01, $23, $47, $89

bg_meta_city_screen_b:
    .byte $A2, $13, $41, $56
    .byte $34, $01, $21, $BC
    .byte $01, $23, $41, $56
    .byte $BC, $D3, $41, $BC

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

