DedInit:
    jsr MMC1_Setup_Vert

    lda #1
    sta Ded_Fading
    lda #0
    sta Ded_Pal
    lda #DED_FADESPEED
    sta Ded_FadeNext
    jsr update_scroll

    lda #<Ded_Frame
    sta DoFramePointer
    lda #>Ded_Frame
    sta DoFramePointer+1

    lda #<Ded_NMI
    sta DoNMIPointer
    lda #>Ded_NMI
    sta DoNMIPointer+1

    jsr Scores_CheckIfNew
    bne :+
    rts

:   jmp Scores_InsertNewScore
    ;rts

Ded_NMI:
    jsr WritePalettes
    jsr WriteSprites

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
    lda PaletteRAM, y
    sec
    sbc #$10
    bpl @notBlack
    lda #$0D
@notBlack:
    sta PaletteRAM, y
    inx
    dey
    bpl @fadeLoop   ; Fade all eight palettes
    inc Ded_Pal
    jmp WaitSpriteZero

@fadeDone:
    lda #PPU_CTRL_TITLE
    sta $2000

    inc SkipNMI
    lda #PPU_MASK_OFF
    sta $2001

    ; Update a single palette.  We don't care about the others.
    lda #<DedSolidPalette
    sta TmpAddr
    lda #>DedSolidPalette
    sta TmpAddr+1
    jsr LoadPaletteBG0

    jsr ClearAttrTable0

    ; Clear out the tile column draw buffer
    ldx #15
    lda #0
@loop:
    sta tile_column_buffer, x
    dex
    bpl @loop

    jsr ClearNametable0
    jsr ClearNametable1

    jsr ClearAttrTable0
    jsr ClearAttrTable1

    jsr ClearSprites

    ; Draw "Game Over"
    lda #$21
    sta $2006
    lda #$8B
    sta $2006

    ldx #$C2
:
    stx $2007
    inx
    cpx #$CA
    bne :-

    ; Draw "Press Start"
    lda #$22
    sta $2006
    lda #$0A
    sta $2006

    ldx #$D0
:
    stx $2007
    inx
    cpx #$DA
    bne :-

    ; Draw "Select to Restart"
    lda #$22
    sta $2006
    lda #$89
    sta $2006

    ldx #$E0
:
    stx $2007
    inx
    cpx #$EC
    bne :-

@startEnd:
    ; attributes for "Press Start"
    lda #$23
    sta $2006
    lda #$E2
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

    lda #0
    sta SkipNMI

GameOverWait:
    lda #$0F
    sta PaletteRAM+28
    sta PaletteRAM+20

    sta PaletteRAM+3
    sta PaletteRAM+7
    sta PaletteRAM+11
    sta PaletteRAM+15

    sta PaletteRAM+19
    sta PaletteRAM+23
    sta PaletteRAM+27
    sta PaletteRAM+31

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
    lda #BUTTON_SELECT
    jsr ButtonPressedP1
    beq @checkStart
    jmp ReplayLastMap

@checkStart:
    lda #BUTTON_START
    jsr ButtonPressedP1
    bne @gotoTitle
    jmp WaitFrame

@gotoTitle:
    ; save the last working seed
    lda working_seed
    sta rng_seed
    lda working_seed+1
    sta rng_seed+1

    lda #STATES::GS_TITLE
    sta current_gamestate
    inc gamestate_changed
    jmp WaitFrame

ReplayLastMap:
    ; Do not save last working seed.  Jump right to a new game.
    lda #STATES::GS_GAME
    sta current_gamestate
    inc gamestate_changed
    dec GameFullInit
    jmp WaitFrame

DedText:
    .byte "Game Over!", $00

DedStart:
    .byte "Press Start", $00

DedSolidPalette:
    .byte $0F,$30,$00,$30

DedStartPal:
    .byte $2D,$00,$10,$20,$10,$00
