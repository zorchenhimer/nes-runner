DedInit:
    lda #1
    sta Ded_Fading
    lda #0
    sta Ded_Pal
    lda #DED_FADESPEED
    sta Ded_FadeNext

    lda #PPU_CTRL_HORIZ
    sta $2000

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

    inc SkipNMI
    lda #PPU_MASK_OFF
    sta $2001

    lda #PPU_CTRL_HORIZ
    sta $2000

    ; Clear out the tile column draw buffer
    ldx #15
    lda #0
@loop:
    sta tile_column_buffer, x
    dex
    bpl @loop

    jsr ClearNametable0
    jsr ClearNametable1

    ; TODO: load up a palette
    jsr ClearSprites

    lda #0
    sta SkipNMI

    lda #PPU_MASK
    sta $2001

    ;lda #PPU_MASK
    ;sta NewPPUMask
    ;lda #PPU_UPDATE_MASK
    ;sta PPUUpdates

    lda #<GameOverWait
    sta DoFramePointer
    lda #>GameOverWait
    sta DoFramePointer+1

GameOverWait:
    ;lda #GS_TITLE
    ;sta current_gamestate
    ;inc gamestate_changed

    lda #BUTTON_START
    jsr ButtonPressedP1
    bne @gotoTitle
    jmp WaitFrame

@gotoTitle:
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
