DedInit:
    lda #1
    sta Ded_Fading
    lda #0
    sta Ded_Pal
    lda #DED_FADESPEED
    sta Ded_FadeNext
    jsr update_scroll

    lda working_seed
    sta rng_seed
    lda working_seed+1
    sta rng_seed+1

    lda #<Ded_Frame
    sta DoFramePointer
    lda #>Ded_Frame
    sta DoFramePointer+1

    lda #<Ded_NMI
    sta DoNMIPointer
    lda #>Ded_NMI
    sta DoNMIPointer+1
    rts

Ded_NMI:
    lda Ded_Fading
    beq @noscroll
    ; only update the scroll (for the status bar thing) if fading
    jsr update_scroll
    jmp @end

@noscroll:
    bit $2002
    lda #0
    sta $2005
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000

@end:
    jmp NMI_Finished

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

    lda #PPU_CTRL_TITLE
    sta $2000

    inc SkipNMI
    lda #PPU_MASK_OFF
    sta $2001

    ; Clear out the tile column draw buffer
    ldx #15
    lda #0
@loop:
    sta tile_column_buffer, x
    dex
    bpl @loop

    jsr ClearNametable0
    jsr ClearNametable1

    jsr ClearSprites

    ; update palettes. just reuse the title palettes
    lda #<TitlePalette
    sta PaletteAddr
    lda #>TitlePalette
    sta PaletteAddr+1
    jsr LoadPalettes
    jsr UpdatePalettes

    lda #$21
    sta $2006
    lda #$8B
    sta $2006

    ldx #0
@textLoop:
    lda DedText, x
    beq @txtEnd
    sta $2007
    inx
    jmp @textLoop

@txtEnd:

    lda #$22
    sta $2006
    lda #$CB
    sta $2006

    ldx #0
@startLoop:
    lda DedStart, x
    beq @startEnd
    sta $2007
    inx
    jmp @startLoop

@startEnd:
    ; attributes for "Press Start"
    lda #$23
    sta $2006
    lda #$EA
    sta $2006

    lda #$55
    sta $2007
    sta $2007
    sta $2007
    sta $2007

    ; reset the frame pointer to avoid fading again
    lda #<GameOverWait
    sta DoFramePointer
    lda #>GameOverWait
    sta DoFramePointer+1

    lda DedStartPal
    sta DED_START_PAL

    lda #0
    sta TmpX    ; current color index
    lda #2
    sta TmpY    ; countdown to next switch

    ; Sprite zero stuff
    lda #$03
    sta SPZ_IDX
    lda #0
    sta SPZ_ATT
    sta SPZ_X
    lda #127
    sta SPZ_Y

    ; non-transparent "black" for sprite zero
    lda #$1D
    sta DED_SPZ_PAL

    lda #$1D
    sta DED_SPZ_BG_PAL

    ; BG tile for sprite zero
    lda #$22
    sta $2006
    lda #$00
    sta $2006

    lda #$01
    sta $2007

    ; Attribute byte for BG tile for sprite zero
    lda #$23
    sta $2006
    lda #$E0
    sta $2006

    lda #$AA
    sta $2007

    dec TurnPPUOn

    lda #0
    sta SkipNMI

GameOverWait:

    ; "press start" fade thing
    dec TmpY
    bne @noColor

    lda #8
    sta TmpY

    ldx TmpX
    lda DedStartPal, x
    sta DED_START_PAL   ; Palette 01, first non-BG color
    inx
    cpx #6
    bne @noWrap
    ldx #0
@noWrap:
    stx TmpX

@noColor:
    lda #BUTTON_START
    jsr ButtonPressedP1
    bne @gotoTitle
    jmp dedSpriteZero

@gotoTitle:
    lda #GS_TITLE
    sta current_gamestate
    inc gamestate_changed
    ;jmp dedSpriteZero

dedSpriteZero:
    bit $2002
    bvs dedSpriteZero

@loop:
    bit $2002
    bvc @loop

    lda #4
    sta $2005
    lda #PPU_CTRL_TITLE
    sta $2000
    jmp WaitFrame

DedText:
    .byte "Game Over!", $00

DedStart:
    .byte "Press Start", $00

DedStartPal:
    .byte $2D,$00,$10,$20,$10,$00

DedFade:
    .byte $0F,$17,$2B,$39
    .byte $0F,$07,$1B,$29
    .byte $0F,$0D,$0B,$19
    .byte $0F,$0D,$0D,$09
    .byte $0F,$0D,$0D,$0D
