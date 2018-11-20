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

    lda #0
    sta TitleIndex  ; reuse this index

    ; Attribute tables for selected
    jsr seed_SetAttr
    jsr seed_LoadSprite

    ; Load up cursor sprites
    ;   character selecton sprites
    ; draw stuff on background
    ;   boxes for input
    ;   current values

    dec TurnPPUOn
    rts

Seed_NMI:
    bit $2002
    lda #$23
    sta $2006
    lda #$DA
    sta $2006

    ; Transfer attribute buffer to PPU
    ldx #4
@loop:
    lda Seed_Attr_Buffer, x
    sta $2007
    dex
    bpl @loop

    ; scroll stuff
    lda #0
    sta $2005
    sta $2005

    lda #PPU_CTRL_HORIZ
    sta $2000

    jmp NMI_Finished

seed_SetAttr:
    lda TitleIndex
    asl a
    tax

    ; find the data chunk in the lookup table
    lda SeedAttrBoxes, x
    sta TmpPPUAddr
    inx

    lda SeedAttrBoxes, x
    sta TmpPPUAddr+1
    inx

    ; Store the attribute stuff in the buffer
    ldx #4
    ldy #0
@loop:
    lda (TmpPPUAddr), y
    sta Seed_Attr_Buffer, x
    iny
    dex
    bpl @loop

@done:
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
    lda #BUTTON_RIGHT
    jsr ButtonPressedP1
    beq @noRight

    inc TitleIndex
    lda TitleIndex
    cmp #5
    bcc @noRight
    dec TitleIndex  ; don't loop, just stop

@noRight:

    lda #BUTTON_LEFT
    jsr ButtonPressedP1
    beq @noLeft

    dec TitleIndex
    bpl @noLeft
    inc TitleIndex  ; don't loop, just stop
@noLeft:

    jsr seed_SetAttr
    jmp WaitFrame

seed_LoadSprite:
    lda #2  ; TODO: load elsewhere

    ; multiply by 4 to get the correct index
    asl a
    asl a

    ; add offset to start of tiles
    clc
    adc #$10
    sta TmpCounter

    lda #<sprites
    sta TmpPPUAddr
    lda #>sprites
    sta TmpPPUAddr+1

    ; load up tiles into sprites
    ldy #1
    ldx #4
@loop:
    ; tile
    lda TmpCounter
    sta (TmpPPUAddr), y
    inc TmpCounter

    lda TmpPPUAddr
    adc #4
    sta TmpPPUAddr
    dex
    bne @loop

    sec
    sbc #16
    sta TmpPPUAddr
    clc

    ; load up first tile's x/y
    ldy #0
    lda #96
    sta (TmpPPUAddr), y
    sta TmpY
    ldy #3
    lda #72
    sta (TmpPPUAddr), y
    sta TmpX

    nop
    nop

    ; loop through the rest to calculate x/y
    lda TmpPPUAddr
    adc #4
    sta TmpPPUAddr

    ; tile 01
    lda TmpX
    adc #8
    sta TmpX
    jsr seed_SetSpriteXY

    ; tile 02
    lda TmpX
    sec
    sbc #8
    sta TmpX
    lda TmpY
    clc
    adc #8
    sta TmpY
    jsr seed_SetSpriteXY

    ; tile 03
    lda TmpX
    adc #8
    sta TmpX
    jsr seed_SetSpriteXY
    rts

seed_SetSpriteXY:
    ldy #0
    lda TmpY
    sta (TmpPPUAddr), y
    iny
    iny
    iny
    lda TmpX
    sta (TmpPPUAddr), y

    lda TmpPPUAddr
    clc
    adc #4
    sta TmpPPUAddr
    rts

BOX_TILE_START  = $03

SeedAttrBoxes:
    .word sb01
    .word sb02
    .word sb03
    .word sb04
    .word sbThumb

sb01:
    .byte $55, $00, $00, $00
sb02:
    .byte $00, $11, $00, $00
sb03:
    .byte $00, $44, $11, $00
sb04:
    .byte $00, $00, $44, $00
sbThumb:
    .byte $00, $00, $00, $55

SeedPalette:
    ;      input box,       inputed val
    .byte $0F,$10,$2D,$0F, $0F,$30,$10,$0F, $0F,$15,$0F,$0F, $0F,$11,$11,$11
    ;       current char    prev/next
    .byte $0F,$30,$30,$30, $0F,$00,$00,$00, $0F,$0A,$0A,$0A, $0F,$11,$11,$11
    .byte $EA, $EA
