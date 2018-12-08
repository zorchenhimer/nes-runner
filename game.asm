Game_Init:
    inc SkipNMI
    lda #PPU_MASK_OFF
    sta $2001

    lda #PPU_CTRL_HORIZ
    sta $2000

    ; Clear sprites and nametables
    jsr ClearSprites

    jsr ClearNametable0
    jsr ClearNametable1

    jsr ClearAttrTable0
    jsr ClearAttrTable1

    ; Initialize a bunch of variables
    lda #0
    sta PlayerScore0
    sta PlayerScore1
    sta PlayerScore2
    sta PlayerScore3
    sta screen_odd
    sta meta_column_offset
    sta meta_tile_addr
    sta map_column_addr
    sta column_ready
    sta calc_scroll

    lda #10
    sta obs_countdown

    ; Load the RNG seed form PRG RAM and re-seed if it doesn't exist
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
    sta meta_last_buffer
    sta meta_last_gen

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
    ; end of player sprite

    ; Prepare "Paused" sprites. Position them and give them attributes,
    ; but set the tiles to a blank space.
    ldx #0
    ldy #0
    lda #PAUSED_X
@pyloop:
    sta sprites+35, x
    pha     ; save A

    lda #PAUSED_ATTR
    sta sprites+34, x
    lda #PAUSED_Y
    sta sprites+32, x
    lda #' '
    sta sprites+33, x

    pla     ; load A
    adc #8
    inx
    inx
    inx
    inx
    iny
    cpx #24
    bne @pyloop

    ; initial value for fading paused palette
    lda #$20
    sta PAUSED_PAL

    lda #<GamePalette
    sta PaletteAddr
    lda #>GamePalette
    sta PaletteAddr+1
    jsr LoadPalettes

; Status bar stuff
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
    jsr BinToHex
    lda TmpY
    sta $2007
    lda TmpX
    sta $2007

    lda working_seed+1
    jsr BinToHex
    lda TmpY
    sta $2007
    lda TmpX
    sta $2007

; Generate and draw first screen of columns (plus a few)
    lda #PPU_CTRL_VERT
    sta $2000

    ldx #10
@drawWholeMap:
    jsr generate_column
    jsr Buffer_Column
    jsr Draw_Column
    lda meta_last_buffer
    cmp #19
    bne @drawWholeMap

; Draw status bar stuff
    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$22
    sta $2006
    lda #$80
    sta $2006

; Draw row for sprite zero to collide with
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

    ; Same as above, but for second nametable
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
    lda ScoreText, x
    beq @scoredone
    sta $2007
    inx
    jmp @statusLoop

@scoredone:

    ; Initialize score display
    jsr Draw_Score

    ; Set frame and NMI pointers
    lda #<Game_Frame
    sta DoFramePointer
    lda #>Game_Frame
    sta DoFramePointer+1

    lda #<Game_NMI
    sta DoNMIPointer
    lda #>Game_NMI
    sta DoNMIPointer+1
    rts
;; End of Game_Init

Game_NMI:
    ; Check to see if a column is buffered.  If so, draw it
    ; to the screen.
    bit column_ready
    bvc @noDraw
    jsr Draw_Column

    lda #0
    sta column_ready
@noDraw:

    jsr Draw_Score
    jsr update_scroll
    jmp NMI_Finished

Game_Frame:
    ; Check for start button presse.  Pause if it has been.
    lda #BUTTON_START
    jsr ButtonPressedP1
    beq @nostart

    ; If already paused, unpause
    bit game_paused
    bvs @game_is_paused

    ; Pause game, display "Paused" sprites
    jsr g_PausedSprites_On
    ; TmpX and TmpY are used for cycling the palette for the
    ; "Paused" text.
    lda #0
    sta TmpX    ; Color index
    lda #2
    sta TmpY    ; Frames until next update

    dec game_paused  ; set pause state
    jmp WaitSpriteZero

; Unpause the game, hide "Paused" sprites
@game_is_paused:
    lda #0
    sta game_paused
    jsr g_PausedSprites_Off

; Pause not pressed
@nostart:
    bit game_paused
    bvc @game_not_paused
    ; Game is paused

    ; "Paused" fade thing
    dec TmpY    ; Update palette when TmpY is zero.
    bne @noColor

    lda #8
    sta TmpY    ; Update platte once every eight frames.

    ldx TmpX
    lda DedStartPal, x
    sta PAUSED_PAL
    inx
    cpx #6
    ; Wrap color index if needed
    bne @noWrap
    ldx #0
@noWrap:
    stx TmpX

@noColor:
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
    lda calc_scroll
    lsr a
    lsr a
    lsr a
    sta meta_column_offset

    ; Increment the score and generate a new column when
    ; a meta column boundary is crossed by the player.
    cmp last_meta_offset
    beq @waitFrame

    lda #1
    jsr IncScore
    jsr generate_column

@waitFrame:
    ;jsr CheckCollide   ; TODO: re-enable collision
    lda #0
    beq @jmptozero

    ; Collision == ded
    lda #GS_DED
    sta current_gamestate
    inc gamestate_changed
@jmptozero:

    ; If last drawn column is not the same as last generated
    ; a buffer and draw are needed.  This will trigger if the
    ; last generated thing is more than two columns wide.
    lda meta_last_gen
    cmp meta_last_buffer
    beq @noBuffer
    jsr Buffer_Column

@noBuffer:
    ; Disable sprite zero hit for now
    ;jmp WaitSpriteZero
    jmp WaitFrame

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
    bcc BufferScoreDisplay

    sec
    sbc #100
    sta PlayerScore0
    inc PlayerScore1
    lda PlayerScore1
    cmp #100
    bcc BufferScoreDisplay

    sbc #100
    sta PlayerScore1
    inc PlayerScore2
    lda PlayerScore2
    cmp #100
    bcc BufferScoreDisplay

    sbc #100
    sta PlayerScore2
    inc PlayerScore3

    ; Buffer tile changes for score
BufferScoreDisplay: ; this label is used in scores.asm

    ; Clear text buffer and put the player score in the ones'
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

    ; Separate the tens from the ones
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

; Draw the score to the screen in the status bar thing.
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

; Get the meta_column_addr given the current
; meta_last_gen value and increment meta_last_gen.
gc_MetaColumnAddrFromOffset:
    lda #<meta_columns
    sta map_column_addr
    lda #>meta_columns
    sta map_column_addr+1

    lda meta_last_gen

    ; Check overflow and wrap when needed.
    ;cmp #32
    cmp #31
    bcc @noWrap

    lda #$FF
    sta meta_last_gen

    ; For debugging.  Toggle this each time the screen wraps.
    lda screen_odd
    beq @set
    lda #$00
    sta screen_odd
    jmp @noWrap

@set:
    lda #$FF
    sta screen_odd

@noWrap:
    ; Multiply meta_last_gen by four and add it
    ; to the map_column_address.
    lda meta_last_gen   ; reload this because A is clobbered
    asl a
    asl a
    clc
    adc map_column_addr
    sta map_column_addr

    ; Increment for next time.
    ; Should this happen at the start? (and init to $FF?)
    inc meta_last_gen
    rts

; Load the meta column that's pointed to in the TmpAddr
; into the meta column buffer (not the tile draw buffer).
gc_LoadMetaColumn:
    ldy #0
    ; load map_column_addr with the correct offset
    jsr gc_MetaColumnAddrFromOffset

@loop:  ; once for each meta tile in the column (ie, 4 times)
    ; TmpAddr is the metacolumn definition
    lda (TmpAddr), y
    sta (map_column_addr), y
    iny
    cpy #4
    bne @loop
    rts

; buffer no obstacles
gc_GenerateNothin:
    lda #<MetaColumn_Nothin
    sta TmpAddr
    lda #>MetaColumn_Nothin
    sta TmpAddr+1
    jmp gc_LoadMetaColumn

; buffer a single column of obstacles
gc_GenerateObsA:
    lda #<MetaColumn_OBS_A
    sta TmpAddr
    lda #>MetaColumn_OBS_A
    sta TmpAddr+1
    jmp gc_LoadMetaColumn

; buffer two columns of obstacles
gc_GenerateObsB:
    ; TODO
    rts

; buffer a single columns of air, no ground
gc_GeneratePit:
    lda #<MetaColumn_Pit
    sta TmpAddr
    lda #>MetaColumn_Pit
    sta TmpAddr+1
    jmp gc_LoadMetaColumn

; Entry point for generating columns
generate_column:
    ; Debug columns.  Remove the following three lines
    ; to re-enable RNG generation.
    bit screen_odd
    bvs gc_GenerateDBG_A
    jmp gc_GenerateDBG_B

    lda obs_countdown
    beq @doRngThing

    dec obs_countdown
    jmp gc_GenerateNothin

@doRngThing:
    lda #5
    sta obs_countdown
    jsr prng
    lda rng_result
    and #%00000011
    ; RTS trick to load a meta column
    asl a
    tax

    lda MetaColumn_Subs+1, x
    pha
    lda MetaColumn_Subs, x
    pha
    rts

; Debugging columns
gc_GenerateDBG_A:
    lda #<MetaColumn_DBG_A
    sta TmpAddr
    lda #>MetaColumn_DBG_A
    sta TmpAddr+1
    jmp gc_LoadMetaColumn

gc_GenerateDBG_B:
    lda #<MetaColumn_DBG_B
    sta TmpAddr
    lda #>MetaColumn_DBG_B
    sta TmpAddr+1
    jmp gc_LoadMetaColumn

; Buffer a meta column's tiles to be drawn during the
; next NMI.  This expands meta tiles to their individual
; tiles spanning two tile columns.
Buffer_Column:
    ; Wrap this just like meta_last_gen
    lda meta_last_buffer
    ;cmp #32
    cmp #31
    bcc @noWrap

    lda #$00
    sta meta_last_buffer
@noWrap:

    ; Set this to trigger Draw_Column during next NMI
    lda #$FF
    sta column_ready

    ; find the current meta column
    lda meta_last_buffer
    ; multiply by four.  each column is four meta tiles.
    asl a
    asl a
    sta map_meta_tmp    ; meta tile offset in buffer
    tax

    lda meta_last_buffer
    cmp #16
    bcs @secondNT

    lda #$21
    sta tile_column_addr_high
    lda meta_last_buffer
    jmp @addrLow

@secondNT:
    lda #$25
    sta tile_column_addr_high
    lda meta_last_buffer
    ; Subtract 16 to get it back to the start of the nametable
    sec
    sbc #16

@addrLow:
    ; low byte = (meta_last_draw * 2) + $80
    clc
    asl a
    adc #$80
    sta tile_column_addr_low

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

    inc meta_last_buffer
    rts

; Turn on "Paused" sprites
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

; Turn off "Paused" sprites
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

; Draw the column that is buffered in RAM.
Draw_Column:

    lda #PPU_CTRL_VERT
    sta $2000

    bit $2002
    lda tile_column_addr_high
    sta $2006
    lda tile_column_addr_low
    sta $2006

    ; First tile column
    ldx #0
@loop:
    lda tile_column_buffer, x
    sta $2007
    inx
    lda tile_column_buffer, x
    sta $2007
    inx
    cpx #8
    bne @loop

    ; Increment low byte for second tile column
    inc tile_column_addr_low

    lda tile_column_addr_high
    sta $2006
    lda tile_column_addr_low
    sta $2006

    ; Second tile column
    ldx #8
@loop2:
    lda tile_column_buffer, x
    sta $2007
    inx
    lda tile_column_buffer, x
    sta $2007
    inx
    cpx #16
    bne @loop2
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

ScoreText:
    .byte "Score ", $00
SeedText:
    .byte "Level Seed  ", $00

GamePalette:
    .byte $0F,$17,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39, $0F,$1C,$2B,$39
    .byte $0F,$15,$2B,$39, $0F,$0F,$2B,$39, $0F,$20,$2B,$39, $0F,$1C,$2B,$39

; Meta tile IDs -> meta tile tile addresses
MetaTiles:
    .word Meta_Sky
    .word Meta_Ground
    .word Meta_Obstacle
    .word Meta_Pit

; Game Meta Columns
G_MC_NOTHIN = $00
G_MC_OBS_A  = $01
G_MC_OBS_B  = $02
G_MC_PIT    = $03

; used for RNG
MetaColumn_Subs:
    .word gc_GenerateNothin-1
    ;.word gc_GenerateObsA-1
    .word gc_GenerateObsA-1
    .word gc_GenerateObsA-1
    ;.word gc_GenerateObsB-1
    .word gc_GeneratePit-1

; Meta tile indicies
MetaColumn_Nothin:
    .byte $00, $00, $01, $01
MetaColumn_OBS_A:
    .byte $02, $02, $01, $01
MetaColumn_OBS_B:
    .byte $02, $02, $01, $01
MetaColumn_Pit:
    .byte $00, $00, $04, $04

MetaColumn_DBG_A:
    .byte $01, $01, $01, $01
MetaColumn_DBG_B:
    .byte $02, $02, $02, $02

; Tile indicies
Meta_Sky:
    .byte $80, $90, $81, $91
Meta_Ground:
    .byte $A0, $B0, $A1, $B1
Meta_Obstacle:
    .byte $82, $92, $83, $93
Meta_Pit:
    .byte $A2, $B2, $A3, $B3

PAUSED_X    = 104
PAUSED_Y    = 25
PAUSED_ATTR = $02
PAUSED_PAL  = PaletteRAM+6
PausedSprites:
    .byte "Paused"

PausedPalTable:
    .byte $2D,$00,$10,$20,$10,$00

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

