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

; each page is $80 in size (128 bytes); first table has rng_seed and the last 20 or so
; runs, with only seeds and scores, no names.
Score_Tables:
    .word $6080
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

    ldx #67
    lda #$01
@lp1:
    sta $2007
    dex
    bne @lp1

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

    lda #$85
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
    lda #$01
@lp2:
    sta $2007
    dex
    bne @lp2

; 2nd header row
    ;lda #$20
    ;sta $2006
    ;lda #$63
    ;sta $2006
    ldx #0
    lda Scores_HeaderKnobR2L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2L, x
    sta $2007

    lda #$95
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
    lda #$01
@lp4:
    sta $2007
    dex
    bne @lp4

; Inner bits of the scroll graphic (actual background for text)
    ldy #22
@innerOuter:
    ldx #31
@innerInner:
    lda Scores_BG_Row, x
    sta $2007
    dex
    bpl @innerInner
    dey
    bne @innerOuter

; bottom roll thing
    ldx #3
    lda #$01
@lp3:
    sta $2007
    dex
    bne @lp3

    ldx #0
    lda Scores_HeaderKnobR1L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR1L, x
    sta $2007
    inx
    lda Scores_HeaderKnobR1L, x
    sta $2007

    lda #$85
    ldx #20
@row3loop:
    sta $2007
    dex
    bne @row3loop

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
    lda #$01
@lp5:
    sta $2007
    dex
    bne @lp5

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

    lda #$95
    ldx #20
@row4loop:
    sta $2007
    dex
    bne @row4loop

    ldx #0
    lda Scores_HeaderKnobR2R, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2R, x
    sta $2007
    inx
    lda Scores_HeaderKnobR2R, x
    sta $2007

    ldx #67
    lda #$01
@lp6:
    sta $2007
    dex
    bne @lp6


    lda #$00
    sta $2005
    sta $2005

    lda #PPU_CTRL_HORIZ
    sta $2000
    rts

Scores_Frame:
    jmp WaitFrame

Scores_NMI:

    ; scroll to the first nametable
    lda #$00
    sta $2005
    sta $2005

    lda #PPU_CTRL_HORIZ
    sta $2000

    jmp NMI_Finished

Scores_Header:
    .byte "High Scores Thing?", $00

Scores_HeaderKnobR1L:
    .byte $87, $88, $84
Scores_HeaderKnobR1R:
    .byte $86, $87, $88

Scores_HeaderKnobR2L:
    .byte $97, $98, $94
Scores_HeaderKnobR2R:
    .byte $96, $97, $98

Scores_BG_Row:
    .byte $01,$01,$01,$01,$01,$01
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $01,$01,$01,$01,$01,$01

Scores_Palette:
    .byte $37,$0F,$17,$07, $37,$05,$15,$13, $37,$0A,$1A,$13, $37,$11,$21,$13
    .byte $37,$30,$13,$13, $37,$05,$15,$13, $37,$0A,$1A,$13, $37,$11,$21,$13
