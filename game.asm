Game_Init:
    inc SkipNMI
    lda #PPU_MASK_OFF
    sta $2001

    lda rng_seed
    bne @skip_rng_init
    lda #'Z'  ;$21
    sta rng_seed
    lda #'o'  ;$AB
    sta rng_seed+1
@skip_rng_init:

    ; prepare sprite zero
    lda #159
    sta spritezero

    lda #$03
    sta spritezero+1

    lda #0
    sta spritezero+2

    lda #0
    sta spritezero+3

    ; Setup the player sprite
    ; Y, idx, attr, X
    ; first sprite column
    lda #$04    ; sprite tile index
    sta TmpCounter

    lda #$00
    sta TmpAttr

    lda #$5E
    sta TmpY
    lda #$10
    sta TmpX
    ldx #0
@spLoop:
    ; y
    lda TmpY
    sta sprites, x
    inx
    clc
    adc #8
    sta TmpY

    ; idx
    lda TmpCounter
    sta sprites, x
    inx
    inc TmpCounter

    ; attr
    lda TmpAttr
    sta sprites, x
    inx

    ; X
    lda TmpX
    sta sprites, x
    inx

    ; test for second column
    lda TmpCounter
    cmp #$08
    bcc @noTmpWrap

    lda #$04
    sta TmpCounter

    lda #%01000000
    sta TmpAttr

    lda #$5E
    sta TmpY

    lda TmpX
    clc
    adc #$08
    sta TmpX

@noTmpWrap:
    cpx #32
    bne @spLoop

    lda #0
    sta meta_column_offset
    sta meta_tile_addr
    sta map_column_addr
    sta nmi_draw

    ; TODO: remove constant here
    lda #$03
    sta map_column_addr+1

    lda #<GamePalette
    sta PaletteAddr
    lda #>GamePalette
    sta PaletteAddr+1

    jsr LoadPalette

    lda #PPU_CTRL_VERT
    sta $2000

; Initialy generate and draw both nametables
@drawWholeMap:
    jsr generate_column
    jsr Draw_Column
    inc meta_column_offset
    lda meta_column_offset
    cmp #32
    bne @drawWholeMap

    lda #0
    sta sleeping

    jsr meta_idx_from_scroll

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$22
    sta $2006
    lda #$80
    sta $2006

    lda #$02
    ldx #0
@statusBarRow1:
    sta $2007
    inx
    cpx #32
    bne @statusBarRow1

    lda #$26
    sta $2006
    lda #$80
    sta $2006

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$02
    ldx #0
@statusBarRow2:
    sta $2007
    inx
    cpx #32
    bne @statusBarRow2

    lda StatusPlaceholder
    sta TmpCounter
    inc TmpCounter

    lda #$22
    sta $2006
    lda #$EA
    sta $2006

    ldx #1
@statusLoop:
    lda StatusPlaceHolder, x
    sta $2007
    inx
    dec TmpCounter
    bne @statusLoop

    lda #PPU_MASK
    sta $2001
    lda #0
    sta SkipNMI
    rts

StatusPlaceholder:
    .byte $0F, "Score 5 210 431"

;; End of Game_Init

DedInit:
    rts

HSInit:
    rts

Game_Frame:
    ; increment the screen position
    inc calc_scroll

    jsr UpdatePlayer

    ; store previous meta column offset
    lda meta_column_offset
    sta last_meta_offset

    ; update meta column offset and generate
    ; next column if changed
    jsr meta_idx_from_scroll
    cmp last_meta_offset
    beq @waitFrame
    jsr generate_column
    inc nmi_draw

@waitFrame:

; wait for vblank to end
@loop_sprite:
    bit $2002
    bvs @loop_sprite

; wait for sprite zero hit
@loop_sprite2:
    bit $2002
    bvc @loop_sprite2

    ; update scroll for status bar (only X matters here)
    lda #00
    sta $2005
    ; first nametable
    lda #PPU_CTRL_VERT
    sta $2000
    jmp WaitFrame

UpdatePlayer:
    lda controller1
    and #BUTTON_A
    beq @noJump

    lda JumpPeak
    bne @noJump

    ; do calculations based on the lower right sprite
    lda sprites+28
    cmp #$3F
    bcc @setPeak

    sec
    sbc #PLAYER_JMP_SPEED
    jmp @done

@setPeak:
    lda #1
    sta JumpPeak

@noJump:    ; falling back to ground
    lda sprites+28
    ; Did we hit the ground?
    cmp #$76
    beq @ground

    clc
    adc #PLAYER_JMP_SPEED
    jmp @done

@ground:
    lda #0
    sta JumpPeak

    lda #$76

@done:
    sec
    ; Update all the sprite positions
    sta sprites+28
    sta sprites+12
    sbc #8
    sta sprites+24
    sta sprites+8
    sbc #8
    sta sprites+20
    sta sprites+4
    sbc #8
    sta sprites+16
    sta sprites+0
    rts

sp_UpdateAllSprites:
    rts

; Get the metacolumn from the current scroll
meta_idx_from_scroll:
    lda calc_scroll
    lsr a
    lsr a
    lsr a
    sta meta_column_offset

    ; generate the column to the left of the screen, not on the screen
    dec meta_column_offset

    ; check for underflow
    lda meta_column_offset
    cmp #$FF
    bne @done
    lda #31
    sta meta_column_offset

@done:
    rts

prng:
    ldx #8  ; iteration count (generates 8 bits)
    lda rng_seed
    bne @one
    ;lda seed_ram

@one:
    asl a    ; shift the register
    rol rng_seed+1
    bcc @two
    ; Apply XOR feedback whenever a 1 bit is shifted out
    eor #$2D
@two:

    dex
    bne @one    ; generate another bit

    sta rng_seed
    ;sta seed_ram

    lda rng_seed+1
    ;sta seed_ram+1
    cmp #0  ; reload flags
    sta rng_result
    rts

generate_column:
    ldy #0  ; actual tile offset?
@loop:
    cpy #$02
    bcs @ground

    lda obs_countdown
    bne @obsdec
    jmp @obszero

@obsdec:
    dec obs_countdown
    jmp @sky

@obszero:
    jsr prng
    lda rng_result
    lsr a       ; bit 0 -> carry
    bcc @sky    ; no obstacle

    lda rng_result
    and #%00011110
    sta obs_countdown

    ; draw obstacle
    lda #02
    sta (map_column_addr), y
    iny
    sta (map_column_addr), y
    jmp @next

@sky:
    ; add sky byte
    lda #00
    sta (map_column_addr), y
    iny
    sta (map_column_addr), y
    jmp @next

@ground:
    cpy #$04
    beq @done

    ; draw ground
    lda #01
    sta (map_column_addr), y
    jmp @next

@next:
    ;inx
    iny
    jmp @loop

@done:
    jsr Load_column

    lda meta_column_offset
    cmp #31
    bcs @reset

    ; increment map column ram address
    lda map_column_addr
    clc
    adc #$04
    sta map_column_addr

    lda map_column_addr+1
    adc #0
    sta map_column_addr+1
    jmp @end

@reset:
    lda #$00
    sta map_column_addr
    lda #$03
    sta map_column_addr+1

@end:
    rts

Load_column:

; load up a meta tile from map data with current meta_column_offset
; write all four tiles to buffer in one loop

    ; find the current meta column
    lda meta_column_offset
    ; multiply by four.  each column is for meta tiles.
    asl a
    asl a
    sta map_meta_tmp
    tax

    ldy #0
@tileLoop:
    ; Load meta tile index
    ldx map_meta_tmp
    lda meta_columns, x
    asl a
    tax

    ; load address of meta tile definition
    lda MetaTiles, x
    sta meta_tile_addr
    lda MetaTiles+1, x
    sta meta_tile_addr+1

    ; transfer meta tile's tiles to buffer
    ldx #0
    lda (meta_tile_addr, x)
    sta tile_column_buffer, y

    inc meta_tile_addr
    lda (meta_tile_addr, x)
    sta tile_column_buffer+1, y

    inc meta_tile_addr
    lda (meta_tile_addr, x)
    sta tile_column_buffer+8, y

    inc meta_tile_addr
    lda (meta_tile_addr, x)
    sta tile_column_buffer+9, y

    inc map_meta_tmp
    iny
    iny
    cpy #8
    bne @tileLoop

    rts

Draw_Column:
    lda #PPU_CTRL_VERT
    sta $2000

    lda meta_column_offset
    cmp #16
    bcs secondNametable

    ; Address for first nametable starting at $2000
    lda #$21
    sta $2006
    lda meta_column_offset
    asl a
    clc
    adc #$80
    sta $2006

    jmp drawCol1

secondNametable:
    ; Address for second nametable starting at $2400
    lda #$25
    sta $2006
    lda meta_column_offset
    sec
    sbc #$10
    asl a
    clc
    adc #$80
    sta $2006

drawCol1:
    ldx #0
    ;ldy #0
@loop:
    lda tile_column_buffer, x
    sta $2007
    inx
    cpx #8
    bne @loop

;@loopNextCol:
    lda meta_column_offset
    cmp #16
    bcs secondNametable2

    ; Address for first nametable starting at $2000
    lda #$21
    sta $2006
    lda meta_column_offset
    asl a
    clc
    adc #1
    clc
    adc #$80
    sta $2006

    jmp drawCol2

secondNametable2:
    ; Address for second nametable starting at $2400
    lda #$25
    sta $2006
    lda meta_column_offset
    sec
    sbc #$10
    asl a
    clc
    adc #1
    clc
    adc #$80
    sta $2006

drawCol2:
    ldx #8
@loop2:
    lda tile_column_buffer, x
    sta $2007
    inx
    cpx #16
    bne @loop2

@done:
    ;inc meta_column_offset
    rts

; update the PPU's scroll
update_scroll:
    ; mask off the coarse stuff
    lda calc_scroll
    and #$F8
    asl a   ; mult by 2
    sta coarse_scroll

    ; fine scroll
    lda calc_scroll
    and #$07
    clc
    asl a
    adc coarse_scroll
    sta $2005

    ; y is always 0
    lda #00
    sta $2005

    ; 2nd nametable?
    bit calc_scroll
    bmi @nt2

    lda #PPU_CTRL_VERT
    sta $2000
    jmp @done

@nt2:
    lda #PPU_CTRL_VERT
    ora #$01
    sta $2000

@done:
    rts

NMI_GameScroll:

    rts

GamePalette:
    .byte $0F,$17,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39
    .byte $0F,$15,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39

MetaTiles:  ; meta tile IDs -> meta tile tile addresses
    .word Meta_Sky, Meta_Ground, Meta_Obstacle, Meta_Powerup

Meta_Sky:
    .byte $80, $90, $81, $91
Meta_Ground:
    .byte $A0, $B0, $A1, $B1
Meta_Obstacle:
    .byte $82, $92, $83, $93
Meta_Powerup:
    .byte $A0, $B0, $A1, $B1
