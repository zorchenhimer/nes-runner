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

; lookup table of score tables?

; each page is $80 in size (128 bytes); first table has rng_seed and the last 20 or so
; runs, with only seeds and scores, no names.
Score_IndexPage = $6000 ; ends at $607F.  list of 2-byte seeds
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

    lda #<ScorePalette
    sta PaletteAddr
    lda #>ScorePalette
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
    rts

Scores_Frame:
    jmp WaitFrame

Scores_NMI:
    jmp NMI_Finished

Scores_Palette:
    .byte $0F,$30,$13,$0F, $0F,$05,$15,$0F, $0F,$0A,$1A,$0F, $0F,$11,$21,$0F
    .byte $0F,$30,$13,$0F, $0F,$05,$15,$0F, $0F,$0A,$1A,$0F, $0F,$11,$21,$0F
