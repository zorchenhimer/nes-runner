Game_Init:
    inc SkipNMI
    lda #PPU_MASK_OFF
    sta $2001

    lda #PPU_CTRL_HORIZ
    sta $2000

    jsr ClearSprites

    jsr ClearNametable0
    jsr ClearNametable1

    jsr ClearAttrTable0
    jsr ClearAttrTable1

    lda #0
    sta PlayerScore0
    sta PlayerScore1
    sta PlayerScore2
    sta PlayerScore3

    lda #10
    sta obs_countdown

    lda rng_seed
    bne @skip_rng_init
    lda #'Z'  ;$21
    sta rng_seed
    lda #'o'  ;$AB
    sta rng_seed+1
@skip_rng_init:

    lda rng_seed
    sta working_seed
    lda rng_seed+1
    sta working_seed+1

    ; prepare sprite zero
    lda #159
    sta spritezero

    lda #$0F
    sta spritezero+1

    lda #%00100001
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

    ldx #0
    ldy #0
    lda #PAUSED_X
@pyloop:
    sta sprites+35, x
    pha
    lda #PAUSED_Y
    sta sprites+32, x
    lda #' '
    sta sprites+33, x
    pla

    adc #8
    inx
    inx
    inx
    inx
    iny
    cpx #24
    bne @pyloop

    lda #0
    sta meta_column_offset
    sta meta_tile_addr
    sta map_column_addr

    lda #<meta_columns
    sta map_column_addr+0
    lda #>meta_columns
    sta map_column_addr+1

    lda #<GamePalette
    sta PaletteAddr
    lda #>GamePalette
    sta PaletteAddr+1
    jsr LoadPalettes

    lda #$23
    sta $2006
    lda #$2A
    sta $2006

    ; write the seed lable text to the screen
    ldx #0
@seedloop:
    lda SeedText, x
    beq @seeddone
    sta $2007
    inx
    jmp @seedloop

@seeddone:
    ; Load the seed and convert it to HEX ASCII to draw to screen.
    lda working_seed
    ;sta LevelSeed
    jsr BinToHex
    lda TmpY
    sta $2007
    lda TmpX
    sta $2007

    lda working_seed+1
    ;sta LevelSeed+1
    jsr BinToHex
    lda TmpY
    sta $2007
    lda TmpX
    sta $2007

    lda #PPU_CTRL_VERT
    sta $2000

    ldx #10
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

    lda #$0F
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

    lda #$0F
    ldx #0
@statusBarRow2:
    sta $2007
    inx
    cpx #32
    bne @statusBarRow2

    lda #$22
    sta $2006
    lda #$EA
    sta $2006

    ldx #0
@statusLoop:
    lda StatusPlaceholder, x
    beq @scoredone
    sta $2007
    inx
    jmp @statusLoop

@scoredone:

    lda #<Game_Frame
    sta DoFramePointer
    lda #>Game_Frame
    sta DoFramePointer+1

    lda #<Game_NMI
    sta DoNMIPointer
    lda #>Game_NMI
    sta DoNMIPointer+1

    ; reset scroll
    lda #0
    sta calc_scroll
    rts

Game_NMI:
    ; draw the next column if needed
    bit column_ready
    bvc @noDraw
    jsr Draw_Column
    lda #0
    sta column_ready
@noDraw:
    jsr Draw_Score

    ; scroll in the screen
    jsr update_scroll

    jmp NMI_Finished

StatusPlaceholder:
    .byte "Score 00,000,000", $00
SeedText:
    .byte "Level Seed  ", $00

;; End of Game_Init

HSInit:
    rts

Game_Frame:
    lda #BUTTON_START
    jsr ButtonPressedP1
    beq @nostart

    bit game_paused
    bvs @game_is_paused

    jsr g_PausedSprites_On
    dec game_paused
    jmp WaitSpriteZero

@game_is_paused:
    lda #0
    sta game_paused
    jsr g_PausedSprites_Off

@nostart:
    bit game_paused
    bvc @game_not_paused
    jmp WaitSpriteZero

@game_not_paused:
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

    lda #1
    jsr IncScore
    dec column_ready
    jsr generate_column

@waitFrame:
    jsr CheckCollide
    beq @jmptozero

    ; TODO: die
    lda #GS_DED
    sta current_gamestate
    inc gamestate_changed
@jmptozero:
    jmp WaitSpriteZero

CheckCollide:
    ; load up Y
    lda sprites
    cmp #$47    ; top of obstacle
    bcc @done

    ; check the player's right meta column
    lda meta_column_offset
    clc
    adc #3
    and #$1F
    asl a
    asl a
    tax
    lda meta_columns, x
    sta player_scroll
    bne @collide

    lda meta_column_offset
    clc
    adc #2
    and #$1F
    asl a
    asl a
    tax
    lda meta_columns, x
    sta player_scroll
    bne @collide
    jmp @done

@collide:
    ;lda #$05
    ;sta $039F

    lda #1
    rts

@done:
    ;lda #$0F
    ;sta $039F

    lda #0
    rts

; Adds register A to score.  Keep it under 100 at a time.
IncScore:
    clc
    adc PlayerScore0
    sta PlayerScore0
    cmp #100
    bcc @done

    sec
    sbc #100
    sta PlayerScore0
    inc PlayerScore1
    lda PlayerScore1
    cmp #100
    bcc @done

    sbc #100
    sta PlayerScore1
    inc PlayerScore2
    lda PlayerScore2
    cmp #100
    bcc @done

    sbc #100
    sta PlayerScore2
    inc PlayerScore3

@done:
;    rts
;
BufferScoreDisplay:
    ; clear text buffer and put the player score in the ones'
    ; spot for now
    ldx #0
    ldy #0
@updateLoop:
    lda #0
    sta PlayerScoreText, y
    iny
    lda PlayerScoreBase100, x
    sta PlayerScoreText, y
    iny
    inx
    cpx #4
    bne @updateLoop

;   separate the tens from the ones
    ldx #0
@splitBase100:
    lda PlayerScoreText+1, x    ; load the ones var
    cmp #10
    bcc @nextNumber
    sbc #10
    sta PlayerScoreText+1, x

    inc PlayerScoreText, x      ; inc tens place
    jmp @splitBase100

@nextNumber:
    inx
    inx
    cpx #8
    bne @splitBase100

; Make the numbers ASCII
@exitLoop:
    clc
    ldx #0
@ascii:
    lda PlayerScoreText, x
    adc #$30
    sta PlayerScoreText, x
    inx
    cpx #8
    bne @ascii
    rts

Draw_Score:
    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$22
    sta $2006
    lda #$F0
    sta $2006

    lda PlayerScoreText+0
    sta $2007
    lda PlayerScoreText+1
    sta $2007
    lda #','
    sta $2007

    lda PlayerScoreText+2
    sta $2007
    lda PlayerScoreText+3
    sta $2007
    lda PlayerScoreText+4
    sta $2007
    lda #','
    sta $2007

    lda PlayerScoreText+5
    sta $2007
    lda PlayerScoreText+6
    sta $2007
    lda PlayerScoreText+7
    sta $2007
    rts

UpdatePlayer:
    lda controller1
    and #BUTTON_A
    beq @noJump

    lda JumpPeak
    bne @noJump

    ; Has the player hit the peak of the jump? (have we run out of jump frames?)
    lda PlayerJumpFrame
    cmp JumpFrameLength
    bcs @setPeak

    ; Load the next jump frame
    clc
    adc #1
    sta PlayerJumpFrame
    tax
    lda JumpFrames, x
    jmp @done

@setPeak:
    lda #1
    sta JumpPeak

@noJump:    ; falling back to ground
    lda #1
    sta JumpPeak

    ; Are we on the first jump frame?
    lda PlayerJumpFrame
    beq @ground

    ; Load the previous jump frame (cuz we fallin')
    sec
    sbc #1
    sta PlayerJumpFrame
    tax
    lda JumpFrames, x
    jmp @done

@ground:
    lda #0
    sta JumpPeak

    lda JumpFrames
    ;lda #$76

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
    lda working_seed
    bne @one
    ;lda seed_ram

@one:
    asl a    ; shift the register
    rol working_seed+1
    bcc @two
    ; Apply XOR feedback whenever a 1 bit is shifted out
    eor #$2D
@two:

    dex
    bne @one    ; generate another bit

    sta working_seed
    ;sta seed_ram

    lda working_seed+1
    ;sta seed_ram+1
    cmp #0  ; reload flags
    sta rng_result
    rts

generate_column:
    ldy #0  ; actual tile offset?
@loop:
    ; top two tiles can be either air or an obstacle
    ; bottom two can be either ground or a pitfall ("deadly" air)
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
    and #%00001110
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

; TODO: Pitfalls
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

g_PausedSprites_On:
    ldx #0
    ldy #0
@loop:
    lda PausedSprites, y
    sta sprites+33, x
    inx
    inx
    inx
    inx
    iny
    cpx #24
    bne @loop
    rts

g_PausedSprites_Off:
    ldx #0
    lda #' '
@loop:
    sta sprites+33, x
    inx
    inx
    inx
    inx
    cpx #24
    bne @loop
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
    bit $2002
    ; mask off the fine scroll (left with coarse)
    lda calc_scroll
    and #$F8
    asl a   ; mult by 2
    sta coarse_scroll

    ; load the fine scroll
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

GamePalette:
    .byte $0F,$17,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39
    .byte $0F,$15,$2B,$39, $0F,$0F,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39

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

PAUSED_X    = 104
PAUSED_Y    = 25
PausedSprites:
    .byte "Paused"

; peak is at $3F
JumpFrameLength:
    .byte JumpFrameEnd - JumpFrames - 1

JumpFrames:
    ;.byte $76, $71, $6C, $67, $62, $5E, $5A, $56, $52, $4E, $4B, $48
    ;.byte $45, $42, $3F, $3D, $3B, $39, $37, $35, $34, $33, $32, $31
    ;.byte $30, $30, $30, $30, $30, $30, $30

    .byte $76, $71, $6c, $67, $63, $5f, $5b, $57, $54, $51, $4e, $4b
    .byte $49, $47, $45, $44, $43, $42, $41, $41, $41, $41, $41, $41
    ;.byte $41, $41, $41, $41, $41, $41, $41

    ;.byte $76, $71, $6C, $67, $62, $5E, $5A, $56, $52, $4F, $4C, $49
    ;.byte $46, $44, $42, $40, $3E, $3D, $3C, $3B, $3A, $3A, $3A, $3A
    ;.byte $3A, $3A, $3A, $3A, $3A, $3A, $3A

    ;.byte $76, $71, $6E, $6C, $6A, $68, $66, $64, $62, $60
    ;.byte $5E, $5C, $5A, $58, $56, $54, $52, $50, $4E, $4C, $4A, $48
    ;.byte $46, $44, $42, $40, $3E
JumpFrameEnd:
    nop ; to separate the JumpFrameEnd label from DedInit
