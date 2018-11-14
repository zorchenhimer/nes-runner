DedInit:
    lda #1
    sta Ded_Fading
    lda #0
    sta Ded_Pal
    lda #DED_FADESPEED
    sta Ded_FadeNext
    rts

Ded_Frame:
    lda Ded_Fading
    beq @fadeDone

    dec Ded_FadeNext
    beq @doFade
    jmp WaitSpriteZero

@doFade:
    lda #DED_FADESPEED
    sta Ded_FadeNext

    lda Ded_Pal
    cmp #4
    bcc @notDone

    lda #0
    sta Ded_Fading
    jmp WaitSpriteZero

@notDone:
    asl a
    asl a
    tax
    ldy #31
@fadeLoop:
    lda DedFade, x
    sta PaletteRAM, y
    inx
    dey
    cpy #27
    bne @fadeLoop
    inc Ded_Pal
    jmp WaitSpriteZero

@fadeDone:
    ; TODO:
    ;   display "game over"
    ;   wait for start pressed
    ;   goto enter new high score if applicable

    lda #GS_TITLE
    sta current_gamestate
    inc gamestate_changed
    jmp WaitFrame


DedFade:
    .byte $0F,$17,$2B,$39
    .byte $0F,$07,$1B,$29
    .byte $0F,$0D,$0B,$19
    .byte $0F,$0D,$0D,$09
    .byte $0F,$0D,$0D,$0D
