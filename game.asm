; asmsyntax=ca65

; TODO:
;   Fall into pitfall.
FIRE_SPAWN_DELAY = 8

; Game Meta Tiles
.enum MetaTileTypes
    BACKGROUND
    GROUND
    GROUND2
    PIT_LEFT
    PIT_RIGHT
    PIT_LEFT_BOTTOM
    PIT_RIGHT_BOTTOM
    NOTHIN
    OBS
    PIT
    FIREHYDRANT

    TRUCK00
    TRUCK01
    TRUCK02
    TRUCK03

    GARBO00
    GARBO01
.endenum

Game_Init:
    jsr MMC1_Setup_Vert

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #<PalBG3
    sta TmpAddr
    lda #>PalBG3
    sta TmpAddr+1
    jsr LoadPaletteBG3

    ; Initialize a bunch of variables
    lda #0
    sta column_ready
    sta StatusDrawn
    ;sta meta_column_offset
    sta meta_tile_addr
    sta TmpAttr
    ;sta meta_cols_to_buffer
    ;sta meta_last_buffer
    sta sfxStart_Fall
    sta sfxStart_Jump
    sta SkyScroll
    sta SkyScroll+1
    sta game_paused

    lda #SKYLINE_SCROLL_SPEED
    sta SScrollNext

; Status bar stuff

; Generate and draw first screen of columns (plus a few)
    lda #PPU_CTRL_VERT
    sta $2000

    bit GameFullInit
    bvc @skip_fullinit
    lda #0
    sta GameFullInit
    jsr game_FullInit

@skip_fullinit:
    ; Scroll to the start of the first screen
    lda #0
    sta $2005
    sta $2005
    ldx #PPU_CTRL_VERT
    stx $2000

    ; More init stuff
    sta PlayerScore0
    sta PlayerScore1
    sta PlayerScore2
    sta PlayerScore3
    sta rngFlipFlop
    sta calc_scroll

    lda #$F0
    ldx #7
:   sta PlayerScoreText, x
    dex
    bpl :-

@scoredone:
    ; prepare sprite zero
    lda #88
    sta spritezero

    lda #$0F
    sta spritezero+1

    lda #%00100001
    sta spritezero+2

    lda #88
    sta spritezero+3

    ; Setup the player sprite
    ; Y, idx, attr, X

    lda #<PlayerSprite_Frame0
    sta TmpAddr
    lda #>PlayerSprite_Frame0
    sta TmpAddr+1

    lda #$5E
    sta TmpY    ; Y coordinate
    lda #$10
    sta TmpX    ; X coordinate
    ldx #0      ; byte offset in sprite memory
    ldy #0      ; Tile index for sprite definition
    sty TmpCounter
@spLoop:
    ; y
    lda TmpY
    sta sprites, x
    inx
    clc
    adc #8
    sta TmpY

    ; idx
    lda (TmpAddr), y
    sta sprites, x
    inx
    inc TmpAddr
    ; Handle overflow
    bne :+
    inc TmpAddr+1
:
    inc TmpCounter

    ; attr
    lda #$00
    sta sprites, x
    inx

    ; X
    lda TmpX
    sta sprites, x
    inx

    ; test for second column
    lda TmpCounter
    cmp #$04
    bne @noTmpWrap

    lda #$04
    sta TmpCounter

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

    lda #PlayerSprite_AnimSpeed
    sta PlayerNextFrameIn
    lda #$FF
    sta PlayerSpriteFrame

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
    lda #$00
    sta sprites+33, x

    pla     ; load A
    clc
    adc #8
    inx
    inx
    inx
    inx
    iny
    cpx #4*5
    bne @pyloop

    ; initial value for fading paused palette
    lda #$20
    sta PAUSED_PAL

    ; Init the first 16 columns
    ; TODO: move these somewhere else
    ldx #0
:
    lda #$00
    sta meta_columns, x
    inx
    sta meta_columns, x
    inx

    lda #$01
    sta meta_columns, x
    inx
    sta meta_columns, x
    inx

    cpx #16*4
    bne :-

    ; Clear the buffer and buffer addresses for the attributes
    lda #0
    sta attr_buffer
    sta attr_buffer+1
    sta attr_address
    sta attr_address+1
    sta attr_odd

    ; Clear the new fire metasprite countdown
    lda #$FF
    sta NewFireIn
    lda #0
    sta FireAnimIdx
    sta FireAnimCount
    sta calc_scroll
    sta meta_column_offset
    sta last_meta_offset

    lda #FIRE_ANIM_SPEED
    sta FireAnimNext

    ; Clear drawing old fire sprites
    lda #$FF
    ldx #0
:
    sta FireAnimFrame, x
    inx
    cpx #8
    bne :-

    ; Set frame and NMI pointers
    lda #<Game_Frame
    sta DoFramePointer
    lda #>Game_Frame
    sta DoFramePointer+1

    lda #<Game_NMI
    sta DoNMIPointer
    lda #>Game_NMI
    sta DoNMIPointer+1

    lda rng_seed
    and #1
    clc
    adc #1
.ifdef NTSC
    ldx #0
.else
    ldx #1
.endif
    jsr snd_LOAD
    rts

game_FullInit:
    inc SkipNMI

    lda #PPU_MASK_OFF
    sta $2001

    lda #<GamePalette
    sta PaletteAddr
    lda #>GamePalette
    sta PaletteAddr+1
    jsr LoadPalettes

    lda #BackgroundThemes::City
    sta BGTheme

    lda #$20
    sta BGNametable

    lda #$00
    sta BGYStart
    jsr DrawBackground

    lda #BackgroundThemes::City
    sta BGTheme

    lda #$24
    sta BGNametable

    lda #$00
    sta BGYStart
    jsr DrawBackground

    ; Update attribute data
    lda #$23
    sta $2006
    lda #$D8
    sta $2006

    lda #$AA
    jsr game_DrawAttributeRow
    lda #$55
    jsr game_DrawAttributeRow
    lda #$AA
    jsr game_DrawAttributeRow
    jsr game_DrawAttributeRow

    ; Attributes for the first two columns on
    ; the second nametable
    lda #$27
    sta $2006
    lda #$D8
    sta $2006
    lda #$AA
    sta $2007

    lda #$27
    sta $2006
    lda #$E0
    sta $2006
    lda #$55
    sta $2007

    lda #$FF
    sta meta_last_gen
    lda #$00
    sta meta_cols_to_buffer
    sta meta_last_buffer
    sta meta_column_offset
    sta column_ready

    lda #18
    sta obs_countdown

    sta TmpZ
@drawWholeMap:
    lda meta_cols_to_buffer
    bne @buffer
    jsr generate_column
@buffer:
    jsr Buffer_Column
    jsr Draw_Column

    dec TmpZ
    bne @drawWholeMap

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #0
    sta column_ready

    jmp game_ClearStatusBar
    ;rts
;; End of Game_Init

game_ClearStatusBar:
    lda #$22
    sta $2006
    lda #$80
    sta $2006

    ldx #10
    ldy #$00
@loop:
.repeat 32
    sty $2007
.endrepeat
    dex
    bne @loop

    lda #$26
    sta $2006
    lda #$80
    sta $2006

.repeat 32
    sty $2007
.endrepeat
    rts

game_DrawAttributeRow:
.repeat 8
    sta $2007
.endrepeat
    rts

Game_NMI:
    jsr WritePalettes
    jsr WriteSprites

    bit StatusDrawn
    bmi :+
    ldx #PPU_CTRL_HORIZ
    stx $2000
    jsr WriteScoreLabel
    jsr WriteSeedLabel
    lda #$FF
    sta StatusDrawn
:

    ; Check to see if a column is buffered.  If so, draw it
    ; to the screen.
    bit column_ready
    bvc @noDraw     ; check if $40 is set
    jsr Draw_Column
@noDraw:

    bit column_ready
    bpl @noAttr
    jsr Draw_Attribute
@noAttr:

    lda #0
    sta column_ready

    jsr Draw_Score

    jsr WriteSkylineScroll
    jmp NMI_Finished

Game_Frame:
    jsr UpdateFire
    jsr BufferSkylineScroll

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
    lda PausedPalTable, x
    sta PAUSED_PAL
    inx
    cpx #4
    ; Wrap color index if needed
    bne @noWrap
    ldx #0
@noWrap:
    stx TmpX

@noColor:
    jmp WaitSpriteZero

@game_not_paused:
    ; Is it time for the next frame?
    dec PlayerNextFrameIn
    bne @noAnimFrame

    ; Prep the countdown to the next frame
    lda #PlayerSprite_AnimSpeed
    sta PlayerNextFrameIn

    ; Inc frame id index
    inc PlayerSpriteFrame
    ; Check for wrap around
    lda PlayerSpriteFrame
    cmp #PlayerSprite_FrameCount
    bne :+

    ; Wrapped around, load first frame
    lda #0
    sta PlayerSpriteFrame
:

    ; Load the frame
    jsr UpdatePlayerAnimation

@noAnimFrame:

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

    ; Chcek if there is something to buffer
    ; if so, skip generation
    lda meta_cols_to_buffer
    bne @needBuffer

    lda #1
    jsr IncScore
    jsr generate_column

@needBuffer:
    ; If last drawn column is not the same as last generated
    ; a buffer and draw are needed.  This will trigger if the
    ; last generated thing is more than two columns wide.
    jsr Buffer_Column

@waitFrame:
    jsr CheckCollide
    beq @pit

    ; Collision == ded
    lda #STATES::GS_DED
    sta current_gamestate
    inc gamestate_changed
@pit:
    jsr CheckPit
    beq @safe
    ; TODO: fall in pit

@safe:
    jmp WaitSpriteZero

; FIXME: Improve this (again).  Allow the player sprite to overlap
; the obstacle metatile by ~2 or so pixels.  In other words, give
; each obstacle metatile a ~2 pixel no-kill border.
CheckCollide:
    ; Find byte offset for current metacolumn to check for collide
    lda meta_column_offset
    clc
    adc #1  ; offeset from left side of screen to check for collide
    and #$1F    ; i forget why this is here, but i'm keeping it.
    asl a
    asl a
    tax

    ; Load meta columns into ColCache
    ldy #0
@loop:
    lda meta_columns, x
    sta ColCache, y
    inx
    iny
    lda meta_column_offset
    cmp #30     ; check for nametable wrap.  not 31 cuz we add 1 above.
    bne @nocheck
    cpy #4
    bne @loop
    jmp @Wrapped

@nocheck:
    cpy #8
    bne @loop
    jmp @NoWrap

@Wrapped:
    ldx #0
@WLoop:
    lda meta_columns, x
    sta ColCache, y
    inx
    iny
    cpy #8
    bne @WLoop

@NoWrap:
    ; Check collisions against cache
    lda SP_COLLIDE_Y
    cmp #$77
    bcc @layer2

    ; Layer 1: the Pit
    lda ColCache+3
    cmp #MetaTileTypes::OBS
    bcc @l1Right
    jmp @collide

@l1Right:
    lda ColCache+7
    cmp #MetaTileTypes::OBS
    bcc @layer2
    jmp @collide

    ; Lower obstacle on the ground
@layer2:
    lda SP_COLLIDE_Y
    cmp #$6A
    bcc @layer3

    lda ColCache+1
    beq @l2Right
    jmp @collide

@l2Right:
    lda ColCache+5
    beq @layer3
    jmp @collide

    ; Upper obstacle on the ground
@layer3:
    lda SP_COLLIDE_Y
    cmp #$5A
    bcc @done

    lda ColCache+0
    beq @l3Right
    jmp @collide

@l3Right:
    lda ColCache+4
    beq @done

@collide:
    lda #1
    rts

@done:
    lda #0
    rts

CheckPit:
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
    ldx #0
@ascii: ; not quite ASCII anymore
    lda PlayerScoreText, x
    ora #$F0
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
    lda #$2D
    sta $2007

    lda PlayerScoreText+2
    sta $2007
    lda PlayerScoreText+3
    sta $2007
    lda PlayerScoreText+4
    sta $2007
    lda #$2D
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

    lda sfxStart_Jump
    bne :+

    lda #$FF
    sta sfxStart_Jump

    lda #0
    ldy #4
    ;jsr LoadSequence
:

    ; Has the player hit the peak of the jump? (have we run out of jump frames?)
    lda PlayerJumpFrame
    cmp JumpFrameLength
    bcs @setPeak

    ; Load the frame's address
    lda #<PlayerSprite_Frame0
    sta TmpAddr
    lda #>PlayerSprite_Frame0
    sta TmpAddr+1

    jsr UpdatePlayerAnimationFrame

    ; Load the next jump frame
    lda PlayerJumpFrame
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

    lda sfxStart_Fall
    bne :+
    lda #$FF
    sta sfxStart_Fall
    ; Start playing the fall sfx
    lda #1
    ldy #4
    ;jsr LoadSequence
:

    ; Load the frame's address
    lda #<PlayerSprite_Frame3
    sta TmpAddr
    lda #>PlayerSprite_Frame3
    sta TmpAddr+1

    jsr UpdatePlayerAnimationFrame

    ; Load the previous jump frame (cuz we fallin')
    lda PlayerJumpFrame
    sec
    sbc #1
    sta PlayerJumpFrame
    tax
    lda JumpFrames, x
    jmp @done

@ground:
    lda #0
    sta JumpPeak
    sta sfxStart_Fall
    sta sfxStart_Jump

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

    lda PlayerJumpFrame
    beq :+
:
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
    ; Increment for next time.
    ; Should this happen at the start? (and init to $FF?)
    inc meta_last_gen

    lda meta_last_gen
    ; Check overflow and wrap when needed.
    cmp #$20
    bcc @noWrap

    lda #$00
    sta meta_last_gen

@noWrap:
    ; Multiply meta_last_gen by four and add it
    ; to the map_column_address.
    lda meta_last_gen   ; reload this because A is clobbered
    asl a
    asl a
    ;tax

    rts

; Entry point for generating columns
generate_column:
    lda obs_countdown
    beq @doRngThing

    dec obs_countdown
    lda #<MetaColumn_Nothin
    sta TmpAddr
    lda #>MetaColumn_Nothin
    sta TmpAddr+1
    jmp @gc_LoadMetaColumn

@doRngThing:
    lda #5
    sta obs_countdown
    lda rngFlipFlop
    bne @odd

    dec rngFlipFlop
    jsr prng
    lda rng_result
    and #$0F
    asl a
    jmp @idx
@odd:
    inc rngFlipFlop
    lda rng_result
    and #$F0
    lsr a
    lsr a
    lsr a
@idx:
    tax

    lda MetaColumn_Definitions, x
    sta TmpAddr
    lda MetaColumn_Definitions+1, x
    sta TmpAddr+1

; Load the meta column that's pointed to in the TmpAddr
; into the meta column buffer (not the tile draw buffer).
@gc_LoadMetaColumn:
    ; load map_column_addr with the correct offset
    jsr gc_MetaColumnAddrFromOffset
    tax

    ldy #0

    ; Load the width of the column thing
    lda (TmpAddr), y
    sta meta_cols_to_buffer
    iny

    ; This is needed to not break meta_cols_to_buffer
    sta TmpY
    asl TmpY
    asl TmpY
    inc TmpY

    lda #4
    sta TmpX

@loop:  ; once for each meta tile in the column (ie, 4 times)
    ; TmpAddr is the metacolumn definition
    lda (TmpAddr), y
    sta meta_columns, x

    ; Is it the top of the garbage can?
    cmp #MetaTileTypes::GARBO00
    bne :+
    ; Trigger new fire meta sprite in N frames
    lda #24
    sta NewFireIn
:
    iny
    inx
    dec TmpX
    beq @checkWrap

@loopBottom:
    cpy TmpY
    bne @loop
    rts

@checkWrap:
    lda #4
    sta TmpX

    cpy TmpY
    bne @notDone
    rts
@notDone:

    jsr gc_MetaColumnAddrFromOffset
    cpx #$80
    bcc @loop

    ldx #0
    jmp @loop
; End of gc_LoadMetaColumn


; Buffer a meta column's tiles to be drawn during the
; next NMI.  This expands meta tiles to their individual
; tiles spanning two tile columns.
Buffer_Column:
    ; The number of columns that need to be drawn to screen.  most will be 1, some will be 2.
    dec meta_cols_to_buffer

    ; Set this to trigger Draw_Column during next NMI
    lda column_ready
    ora #COLUMN_READY
    sta column_ready

    ; Multiply by four.  Each column is four meta tiles.
    lda meta_last_buffer
    asl a
    asl a
    sta map_meta_tmp    ; meta tile offset in buffer
    tax

    ; Figure out the PPU address to start drawing the meta column
    lda meta_last_buffer
    cmp #16
    bcs @secondNT

    ; First nametable
    lda #$21
    sta tile_column_addr_high
    lda #$23
    sta attr_address+1

    lda meta_last_buffer
    lsr a   ; get offset for attribute column lookup
    tax     ; attr column lookup in X
    lda AttrAddrLowByte, x
    sta attr_address

    lda meta_last_buffer

    jmp @addrLow

@secondNT:
    ; Second nametable
    lda #$25
    sta tile_column_addr_high
    lda #$27
    sta attr_address+1

    lda meta_last_buffer
    ; Subtract 16 to get it back to the start of the nametable
    sec
    sbc #16

    tay     ; save for later
    lsr a   ; get offset for attribute column lookup
    tax     ; attr column lookup in X
    lda AttrAddrLowByte, x
    sta attr_address

    ;lda meta_last_buffer
    tya     ; restore from before

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
    cmp #MetaTileTypes::GARBO00
    bne :+
    ; spawn new fire
    pha
    lda #FIRE_SPAWN_DELAY
    sta NewFireIn
    pla
:
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
    bne :+  ; Check for overflow
    inc meta_tile_addr+1
:   lda (meta_tile_addr, x)
    sta tile_column_buffer+1, y

    inc meta_tile_addr
    bne :+
    inc meta_tile_addr+1
:   lda (meta_tile_addr, x)
    sta tile_column_buffer+8, y

    inc meta_tile_addr
    bne :+
    inc meta_tile_addr+1
:   lda (meta_tile_addr, x)
    sta tile_column_buffer+9, y

    ; ======== Attribute stuff
    ; Figure out where to write attribute column
    ; Y is vertical position of the last *tile* written (0 is top)
    tya     ; y is in range 0-7.  will always be even. it's the start of the
            ; first tile in the meta tile.
    lsr a   ; divide by two, range 0-3.  A is now the meta tile position.
    cmp #2
    bcs @bottomAttrByte
    ; upper byte

    lsr a   ; Odd or even?
    bcs @topBottomHalf
    ldx #0
    jmp :+

@topBottomHalf:
    ldx #1
:
    ; figure out if it's the left or right
    bit attr_odd
    bmi @attrOddTop
    ; even (left), top
    lda AttrMaskLeft, x  ; mask byte is loaded
    jmp @attrTopMask

@attrOddTop:
    ; odd (right), top
    lda AttrMaskRight, x  ; mask byte is loaded

; mask is loaded. OR it with the data
@attrTopMask:
    ldx #0
    ; Attribute data
    inc meta_tile_addr
    bne :+
    inc meta_tile_addr+1
:   and (meta_tile_addr, x)
    ; Attr data is in A, on the correct bits.

    ; Or it with the current buffer data
    ora attr_buffer
    sta attr_buffer

    jmp @nextMetaTile

@bottomAttrByte:
    ; lower byte
    lsr a   ; Odd or even?
    bcs @bottomBottomHalf
    ldx #0
    jmp :+

@bottomBottomHalf:
    ldx #1
:
    ; figure out if it's the left or right
    bit attr_odd
    bmi @attrOddBottom
    ; even (left), top
    lda AttrMaskLeft, x  ; mask byte is loaded
    jmp @attrBottomMask

@attrOddBottom:
    ; odd (right), top
    lda AttrMaskRight, x  ; mask byte is loaded

; mask is loaded. OR it with the data
@attrBottomMask:
    ldx #0
    ; Attribute data
    inc meta_tile_addr
    bne :+
    inc meta_tile_addr+1
:   and (meta_tile_addr, x)
    ; Attr data is in A, on the correct bits.

    ; Or it with the current buffer data
    ora attr_buffer+1
    sta attr_buffer+1

@nextMetaTile:
    inc map_meta_tmp
    iny
    iny
    cpy #8
    beq @tileNoLoop
    jmp @tileLoop
@tileNoLoop:

    ; find the current meta column
    inc meta_last_buffer    ; probably wrong

    ; Wrap this just like meta_last_gen
    lda meta_last_buffer
    cmp #$20    ; wrap value
    bne @noWrap

    lda #$00
    sta meta_last_buffer
@noWrap:

    ; Check for left/right of attribute bytes
    bit attr_odd
    bvc @attrEven
; Even
    lda #$00
    sta attr_odd
    ;inc attr_odd
    lda #$FF
    sta column_ready
    jmp @notEven

@attrEven:
    lda #$FF
    sta attr_odd
    ;dec attr_odd
@notEven:

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
    cpx #4*5    ; four sprites, for bytes each
    bne @loop
    rts

; Turn off "Paused" sprites
g_PausedSprites_Off:
    ldx #0
    lda #$00
@loop:
    sta sprites+33, x
    inx
    inx
    inx
    inx
    cpx #4*5
    bne @loop
    rts

; Draw the attribute buffer to the screen
Draw_Attribute:
    bit $2002
    ; Write address top byte
    lda attr_address+1
    sta $2006
    ldx attr_address
    stx $2006

    ; Write top byte
    lda attr_buffer
    sta $2007

    ; Write address of second byte
    lda attr_address+1
    sta $2006

    ; Add 8 first
    lda attr_address
    clc
    adc #8
    sta $2006

    ; Write lower byte
    lda attr_buffer+1
    sta $2007

    ; Clear the buffer so it's ready for the next write.
    lda #$00
    sta attr_buffer
    sta attr_buffer+1
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
bufferScroll:
    ;bit $2002
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
    sta ScrollBuffer
    ;sta $2005

    ; y is always 0
    ;lda #00
    ;sta $2005

    ; 2nd nametable?
    bit calc_scroll
    bmi @nt2

    lda #PPU_CTRL_VERT
    sta ScrollBuffer+1
    ;sta $2000
    jmp @done

@nt2:
    lda #PPU_CTRL_VERT
    ora #$01
    sta ScrollBuffer+1
    ;sta $2000

@done:
    rts

WriteScoreLabel:
    lda #$22
    sta $2006
    lda #$EA
    sta $2006

    ; label
    ldx #$39
    ldy #5  ;($55 - $50)
    jsr DrawSequential

    ; Singel padding space
    lda #$00
    sta $2007

    ; Initial value of 00,000,000
    lda #$F0
    sta $2007
    sta $2007

    lda #$2D
    sta $2007

    lda #$F0
    sta $2007
    sta $2007
    sta $2007

    lda #$2D
    sta $2007

    lda #$F0
    sta $2007
    sta $2007
    sta $2007
    rts

WriteSeedLabel:
    lda #$23
    sta $2006
    lda #$2A
    sta $2006

    ldx #$44
    ldy #8  ;($68 - $60)
    jsr DrawSequential

    ; "Initial" value
    lda #$00
    sta $2007
    sta $2007
    sta $2007
    sta $2007

    ; Load the RNG seed form PRG RAM and re-seed if it doesn't exist.
    ; Check both bytes of the RNG seed.
    lda rng_seed
    bne @skip_rng_init
    lda rng_seed+1
    bne @skip_rng_init

    lda #'Z'  ; $5A
    sta rng_seed
    lda #'o'  ; $6F
    sta rng_seed+1

@skip_rng_init:

    lda rng_seed
    sta working_seed
    lda rng_seed+1
    sta working_seed+1

    ; Load the seed and convert it to HEX ASCII to draw to screen.
    lda working_seed
    and #$F0
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$F0
    sta $2007

    lda working_seed
    and #$0F
    ora #$F0
    sta $2007

    lda working_seed+1
    and #$F0
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$F0
    sta $2007

    lda working_seed+1
    and #$0F
    ora #$F0
    sta $2007
    rts

; Load a frame.  The index is expected in PlayreSpriteFrame
UpdatePlayerAnimation:
    ; Load the index, and shift it to index a word
    ; table
    lda PlayerSpriteFrame
    asl a
    tax

    ; Load the frame's address
    lda PlayerSprite_Frames, X
    sta TmpAddr
    lda PlayerSprite_Frames+1, X
    sta TmpAddr+1

UpdatePlayerAnimationFrame:
    ldy #0
    ldx #1
@loop:
    lda (TmpAddr), y
    sta sprites, x

    inx
    inx
    inx
    inx

    iny
    cpy #8
    bne @loop
    rts

; This will read FireAnimX and FireAnimFrames and update
; the sprite ram as needed.
UpdateFire:
    ; Clear fire sprites from ram
    ldx #0
    lda #0
@clearLoop:
.repeat 4
    sta FireSpriteY, x
    inx
.endrepeat
    cpx #96
    bne @clearLoop

    ; Don't change anything if paused
    bit game_paused
    bvc :+
    jmp @animCheck
:

    ; Move all sprites over and remove
    ; sprites that scroll off screen
    ldx #0  ; number of sprites
    cpx FireAnimCount
    lda FireAnimCount
    sta TmpX
    beq @exitMove
    ldy FireAnimIdx ; index of sprite
@updateLoop:
    cpy #8
    bne :+
    ldy #0
:
    lda FireAnimX, y
    sec
    sbc #2
    bcc @removeSprite
    sta FireAnimX, y

@nextSprite:
    iny
    inx
    cpx TmpX    ; Original FireAnimCount
    bcs @exitMove
    jmp @updateLoop

@removeSprite:
    lda #$FF
    sta FireAnimFrame, y    ; Removes from screen

    inc FireAnimIdx
    dec FireAnimCount
    lda FireAnimIdx
    cmp #8
    bne @nextSprite
    lda #0
    sta FireAnimIdx
    jmp @nextSprite

@exitMove:

    bit NewFireIn
    bvs @noNewFire

    ; New fire is waiting.  Is it time yet?
    dec NewFireIn
    bpl @noNewFire
    ; Light new fire

    ; Where do we need to put it?
    lda FireAnimIdx
    clc
    adc FireAnimCount

    ; Check for wrap
    cmp #8
    bne :+
    sec
    sbc #8
:
    tax
    lda #$FE
    sta FireAnimX, x
    lda #0
    sta FireAnimFrame, x
    inc FireAnimCount

@noNewFire:
    lda FireAnimCount
    bne :+
    rts
:

@animCheck:
    dec FireAnimNext
    beq :+
    jmp @noAnimation
:
    lda #FIRE_ANIM_SPEED
    sta FireAnimNext

    ldx #0
@Animate:
    lda FireAnimFrame, x
    bmi @nextAnimate  ; $FF isn't animated
    ; it's animated
    beq :+
    lda #0
    sta FireAnimFrame, x
    jmp @nextAnimate
:
    lda #1
    sta FireAnimFrame, x
@nextAnimate:
    inx
    cpx #8
    bne @Animate

@noAnimation:
    ; Load new fire sprites into ram
    lda #<FireSpriteY
    sta TmpAddr
    lda #>FireSpriteY
    sta TmpAddr+1

    ldx #0  ; metasprite ID
@OuterLoop:
    lda FireAnimFrame, x
    bmi @SkipSprite ; $FF sprite doesn't exist
    beq @SkipSprite ; $00 sprite exists, but isn't drawn

    lda FireAnimX, x
    sta TmpZ    ; X offset

    bit game_paused
    bvc :+
    inc TmpZ
    inc TmpZ
:

    ; 1st Sprite
    ldy #0
    lda #FireSprite_BaseY
    sta (TmpAddr), y

    lda #FireSprite_BaseId
    inc TmpAddr
    sta (TmpAddr), y

    lda #FireSprite_Attribute
    inc TmpAddr
    sta (TmpAddr), y

    lda TmpZ
    inc TmpAddr
    sta (TmpAddr), y

    ; 2nd column
    lda TmpZ
    clc
    adc #8
    ; Don't draw sprites off screen
    bcs @NoCol2
    sta TmpZ

    ; 2nd Sprite
    lda #FireSprite_BaseY
    inc TmpAddr
    sta (TmpAddr), y

    lda #FireSprite_BaseId+1
    inc TmpAddr
    sta (TmpAddr), y

    lda #FireSprite_Attribute
    inc TmpAddr
    sta (TmpAddr), y

    lda TmpZ
    inc TmpAddr
    sta (TmpAddr), y

    ; 3rd sprite
    lda #FireSprite_BaseY+8
    inc TmpAddr
    sta (TmpAddr), y

    lda #FireSprite_BaseId+2
    inc TmpAddr
    sta (TmpAddr), y

    lda #FireSprite_Attribute
    inc TmpAddr
    sta (TmpAddr), y

    lda TmpZ
    inc TmpAddr
    sta (TmpAddr), y

@NoCol2:
    inc TmpAddr

@SkipSprite:
    inx
    cpx #8
    beq :+
    jmp @OuterLoop
:
    rts

WaitSpriteZero:
    jsr bufferScroll

    ; wait for vblank to end
:   bit $2002
    bvs :-

    bit game_paused
    bpl :+
    jsr WriteSkylineScroll
:

; wait for sprite zero hit
@loop_sprite2:
    bit $2002
    bvc @loop_sprite2

    ; update scroll for status bar (only X matters here)
    ;lda #00
    ;sta $2005
    ;; first nametable
    ;lda #PPU_CTRL_TITLE
    ;sta $2000
    jsr WritePlayfieldScroll

    ldx #0
:
    .repeat 15
    nop
    .endrepeat
    dex
    bne :-

    bit $2000
    lda #00
    sta $2005
    ; first nametable
    lda #PPU_CTRL_TITLE
    sta $2000

    jmp WaitFrame

BufferSkylineScroll:
    bit game_paused
    bne @noWrap

    dec SScrollNext
    bne @noWrap

    lda #SKYLINE_SCROLL_SPEED
    sta SScrollNext

    inc SkyScroll
    bne @noWrap
    lda SkyScroll+1
    bne :+
    lda #1
    sta SkyScroll+1
    jmp @noWrap
:
    lda #0
    sta SkyScroll+1
@noWrap:
    rts

WriteSkylineScroll:
    bit $2000
    ; X
    lda SkyScroll
    sta $2005
    ; Y
    lda #0
    sta $2005

    ; Nametable
    lda #PPU_CTRL_VERT
    ora SkyScroll+1
    sta $2000
    rts

WritePlayfieldScroll:
    bit $2000
    lda ScrollBuffer
    sta $2005
    lda #0
    sta $2005
    lda ScrollBuffer+1
    sta $2000
    rts

FireSprite_Tiles:
    ; Three tile ID, then the attribute value
    .byte $27, $28, $29

FireSprite_BaseId = $27
; Base value for Y.  Third sprite will add 8 to this.
FireSprite_BaseY = $5F
; Attribute value for all fire sprites
FireSprite_Attribute = $01

ScoreText:
    .byte "Score ", $00
SeedText:
    .byte "Level Seed  ", $00

GamePalette:
    ; BG
        .byte $0F,$00,$00,$00
PalBG1: .byte $0F,$07,$17,$09
PalBG2: .byte $0F,$27,$10,$06
PalBG3: .byte $0F,$30,$10,$07

    ; Sprites
PalSP0: .byte $0F,$30,$0F,$27
;PalSP1: .byte $0F,$30,$0F,$06
PalSP1: .byte $0F,$27,$0F,$06
        .byte $0F,$20,$2D,$39
        .byte $0F,$1C,$2B,$39

; Meta tile IDs -> meta tile tile addresses
MetaTiles:
    .word Meta_Sky
    .word Meta_Ground
    .word Meta_Ground2
    .word Meta_Pit_Left
    .word Meta_Pit_Right
    .word Meta_Pit_Left_Bottom
    .word Meta_Pit_Right_Bottom
    .word Meta_Nothing
    .word Meta_Obstacle
    .word Meta_Pit
    .word Meta_FireHydrant

    .word Meta_Truck00
    .word Meta_Truck01
    .word Meta_Truck02
    .word Meta_Truck03

    .word Meta_Garbo00
    .word Meta_Garbo01

; used for RNG
; This list is 16 entries long. Use both nibbles of low byte
; of RNG for index.
MetaColumn_Definitions:
    .word MetaColumn_Nothin
    .word MetaColumn_Wall
    .word MetaColumn_HalfWall
    .word MetaColumn_DoubleWall
    .word MetaColumn_PitWall
    .word MetaColumn_HalfWall
    .word MetaColumn_Pit
    .word MetaColumn_Nothin

    .word MetaColumn_Nothin
    .word MetaColumn_Wall
    .word MetaColumn_WallPitWide
    .word MetaColumn_HalfWall
    .word MetaColumn_PitWallWide
    .word MetaColumn_DoubleWall
    .word MetaColumn_Pit
    .word MetaColumn_Nothin

; Meta tile indicies.  First byte is number of columns.
MetaColumn_Nothin:
    .byte $01
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
MetaColumn_Wall:
    .byte $01
    .byte MetaTileTypes::GARBO00, MetaTileTypes::GARBO01, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
MetaColumn_DoubleWall:
    .byte $02
    .byte MetaTileTypes::TRUCK00, MetaTileTypes::TRUCK01, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
    .byte MetaTileTypes::TRUCK02, MetaTileTypes::TRUCK03, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
MetaColumn_Pit:
    .byte $03
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::PIT_LEFT, MetaTileTypes::PIT_LEFT_BOTTOM
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::NOTHIN, MetaTileTypes::PIT
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::PIT_RIGHT, MetaTileTypes::PIT_RIGHT_BOTTOM
MetaColumn_PitWall:
    .byte $03
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::PIT_LEFT, MetaTileTypes::PIT_LEFT_BOTTOM
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::NOTHIN, MetaTileTypes::PIT
    .byte MetaTileTypes::GARBO00, MetaTileTypes::GARBO01, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
MetaColumn_WallPitWide:
    .byte $04
    .byte MetaTileTypes::GARBO00, MetaTileTypes::GARBO01, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::NOTHIN, MetaTileTypes::PIT
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::NOTHIN, MetaTileTypes::PIT
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::PIT_RIGHT, MetaTileTypes::PIT_RIGHT_BOTTOM
MetaColumn_PitWallWide:
    .byte $05
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::PIT_LEFT, MetaTileTypes::PIT_LEFT_BOTTOM
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::NOTHIN, MetaTileTypes::PIT
    .byte MetaTileTypes::GARBO00, MetaTileTypes::GARBO01, MetaTileTypes::GROUND, MetaTileTypes::GROUND2
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::NOTHIN, MetaTileTypes::PIT
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::BACKGROUND, MetaTileTypes::PIT_RIGHT, MetaTileTypes::PIT_RIGHT_BOTTOM
MetaColumn_HalfWall:
    .byte $01
    .byte MetaTileTypes::BACKGROUND, MetaTileTypes::FIREHYDRANT, MetaTileTypes::GROUND, MetaTileTypes::GROUND2

; Tile indicies
Meta_Sky:
    .byte $2C, $2C, $2C, $2C, $00
Meta_Ground:
    .byte $39, $49, $3A, $4A, $55
Meta_Ground2:
    .byte $3B, $4B, $3C, $4C, $55

Meta_Obstacle:
    .byte $82, $92, $83, $93, $00

Meta_Pit:
    .byte $37, $47, $38, $48, $FF
Meta_Pit_Left:
    .byte $50, $60, $10, $20, $FF
Meta_Pit_Right:
    .byte $30, $40, $51, $61, $FF
Meta_Pit_Left_Bottom:
    .byte $52, $62, $38, $48, $FF
Meta_Pit_Right_Bottom:
    .byte $37, $47, $53, $63, $FF

Meta_Nothing:
    .byte $00, $00, $00, $00, $00
Meta_FireHydrant:
    .byte $35, $45, $36, $46, $AA

Meta_Truck00:
    .byte $54, $64, $55, $65, $FF
Meta_Truck01:
    .byte $02, $58, $5C, $59, $FF
Meta_Truck02:
    .byte $56, $66, $57, $5F, $FF
Meta_Truck03:
    .byte $5D, $5A, $5E, $5B, $FF

Meta_Garbo00:
    .byte $1E, $2E, $1F, $2F, $AA
Meta_Garbo01:
    .byte $3E, $4E, $3F, $4F, $AA

PAUSED_X    = 112
PAUSED_Y    = 25
PAUSED_ATTR = $02
PAUSED_PAL  = PaletteRAM+6
PausedSprites:
    .byte $09, $0A, $0B, $0C, $0D

PausedPalTable:
    .byte $00,$10,$20,$10

; peak is at $3F
JumpFrameLength:
    .byte JumpFrameEnd - JumpFrames - 1

JumpFrames:
    .byte $77, $71, $6c, $67, $63, $5f, $5b, $57, $54, $51, $4e, $4b
    .byte $49, $47, $45, $44, $43, $42, $41, $41, $41, $41, $41, $41
JumpFrameEnd:

FallFrames:
    .byte $7D ; and go down from here
FallFrameEnd:

; For a single attribute byte
AttrMaskLeft:
    .byte $03, $30
AttrMaskRight:
    .byte $0C, $C0

AttrAddrLowByte:
    .byte $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF

PlayerSprite_FrameCount = (PlayerSprite_Frame0 - PlayerSprite_Frames) / 2
PlayerSprite_AnimSpeed = 7

PlayerSprite_Frames:
    .word PlayerSprite_Frame0
    .word PlayerSprite_Frame1
    .word PlayerSprite_Frame2
    .word PlayerSprite_Frame1

PlayerSprite_Frame0:
    .byte $40, $50, $60, $70
    .byte $41, $51, $61, $71

PlayerSprite_Frame1:
    .byte $42, $52, $62, $72
    .byte $43, $53, $63, $73

PlayerSprite_Frame2:
    .byte $40, $54, $64, $70
    .byte $41, $55, $65, $71

; The jump falling frame
PlayerSprite_Frame3:
    .byte $66, $76, $68, $78
    .byte $67, $77, $69, $79

    nop ; to separate the data label from DedInit
