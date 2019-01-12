; TODO:
;   Record the last 8 or so runs with seed and score.

;   Individual scores - 16 bytes/score = 511 scores (-1 for current seed; other metadata)
; Seed      2 bytes
; Score     4 bytes - base100
; Name      10

;   page of 8 per seed - 114 bytes/page of 8 = 71 pages of scores; 568 scores total
; seed      2 bytes
; scores    32 bytes (4 * 8)
; names     80 bytes (10 * 8)

; maybe don't store the seed in ram?  only store scores.  That way we've got
; room to store all the seeds for the pages in the first page as an index.
; for the seed, increment each byte every alternating frame on title.  increment by three.
; eg,
;   frame 0     inc rng_seed    (x3)
;   frame 1     inc rng_seed+1  (x3)
;   frame 2     inc rng_seed    (x3)
;   frame 3     inc rng_seed+1  (x3)
; actually, there's only room for 64-1 tables of scores (minus one for the index)
; = 126 bytes for the index.  leaves two bytes for the saved seed.

; lookup table of score tables?

; First two bytes = saved seed
; the rest is the index
Score_IndexPage = $6000 ; ends at $607F.  list of 2-byte seeds
;Score_IndexPage:
;    .word sc_demo_index

; each page is $80 in size (128 bytes); first table has rng_seed and the last 20
; or so runs, with only seeds and scores, no names.
Score_Tables:
    ;.word sc_demo_data
    .word $6080     ; last 8 runs
    .word $6100
    .word $6180
    .word $6200
    ; [...]

; each page in the score table:
;   entry page
;       $xx00-$xx7F
;       $xx80-$xxFF
;   each entry:
;       $00-$03 score
;       $04-$0F name
;   entry offsets
;       $00     entry 1
;       $10     entry 2
;       $20     entry 3
;       $30     entry 4
;       $40     entry 5
;       $50     entry 6
;       $60     entry 7
;       $70     entry 8

; move RNG seed to the end?
; rng_seed = $7FFE
; or have the first page the most recent runs?
;   just seed and score, no name?
;   could have 20 scores listed with only seeds and scores at 8 bytes per entry

Scores_Init:
    lda #PPU_MASK_OFF
    sta $2001

    lda #<Scores_Palette
    sta PaletteAddr
    lda #>Scores_Palette
    sta PaletteAddr+1
    jsr LoadPalettes

    lda #<Scores_Frame
    sta DoFramePointer
    lda #>Scores_Frame
    sta DoFramePointer+1

    lda #<Scores_NMI
    sta DoNMIPointer
    lda #>Scores_NMI
    sta DoNMIPointer+1

    jsr ClearSprites
    jsr ClearAttrTable0

    ; Debug stuff.  Overwrites save RAM
;    ldx #0
;@dbgloop:
;    lda sc_demo_data, x
;    sta $6090, x
;    inx
;    cpx #112
;    bne @dbgloop

    lda #$20
    sta $2006
    lda #$00
    sta $2006

    jsr sc_DrawTwoBlankRows
    jsr sc_DrawScrollThing

    jsr sc_DrawBGRow

    lda #<Scores_BG_RowH1
    sta TmpAddr
    lda #>Scores_BG_RowH1
    sta TmpAddr+1
    jsr sc_DrawBGDataRow

    jsr sc_DrawBGRow

    lda #<Scores_BG_RowH2
    sta TmpAddr
    lda #>Scores_BG_RowH2
    sta TmpAddr+1
    jsr sc_DrawBGDataRow

; Inner bits of the scroll graphic (actual background for text)
    ldy #18
@blankRowLoop:
    jsr sc_DrawBGRow
    dey
    bne @blankRowLoop

    jsr sc_DrawScrollThing
    jsr sc_DrawTwoBlankRows

    lda #0
    jsr Scores_Draw_Page

    lda #$00
    sta $2005
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000
    rts

sc_DrawTwoBlankRows:
    ldx #64
    lda #SC_TILE_BACKGROUND
@loop:
    sta $2007
    dex
    bne @loop
    rts

; draw the top and bottom roll of the scroll
sc_DrawScrollThing:
    ldx #3
    lda #SC_TILE_BACKGROUND
@lp0:
    sta $2007
    dex
    bne @lp0

; 1st header row
    lda #SC_TILE_KNOB_R1L0
    sta $2007
    lda #SC_TILE_KNOB_R1L1
    sta $2007
    lda #SC_TILE_KNOB_R1L2
    sta $2007

    lda #SC_TILE_ROLL_TOP
    ldx #20
@row1loop:
    sta $2007
    dex
    bne @row1loop

    lda #SC_TILE_KNOB_R1R0
    sta $2007
    lda #SC_TILE_KNOB_R1R1
    sta $2007
    lda #SC_TILE_KNOB_R1R2
    sta $2007

    ldx #6
    lda #SC_TILE_BACKGROUND
@lp2:
    sta $2007
    dex
    bne @lp2

; 2nd header row
    lda #SC_TILE_KNOB_R2L0
    sta $2007
    lda #SC_TILE_KNOB_R2L1
    sta $2007
    lda #SC_TILE_KNOB_R2L2
    sta $2007

    lda #SC_TILE_ROLL_BOTTOM
    ldx #20
@row2loop:
    sta $2007
    dex
    bne @row2loop

    lda #SC_TILE_KNOB_R2R0
    sta $2007
    lda #SC_TILE_KNOB_R2R1
    sta $2007
    lda #SC_TILE_KNOB_R2R2
    sta $2007

    ldx #3
    lda #SC_TILE_BACKGROUND
@lp4:
    sta $2007
    dex
    bne @lp4

    rts

sc_DrawBGRow:
    ldx #31
@loop:
    lda Scores_BG_Row, x
    sta $2007
    dex
    bpl @loop
    rts

sc_DrawBGDataRow:
    ldy #0
@loop:
    lda (TmpAddr), y
    sta $2007
    iny
    cpy #32
    bne @loop
    rts

; Draw a page of scores. Page index taken from A
Scores_Draw_Page:
    ; Grab the pointer to the current score table and store it in TmpAddr.
    ; The ASL A above multiples X by 2, so we can use it as the index to
    ; this lookup table.
    tax
    lda Score_Tables, x
    sta TmpAddr
    inx
    lda Score_Tables, x
    sta TmpAddr+1

    ldx #0
@outer:
    ; start address for name/seed
    lda sc_ppu_high_byte, x
    sta $2006
    lda sc_ppu_low_byte, x
    sta $2006

    ; Transfer X (the index of the current name) to A and multiply it by 16
    ; to get the correct byte offsets in the page for the current entry.
    ; (entries are 16 bytes wide)
    txa
    asl a

    ; finish multiplying by 16
    asl a
    asl a
    asl a
    tay

    ; Store the end condition for the name loop in TmpX
    adc #12
    sta TmpX

    ; Store the end condition for the score loop in TmpY
    adc #4
    sta TmpY

    ; Check for empty name
    lda (TmpAddr), y
    bne @inner
    rts

    ; name loop
@inner:
    lda (TmpAddr), y
    sta $2007
    iny
    cpy TmpX
    bne @inner

    lda #' '
    sta $2007
    sta $2007

    ; score "loop"
    ; Read score into the player score variables
    lda (TmpAddr), y
    sta PlayerScore3
    iny
    lda (TmpAddr), y
    sta PlayerScore2
    iny
    lda (TmpAddr), y
    sta PlayerScore1
    iny
    lda (TmpAddr), y
    sta PlayerScore0

    ; X and Y are clobbered in BufferScoreDisplay.  Back them up in the
    ; stack so our loop isn't borked.
    txa
    pha
    tya
    pha

    ; PlayerScoreBase100 -> PlayerScoreText
    jsr BufferScoreDisplay

    ; Restore the backups of Y and X from the stack.
    pla
    tay
    pla
    tax

    ; TODO: use the sc_ppu_high_byte_odd sc_ppu_low_byte_odd lookup
    ;       tables for the addresses for the following writes
    lda sc_ppu_high_byte_odd, x
    sta $2006
    lda sc_ppu_low_byte_odd, x
    sta $2006

    clc

    ; Draw the score to screen
    lda PlayerScoreText+0
    adc #$90
    sta $2007
    lda PlayerScoreText+1
    adc #$90
    sta $2007
    lda #$2D    ; altertate ','
    sta $2007

    lda PlayerScoreText+2
    adc #$90
    sta $2007
    lda PlayerScoreText+3
    adc #$90
    sta $2007
    lda PlayerScoreText+4
    adc #$90
    sta $2007
    lda #$2D
    sta $2007

    lda PlayerScoreText+5
    adc #$90
    sta $2007
    lda PlayerScoreText+6
    adc #$90
    sta $2007
    lda PlayerScoreText+7
    adc #$90
    sta $2007

    inx
    cpx #8
    bne @outer_jmp
    rts

; branch here because @outer is out of range for BNE
@outer_jmp:
    jmp @outer

Scores_Frame:
    lda #BUTTON_START
    jsr ButtonPressedP1
    beq @nobutton

    lda #GS_TITLE
    sta current_gamestate
    inc gamestate_changed

@nobutton:
    jmp WaitFrame

Scores_NMI:

    ; scroll to the first nametable
    lda #$00
    sta $2005
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000

    jmp NMI_Finished

; Check to see if the current score belongs on the board
Scores_CheckIfNew:
    lda #$80
    sta SavedScore
    lda #$60
    sta SavedScore+1

    lda #7
    jmp scores_NewGreaterThanOld

; new score in an address and the old score as an index
scores_NewGreaterThanOld:
    asl a
    asl a
    asl a
    asl a
    clc
    adc #12
    tay

    ldx #0
@loop:
    lda (SavedScore), y
    sta TmpX
    lda PlayerScoreBase100, x
    cmp TmpX

    beq @next   ; equal, check next digit
    bcc @nope   ; less than, we're done
    bcs @yup    ; greater than, we're done

@next:
    iny
    inx
    cpx #4
    bne @loop

    cmp TmpX
    beq @nope
    bcc @nope

@yup:
    lda #1
    rts

@nope:
    lda #0
    rts

; Inserts a new score.  Entry point for inserting a score into a page.
Scores_InsertNewScore:
    jsr Scores_CheckIfNew
    bne :+
    rts ; score doesn't make the cut

:   lda #7
    sta TmpY    ; index of current saved score

; Starting at the bottom, find the spot for the new score, copying scores down
; a row when needed.
@loop:
    lda TmpY
    bmi @insert
    jsr scores_MoveEntryDown

    lda TmpY
    jsr scores_NewGreaterThanOld
    beq @insert
    dec TmpY
    jmp @loop

; Spot found, overwrite entry (it's been copied a slot down)
@insert:
    ; multiply by 16 to get offset from index.  The start of the page is used
    ; with this to get the correct position in Save RAM.
    inc TmpY
    lda TmpY
    asl a
    asl a
    asl a
    asl a
    tay

    ; load up the address of the page to start at
    lda Score_Tables
    sta TmpAddr
    lda Score_Tables+1
    sta TmpAddr+1

    ; Get the ASCII values for the seed, and store them in the correct entry.
    lda rng_seed
    jsr BinToHex

    lda TmpX
    sta (TmpAddr), y
    iny
    lda TmpY
    sta (TmpAddr), y
    iny

    lda rng_seed+1
    jsr BinToHex

    lda TmpX
    sta (TmpAddr), y
    iny
    lda TmpY
    sta (TmpAddr), y

    ; Move offset to the start of the base100 score
    tya
    clc
    adc #9
    tay

    lda #4
    sta TmpX

    lda Score_Tables
    sta TmpAddr
    lda Score_Tables+1
    sta TmpAddr+1

    ; Write the new score to the entry
    ldx #0
@b100loop:
    lda PlayerScoreBase100, x
    sta (TmpAddr), y
    inx
    iny
    cpx #4
    bne @b100loop
    rts

; Current entry to move down is in A
; TODO: make this work with other tables
scores_MoveEntryDown:
    cmp #7  ; if it's the last entry, don't move it anywhere.  It'll just get over written.
    bne :+
    rts
:
    ; Multiply entry index by 16 to get offset
    asl a
    asl a
    asl a
    asl a
    tay

    lda Score_Tables
    sta TmpAddr
    lda Score_Tables+1
    sta TmpAddr+1

    ldx #0
@loopRead:
    lda (TmpAddr), y
    sta TmpScoreEntry, x
    inx
    iny
    cpx #16
    bne @loopRead

    ldx #0
@loopWrite:
    lda TmpScoreEntry, x
    sta (TmpAddr), y
    inx
    iny
    cpx #16
    bne @loopWrite
    rts

; Tile constants
SC_TILE_BACKGROUND  = $0F
SC_TILE_ROLL_TOP    = $11
SC_TILE_ROLL_BOTTOM = $16

; Scroll roll header left and right (the knobs)
SC_TILE_KNOB_R1L0   = $13
SC_TILE_KNOB_R1L1   = $14
SC_TILE_KNOB_R1L2   = $10

SC_TILE_KNOB_R1R0   = $12
SC_TILE_KNOB_R1R1   = $13
SC_TILE_KNOB_R1R2   = $14

SC_TILE_KNOB_R2L0   = $18
SC_TILE_KNOB_R2L1   = $19
SC_TILE_KNOB_R2L2   = $15

SC_TILE_KNOB_R2R0   = $17
SC_TILE_KNOB_R2R1   = $18
SC_TILE_KNOB_R2R2   = $19

Scores_Header:
    .byte "High Scores Thing?", $00

Scores_BG_RowH1:
    .byte $0F,$0F,$0F,$0F,$0F,$0F
    .byte " High scores"; for seed"
    .byte $00,$00,$00,$00,$00,$00,$00,$00 ;,$00 ;,$00
    ;.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $0F,$0F,$0F,$0F,$0F,$0F
Scores_BG_RowH2:
    .byte $0F,$0F,$0F,$0F,$0F,$0F
    .byte "      for seed FFFF"
    .byte $00 ;,$00,$00,$00,$00 ;,$00,$00 ;,$00,$00 ;,$00
    ;.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $0F,$0F,$0F,$0F,$0F,$0F

Scores_BG_Row:
    .byte $0F,$0F,$0F,$0F,$0F,$0F
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $0F,$0F,$0F,$0F,$0F,$0F

Scores_Palette:
    .byte $37,$0F,$17,$07, $37,$05,$15,$13, $37,$0A,$1A,$13, $37,$11,$21,$13
    .byte $37,$30,$13,$13, $37,$05,$15,$13, $37,$0A,$1A,$13, $37,$11,$21,$13

;sc_demo_index:
;    ; first byte is current seed
;    .byte $FF, $FF
;
;    ; index data here
;    .byte $12, $34
;    .byte $00, $00

; seven rows of data
;sc_demo_data:
;    .byte "some name1  ", $01, $00, $00, $00
;    .byte "some name2  ", $02, $00, $00, $00
;    .byte "some name3  ", $03, $00, $00, $00
;    .byte "some name4  ", $04, $00, $00, $00
;    .byte "some name5  ", $05, $00, $00, $00
;    .byte "some name6  ", $06, $00, $00, $00
;    .byte "some name7  ", $07, $00, $00, $00

; lookup for name rows
sc_ppu_high_byte:
    .byte $21, $21, $21, $21, $22, $22, $22, $22
sc_ppu_low_byte:
    .byte $27, $67, $A7, $E7, $27, $67, $A7, $E7

; lookup for score rows
sc_ppu_high_byte_odd:
    .byte $21, $21, $21, $22, $22, $22, $22, $23
sc_ppu_low_byte_odd:
    .byte $4F, $8F, $CF, $0F, $4F, $8F, $CF, $0F

