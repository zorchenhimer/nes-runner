; TODO
;   draw black, non-bg tiles to screen for sprites to go behind
;       maybe some dithering effects later?
;   Add a reset button
;   Add a randomize button
;   Check for seed "0000" and reject it.  This seed breaks the RNG.

InitSeed:
    inc SkipNMI

    lda #PPU_MASK_OFF
    sta $2001

    ; write palettes
    lda #<SeedPalette
    sta PaletteAddr
    lda #>SeedPalette
    sta PaletteAddr+1
    jsr LoadPalettes
    jsr WritePalettes

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

    ; Rando button; left column
    bit $2000
    lda #$21
    sta $2006
    lda #$86
    sta $2006

    lda #$50
    sta $2007
    lda #$60
    sta $2007

    ; Rando button; right column
    lda #$21
    sta $2006
    lda #$87
    sta $2006

    lda #$51
    sta $2007
    lda #$61
    sta $2007

    lda #$21
    sta TmpAddr
    lda #$89
    sta TmpAddr+1
    jsr seed_DrawBox

    lda #$21
    sta TmpAddr
    lda #$8C
    sta TmpAddr+1
    jsr seed_DrawBox

    lda #$21
    sta TmpAddr
    lda #$8F
    sta TmpAddr+1
    jsr seed_DrawBox

    lda #$21
    sta TmpAddr
    lda #$92
    sta TmpAddr+1
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

    ; Load up the current seed and set the input values to it.
    lda rng_seed
    sta working_seed
    lda rng_seed+1
    sta working_seed+1
    jsr seed_LoadFromMemory

    ; Attribute tables for selected
    jsr seed_SetAttr

    ; Update sprites to reflect the above input values.
    jsr seed_UpdateSprites

    ; Load up cursor sprites
    ;   character selecton sprites
    ; draw stuff on background
    ;   boxes for input
    ;   current values
    rts

; Load up the current seed and set the input values to it.
seed_LoadFromMemory:
    lda working_seed
    and #$F0
    lsr a
    lsr a
    lsr a
    lsr a
    sta Seed_Input0
    lda working_seed
    and #$0F
    sta Seed_Input1

    lda working_seed+1
    and #$F0
    lsr a
    lsr a
    lsr a
    lsr a
    sta Seed_Input2
    lda working_seed+1
    and #$0F
    sta Seed_Input3
    rts

seed_UpdateSprites:
    lda #<sprites
    sta TmpAddr
    lda #>sprites
    sta TmpAddr+1

; TmpY and TmpX are indexes to lookup tables for actual pixel offsets
; Middle (selected) row
    ldy #1
    ldx #0
    lda Seed_Input0
    jsr seed_LoadSprite

    ldy #1
    ldx #1
    lda Seed_Input1
    jsr seed_LoadSprite

    ldy #1
    ldx #2
    lda Seed_Input2
    jsr seed_LoadSprite

    ldy #1
    ldx #3
    lda Seed_Input3
    jsr seed_LoadSprite

; Top row
    ldy #0
    ldx #0

    lda Seed_Input0
    sec
    sbc #1
    and #$0F
    jsr seed_LoadSprite

    ldy #0
    ldx #1
    lda Seed_Input1
    sec
    sbc #1
    and #$0F
    jsr seed_LoadSprite

    ldy #0
    ldx #2
    lda Seed_Input2
    sec
    sbc #1
    and #$0F
    jsr seed_LoadSprite

    ldy #0
    ldx #3
    lda Seed_Input3
    sec
    sbc #1
    and #$0F
    jsr seed_LoadSprite

; Bottom row
    ldy #2
    ldx #0
    lda Seed_Input0
    clc
    adc #1
    and #$0F
    jsr seed_LoadSprite

    ldy #2
    ldx #1
    lda Seed_Input1
    clc
    adc #1
    and #$0F
    jsr seed_LoadSprite

    ldy #2
    ldx #2
    lda Seed_Input2
    clc
    adc #1
    and #$0F
    jsr seed_LoadSprite

    ldy #2
    ldx #3
    sta TmpX
    lda Seed_Input3
    clc
    adc #1
    and #$0F
    jsr seed_LoadSprite
    rts

Seed_NMI:
    ;jsr WritePalettes
    jsr WriteSprites

    bit $2002
    lda #$23
    sta $2006
    lda #$D9
    sta $2006

    ; Transfer attribute buffer to PPU
    ldx #4
@loop:
    lda Seed_Attr_Buffer, x
    sta $2007
    dex
    bpl @loop

    ; scroll stuff
    lda #244
    sta $2005
    lda #0
    sta $2005

    lda #PPU_CTRL_HORIZ
    ora #$01
    sta $2000

    jmp NMI_Finished

seed_SetAttr:
    lda TitleIndex
    asl a
    tax

    ; find the data chunk in the lookup table
    lda SeedAttrBoxes, x
    sta TmpAddr
    inx

    lda SeedAttrBoxes, x
    sta TmpAddr+1
    inx

    ; Store the attribute stuff in the buffer
    ldx #4
    ldy #0
@loop:
    lda (TmpAddr), y
    sta Seed_Attr_Buffer, x
    iny
    dex
    bpl @loop

@done:
    rts

seed_DrawBox:
    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006
    ldx #BOX_TILE_START
@BoxA:
    stx $2007
    inx
    cpx #$06
    bne @BoxA

    inc TmpAddr+1

    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006
@BoxB:
    stx $2007
    inx
    cpx #$08
    bne @BoxB

    ldx #$0D
    stx $2007

    rts

SeedFrame:
    jsr prng

    lda #BUTTON_RIGHT
    jsr ButtonPressedP1
    beq @noRight

    inc TitleIndex
    lda TitleIndex
    cmp #6
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

    lda TitleIndex
    beq @onEnd
    cmp #5
    bcs @onEnd

    lda #BUTTON_UP
    jsr ButtonPressedP1
    beq @noUp

    ldx TitleIndex
    dex
    lda Seed_Input0, x
    clc
    adc #1
    and #$0F
    sta Seed_Input0, x
    jmp @end

@noUp:
    lda #BUTTON_DOWN
    jsr ButtonPressedP1
    beq @end
    ldx TitleIndex
    dex
    lda Seed_Input0, x
    sec
    sbc #1
    and #$0F
    sta Seed_Input0, x
    jmp @end

@onEnd:
    lda #BUTTON_A
    jsr ButtonPressedP1
    beq @end

    lda TitleIndex
    bne @EnterPressed

    ; Rando selected
    ; do rando thing
    ;lda rng_seed
    ;sta working_seed
    ;lda rng_seed+1
    ;sta working_seed+1

    ;jsr prng

    jsr seed_LoadFromMemory
    jmp @end

@EnterPressed:
    ; save stuff
    lda Seed_Input0
    asl a
    asl a
    asl a
    asl a
    ora Seed_Input1
    sta rng_seed

    lda Seed_Input2
    asl a
    asl a
    asl a
    asl a
    ora Seed_Input3
    sta rng_seed+1

    lda #STATES::GS_TITLE
    sta current_gamestate
    inc gamestate_changed

@end:
    jsr seed_UpdateSprites
    jsr seed_SetAttr
    jmp WaitFrame

; A     number to draw
; X  column index
; Y  row index
seed_LoadSprite:
    ; multiply by 4 to get the correct index
    asl a
    asl a

    ; add offset to start of tiles
    clc
    adc #SPRITE_TILE_START
    sta TmpCounter

    lda NumberYLookup, y
    sta TmpY

    lda NumberAttrLookup, y
    sta TmpAttr

    lda NumberXLookup, x
    sta TmpX

    ; load up tiles into sprites
    ldy #1
    ldx #4
@loop:
    ; tile
    lda TmpCounter
    sta (TmpAddr), y
    inc TmpCounter

    inc TmpAddr
    ; set the attr byte.  sprite behind background
    lda TmpAttr
    sta (TmpAddr), y
    inc TmpAddr
    inc TmpAddr
    inc TmpAddr

    ;lda TmpAddr
    ;adc #4
    ;sta TmpAddr
    dex
    bne @loop

    ; get back to the start sprite
    lda TmpAddr
    sec
    sbc #16
    sta TmpAddr
    clc

    ; load up first tile's x/y
    ldy #0
    lda TmpY
    sta (TmpAddr), y
    ldy #3
    lda TmpX
    sta (TmpAddr), y

    ; loop through the rest to calculate x/y
    lda TmpAddr
    adc #4
    sta TmpAddr

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
    sta (TmpAddr), y
    iny
    iny
    iny
    lda TmpX
    sta (TmpAddr), y

    lda TmpAddr
    clc
    adc #4
    sta TmpAddr
    rts

BOX_TILE_START  = $03

SeedAttrBoxes:
    .word sbRando
    .word sb01
    .word sb02
    .word sb03
    .word sb04
    .word sbThumb

sbRando:
    .byte $55, $00, $00, $00, $00
sb01:
    .byte $00, $55, $00, $00, $00
sb02:
    .byte $00, $00, $11, $00, $00
sb03:
    .byte $00, $00, $44, $11, $00
sb04:
    .byte $00, $00, $00, $44, $00
sbThumb:
    .byte $00, $00, $00, $00, $55

; offset of the first sprite tile in the sprite sheet
SPRITE_TILE_START = $80

NumberYLookup:
    ; top, mid, bottom
    .byte 76, 96, 116
NumberXLookup:
    ; 1st col, 2nd ...
    .byte 84, 108, 132, 156

; uses the NumberYLookup index value
NumberAttrLookup:
    .byte $01, $00, $02

SeedPalette:
    ;      input box,       inputed val
    .byte $0F,$10,$2D,$0F, $0F,$23,$13,$13, $0F,$15,$0F,$0F, $0F,$11,$11,$11
    ;       current char    prev             next
    .byte $0F,$33,$33,$33, $0F,$2D,$00,$10, $0F,$10,$00,$2D, $0F,$11,$11,$11
    .byte $EA, $EA
