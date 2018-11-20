; TODO
;   switch between boxes with left/right
;   draw number metasprites on screen
;   draw black, non-bg tiles to screen for sprites to go behind
;       maybe some dithering effects later?

InitSeed:
    inc SkipNMI

    ; write palettes
    lda #<SeedPalette
    sta PaletteAddr
    lda #>SeedPalette
    sta PaletteAddr+1
    jsr LoadPalettes
    jsr UpdatePalettes

    jsr ClearNametable0
    jsr ClearAttrTable0

    jsr ClearSprites

    lda #<SeedFrame
    sta DoFramePointer
    lda #>SeedFrame
    sta DoFramePointer+1

    lda #<Seed_NMI
    sta DoNMIPointer
    lda #>Seed_NMI
    sta DoNMIPointer+1

    lda #PPU_CTRL_VERT
    sta $2000

    lda #$21
    sta map_column_addr
    lda #$89
    sta map_column_addr+1
    jsr seed_DrawBox

    lda #$21
    sta map_column_addr
    lda #$8C
    sta map_column_addr+1
    jsr seed_DrawBox

    lda #$21
    sta map_column_addr
    lda #$8F
    sta map_column_addr+1
    jsr seed_DrawBox

    lda #$21
    sta map_column_addr
    lda #$92
    sta map_column_addr+1
    jsr seed_DrawBox

    ; Draw the thumbs up
    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$21
    sta $2006
    lda #$95
    sta $2006

    ldx #$08
    stx $2007
    inx
    stx $2007
    inx

    lda #$21
    sta $2006
    lda #$B5
    sta $2006

    stx $2007
    inx
    stx $2007

    ; Attribute tables for selected
    jsr seed_ResetAttr
    lda #0
    jsr seed_SetAttr

    ; Load up cursor sprites
    ;   character selecton sprites
    ; draw stuff on background
    ;   boxes for input
    ;   current values

    dec TurnPPUOn
    rts

Seed_NMI:
    bit $2002
    lda #0
    sta $2005
    sta $2005

    lda #PPU_CTRL_HORIZ
    sta $2000

    jmp NMI_Finished

seed_SetAttr:
    ; Index in A
    asl a
    tax

    lda SeedAttrBoxes, x
    sta TmpPPUAddr
    inx

    lda SeedAttrBoxes, x
    sta TmpPPUAddr+1
    inx

    bit $2002
    ldy #0
    lda (TmpPPUAddr), y
    sta $2006
    inc TmpPPUAddr

    ; check for page cross
    bvc @noOver01
    inc TmpPPUAddr+1
@noOver01:

    lda (TmpPPUAddr), y
    sta $2006
    inc TmpPPUAddr

    ; check for page cross
    bvc @loop;@noOver02
    inc TmpPPUAddr+1
;@noOver02:

@loop:
    lda (TmpPPUAddr), y
    beq @done
    sta $2007
    inc TmpPPUAddr
    ; check for page cross
    bvc @noOverLp
    inc TmpPPUAddr+1
@noOverLp:
    jmp @loop

@done:
    rts

seed_ResetAttr:
    lda #$23
    sta $2006
    lda #$DA
    sta $2006

    ldx #5
    lda #$00
@loop:
    sta $2007
    dex
    bne @loop
    rts

seed_DrawBox:

    lda map_column_addr
    sta $2006
    lda map_column_addr+1
    sta $2006
    ldx #BOX_TILE_START
@BoxA:
    stx $2007
    inx
    cpx #$06
    bne @BoxA

    inc map_column_addr+1

    lda map_column_addr
    sta $2006
    lda map_column_addr+1
    sta $2006
@BoxB:
    stx $2007
    inx
    cpx #$08
    bne @BoxB

    ldx #$05
    stx $2007

    rts

SeedFrame:
    jmp WaitFrame

BOX_TILE_START  = $03

SeedAttrBoxes:
    .word sb01
    .word sb02
    .word sb03
    .word sb04
    .word sbThumb

sb01:
    .byte $23,$DA, $55, $00
sb02:
    .byte $23,$DB, $11, $00
sb03:
    .byte $23,$DB, $44, $11, $00
sb04:
    .byte $23,$DC, $44, $00
sbThumb:
    .byte $23,$DD, $55, $00

SeedPalette:
    ;      input box,       inputed val
    .byte $0F,$10,$10,$10, $0F,$30,$30,$30, $0F,$15,$0F,$0F, $0F,$11,$11,$11
    ;       current char    prev/next
    .byte $0F,$10,$00,$30, $0F,$05,$05,$05, $0F,$0A,$0A,$0A, $0F,$11,$11,$11
    .byte $EA, $EA
