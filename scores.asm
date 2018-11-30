;   Individual scores - 16 bytes/score = 511 scores (-1 for current seed; other metadata)
; Seed      2 bytes
; Score     4  BCD.  make this non-decimal binary
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

    jsr Scores_Draw_Page

    lda #$00
    sta $2005
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000
    rts

sc_DrawTwoBlankRows:
    ldx #64
    lda #$0F
@loop:
    sta $2007
    dex
    bne @loop
    rts

; draw the top and bottom roll of the scroll
sc_DrawScrollThing:
    ldx #3
    lda #$0F
@lp0:
    sta $2007
    dex
    bne @lp0

; 1st header row
    ldx #0
    lda Scores_HeaderKnobR1L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR1L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR1L, x
    sta $2007

    lda #$11
    ldx #20
@row1loop:
    sta $2007
    dex
    bne @row1loop

    ldx #0
    lda Scores_HeaderKnobR1R, x
    sta $2007
    inx
    lda Scores_HeaderKnobR1R, x
    sta $2007
    inx
    lda Scores_HeaderKnobR1R, x
    sta $2007

    ldx #6
    lda #$0F
@lp2:
    sta $2007
    dex
    bne @lp2

; 2nd header row
    ldx #0
    lda Scores_HeaderKnobR2L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2L, x
    sta $2007

    lda #$16
    ldx #20
@row2loop:
    sta $2007
    dex
    bne @row2loop

    ldx #0
    lda Scores_HeaderKnobR2R, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2R, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2R, x
    sta $2007

    ldx #3
    lda #$0F
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

; Draw a page of scores
; TODO: take the page index from somewhere (either A or a variable)
Scores_Draw_Page:
    ldx #0
@outer:
    lda sc_ppu_high_byte, x
    sta $2006
    lda sc_ppu_low_byte, x
    sta $2006

    ; Transfer X (the index of the current name) to A and multiply it by 16
    ; to get the correct byte offsets in the page for the current entry.
    ; (entries are 16 bytes wide)
    txa
    asl a

    ; Grab the pointer to the current score table and store it in TmpAddr.
    ; The ASL A above multiples X by 2, so we can use it as the index to
    ; this lookup table.
    lda Score_Tables, x
    sta TmpAddr
    inx
    lda Score_Tables, x
    sta TmpAddr+1
    dex

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
    ; Draw the score to screen
    lda PlayerScoreText+0
    sta $2007
    lda PlayerScoreText+1
    sta $2007
    lda #','
    sta $2007

    lda PlayerScoreText+2
    sta $2007
    lda PlayerScoreText+3
    sta $2007
    lda PlayerScoreText+4
    sta $2007
    lda #','
    sta $2007

    lda PlayerScoreText+5
    sta $2007
    lda PlayerScoreText+6
    sta $2007
    lda PlayerScoreText+7
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

Scores_Header:
    .byte "High Scores Thing?", $00

Scores_HeaderKnobR1L:
    .byte $13, $14, $10
Scores_HeaderKnobR1R:
    .byte $12, $13, $14

Scores_HeaderKnobR2L:
    .byte $18, $19, $15
Scores_HeaderKnobR2R:
    .byte $17, $18, $19

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

; eight rows of data
;sc_demo_data:
;    .byte "some name   ", $00, $00, $00, $00
;    .byte "some name1  ", $01, $00, $00, $00
;    .byte "some name2  ", $02, $00, $00, $00
;    .byte "some name3  ", $03, $00, $00, $00
;    .byte "some name4  ", $04, $00, $00, $00
;    .byte "some name5  ", $05, $00, $00, $00
;    .byte "some name6  ", $06, $00, $00, $00
;    .byte "some name7  ", $07, $00, $00, $00

; lookup for name rows
sc_ppu_high_byte:
    .byte $21, $21, $21, $22, $22, $22, $22, $23
sc_ppu_low_byte:
    .byte $47, $87, $C7, $07, $47, $87, $C7, $07

; lookup for score rows
sc_ppu_high_byte_odd:
    .byte $21, $21, $21, $22, $22, $22, $22, $23
sc_ppu_low_byte_odd:
    .byte $67, $A7, $E7, $27, $67, $A7, $E7, $27
