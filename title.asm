TITLE_SPTOP     = $48

InitTitle:
    ; set the draw orientation
    lda #PPU_CTRL_TITLE
    sta $2000

    lda #PPU_MASK_OFF
    sta $2001
    inc SkipNMI

    lda #$3F
    sta $2006
    lda #$00
    sta $2006
    lda #$0F
    sta $2007

    lda #$21
    sta $2006
    lda #$80
    sta $2006

    lda #$20
    ldx #18
:
.repeat 32
    sta $2007
.endrepeat
    dex
    bne :-

; Load the title palette's ROM addr
    lda #<TitlePalette
    sta PaletteAddr
    lda #>TitlePalette
    sta PaletteAddr+1

    ; Then load ROM -> RAM
    jsr LoadPalettes
    ;jsr WritePalettes

    lda #0
    sta TitleIndex

    jsr ClearSprites
    jsr ClearAttrTable0
    jsr ClearAttrTable2

; Draw the visible Skyline
    lda #BackgroundThemes::City
    sta BGTheme

    lda #$28
    sta BGNametable

    lda #$00
    sta BGYStart
    jsr DrawBackground

; Draw the offscreen skyline
    lda #$20
    sta BGNametable

    lda #$00
    sta BGYStart
    jsr DrawBackground

; Attributes for skyline
    lda #$2B
    sta $2006
    lda #$C0
    sta $2006

    lda #$55
.repeat 24
    sta $2007
.endrepeat

    ldx #$23
    stx $2006
    ldx #$C0
    stx $2006

.repeat 24
    sta $2007
.endrepeat

; Init the cursor sprite
    ; Y coord
    lda #TITLE_SPTOP
    sta SP_TITLEY0
    sta SP_TITLEY1

    ; X coord
    lda #$4E
    sta SP_TITLEX0
    lda #$56
    sta SP_TITLEX1

    ; no attributes
    lda #$00
    sta SP_TITLEATTR0
    sta SP_TITLEATTR1

    ; '->'
    lda #$01        ; '-'
    sta SP_TITLETILE0
    lda #$02        ; '>'
    sta SP_TITLETILE1

    ; Sprite Zero
    lda #$88
    sta SPZ_Y
    lda #$F8
    sta SPZ_X
    lda #3
    sta SPZ_IDX
    lda #3
    sta SPZ_ATT

; RAINBOW start
    lda #$11
    sta TitleColor

    lda #$1C
    sta TitleColor2
; /RAINBOW

    ; Draw Title
    lda #$22
    sta $2006
    lda #$4A
    sta $2006

    ldx #0
@loop2:
    lda TitleText, x
    beq @titleTextDone
    sta $2007
    inx
    jmp @loop2
@titleTextDone:

    lda #$22
    sta TmpAddr
    lda #$AD
    sta TmpAddr+1

    ; Draw menu items
    ldx #0
    ldy #0
@menuLoopTop:
    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006

    ; next letter
@menuLoopText:
    lda TitleData, x
    beq @textDone

    sta $2007
    inx
    jmp @menuLoopText

@textDone:
    ; Load gamestate into array in RAM
    inx
    lda TitleData, x
    sta TitleGameStates, y
    iny

    ; peek next byte for NUL byte
    inx
    lda TitleData, x
    beq @menuDone

    ; go to the next line of text on screen
    lda TmpAddr+1
    clc
    adc #64
    sta TmpAddr+1

    lda TmpAddr
    adc #0
    sta TmpAddr
    jmp @menuLoopTop

@menuDone:
    tya
    sta TitleLength

    ; Tile for sprite zero hit
    lda #$23
    sta $2006
    lda #$BF
    sta $2006
    ;lda #$0F
    lda #$20
    sta $2007

    lda #<Frame_Title
    sta DoFramePointer
    lda #>Frame_Title
    sta DoFramePointer+1

    lda #<NMI_Title
    sta DoNMIPointer
    lda #>NMI_Title
    sta DoNMIPointer+1

    ; reset scroll
    bit $2002
    lda #$00
    sta $2005
    lda #95
    sta $2005
    rts

NMI_Title:

    jsr WritePalettes
    jsr WriteSprites

    ; Scroll half way down the screen
    bit $2002
    lda #0
    sta $2005
    lda #95
    sta $2005

    lda #PPU_CTRL_TITLE
    sta $2000

    jmp NMI_Finished

title_Colors:
    ; only update colors every other frame
    lda frame_odd
    beq @t_nocolorwrap

    inc TitleColor
    dec TitleColor2
    lda TitleColor
    cmp #$1D
    bne @t_nocolorwrap
    lda #$11
    sta TitleColor
    lda #$1C
    sta TitleColor2

@t_nocolorwrap:

    ; load palette into ram
    lda TitleColor
    sta PaletteRAM+30

    ;lda #$0F
    ;sta PaletteRAM+31

    lda TitleColor2
    sta PaletteRAM+14

    lda frame_odd
    bne @tf_setev

    lda #1
    sta frame_odd
    jmp @tf_wot
@tf_setev:
    lda #0
    sta frame_odd

@tf_wot:
    rts

; Move selection up
t_sel_up:
    dec TitleIndex
    bpl :+

    ; Wrap around to end
    lda TitleLength
    sec
    sbc #1
    sta TitleIndex

:   rts

; Move selection down
t_sel_down:
    inc TitleIndex
    lda TitleIndex
    cmp TitleLength
    bcc :+

    ; wrap the index around to zero
    lda #0
    sta TitleIndex

:   rts

t_sel_go:
    ldx TitleIndex
    lda TitleGameStates, x
    sta current_gamestate
    cmp #STATES::GS_GAME
    beq Title_GameTrans
    inc gamestate_changed
    rts

; This is the default frame
Frame_Title:
    jsr title_Colors

    lda #BUTTON_START
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_go
    jmp @button_done

:   lda #BUTTON_A
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_go
    jmp @button_done

:   lda #BUTTON_UP
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_up
    jmp @button_done

:   lda #BUTTON_DOWN
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_down
    jmp @button_done

:   lda #BUTTON_SELECT
    jsr ButtonPressedP1
    beq :+
    jsr t_sel_down

:
@button_done:
    ; calculate Y for cursor
    lda TitleIndex
    asl a
    asl a
    asl a
    asl a
    clc
    adc #TITLE_SPTOP
    sta SP_TITLEY0
    sta SP_TITLEY1

t_nostart:
    bit $2002
    bvs t_nostart

:   bit $2002
    bvc :-

    lda #PPU_CTRL_HORIZ
    sta $2000
    jmp WaitFrame

; Start of the transition, not a frame handler.
Title_GameTrans:
    lda #$00
    sta TmpX

    lda #95
    sta TitleScroll

    lda #<Title_Trans_Frame_Fading
    sta DoFramePointer
    lda #>Title_Trans_Frame_Fading
    sta DoFramePointer+1

    lda #<Title_Trans_NMI
    sta DoNMIPointer
    lda #>Title_Trans_NMI
    sta DoNMIPointer+1

    lda #PPU_CTRL_TITLE
    sta TitlePPUCtrl

; Fade frame handler.
Title_Trans_Frame_Fading:
    lda TitleColor
    cmp #$1C
    beq :+
    jsr title_Colors
    jmp t_nostart
:
    lda frame_odd
    beq :+
    ;lda #$0C
    ;sta PaletteRAM+30
    ;lda #$01
    ;sta PaletteRAM+14
    dec title_clear

    jsr ClearSprites

    lda #<Title_Trans_Frame_Scrolling
    sta DoFramePointer
    lda #>Title_Trans_Frame_Scrolling
    sta DoFramePointer+1

    lda #PPU_CTRL_HORIZ
    ora #$02
    sta TitlePPUCtrl

    lda ttrans_draw_lookup
    sta TmpAddr2
    lda ttrans_draw_lookup+1
    sta TmpAddr2+1

    lda #$FF
    sta TmpX

:   lda #$FF
    sta frame_odd
    jmp t_nostart
    ;jmp WaitFrame

ttrans_draw_00:
    lda #$21
    sta TmpAddr
    lda #$C0
    sta TmpAddr+1

    lda #<Meta_Sky
    sta meta_tile_addr
    lda #>Meta_Sky
    sta meta_tile_addr+1

    lda #<ttrans_draw_01
    sta TmpAddr2
    lda #>ttrans_draw_01
    sta TmpAddr2+1
    jmp ttrans_draw_done

ttrans_draw_01:
    lda #$22
    sta TmpAddr
    lda #$00
    sta TmpAddr+1

    lda #<Meta_Ground
    sta meta_tile_addr
    lda #>Meta_Ground
    sta meta_tile_addr+1

    lda #<ttrans_draw_02
    sta TmpAddr2
    lda #>ttrans_draw_02
    sta TmpAddr2+1
    jmp ttrans_draw_done

ttrans_draw_02:
    lda #$22
    sta TmpAddr
    lda #$40
    sta TmpAddr+1

    lda #<Meta_Ground
    sta meta_tile_addr
    lda #>Meta_Ground
    sta meta_tile_addr+1

    lda #<ttrans_draw_03
    sta TmpAddr2
    lda #>ttrans_draw_03
    sta TmpAddr2+1
    jmp ttrans_draw_done

ttrans_draw_03:
    lda #$00
    sta TmpX
    jmp ttrans_draw_done

ttrans_draw_lookup: ; pointing to routines that load a metatile to draw
    .word ttrans_draw_00
    .word ttrans_draw_01
    .word ttrans_draw_02
    .word ttrans_draw_03

; Scroll down to playfield
Title_Trans_Frame_Scrolling:
    lda #$1F
    sta PaletteRAM+30
    sta PaletteRAM+14

    lda #$00
    sta SP_TITLETILE0
    sta SP_TITLETILE1

    inc TitleScroll
    dec SPZ_Y
    lda SPZ_Y

    jmp (TmpAddr2)

ttrans_draw_done:

    lda TitleScroll
    cmp #$EF
    bne :+

    ; Next segment
    lda #<Title_Trans_Frame_Load
    sta DoFramePointer
    lda #>Title_Trans_Frame_Load
    sta DoFramePointer+1

    lda #0
    sta TitleScroll
    lda #PPU_CTRL_HORIZ
    ora #$02
    sta TitlePPUCtrl

    lda #$E0
    sta SPZ_Y

:   jmp WaitFrame

Title_Trans_Frame_Load:
    inc gamestate_changed
    jmp WaitFrame

ttrans_clear_title_loop:
    stx $2006
    sty $2006
    tax
    lda #$20
:   sta $2007
    dex
    bne :-
    rts

ttrans_write_meta_row:
    ldy #0
    lda (meta_tile_addr), y
    tax
    iny
    iny
    lda (meta_tile_addr), y
    ldy #8
:   stx $2007
    sta $2007

    stx $2007
    sta $2007
    dey
    bne :-

    ldy #1
    lda (meta_tile_addr), y
    tax
    iny
    iny
    lda (meta_tile_addr), y
    ldy #8
:   stx $2007
    sta $2007

    stx $2007
    sta $2007
    dey
    bne :-
    rts

Title_Trans_NMI:
    bit title_clear
    bvc @noclear

    lda #0
    sta title_clear

    jsr WritePalettes
    jsr WriteSprites

    ; Erase Title
    ldx #$22
    ldy #$4A

    lda #TitleSeedText - TitleText - 1
    jsr ttrans_clear_title_loop

    ; Erase items
    ldx #$22
    ldy #$AD
    lda #10
    jsr ttrans_clear_title_loop

    ldx #$22
    ldy #$ED
    lda #10
    jsr ttrans_clear_title_loop

    ldx #$23
    ldy #$2D
    lda #11
    jsr ttrans_clear_title_loop

    ldx #$23
    ldy #$6D
    lda #7
    jsr ttrans_clear_title_loop

    lda #<Meta_Sky
    sta meta_tile_addr
    lda #>Meta_Sky
    sta meta_tile_addr+1

    lda #$21
    sta $2006
    lda #$80
    sta $2006
    jsr ttrans_write_meta_row

    lda #$23
    sta $2006
    lda #$E0
    sta $2006

    lda #$55
    sta $2007
    sta $2007
    sta $2007
    sta $2007
    sta $2007
    sta $2007
    sta $2007
    sta $2007
    jmp @done

@noclear:
    ; load up a meta tile
    ; draw one row
    lda TmpX
    beq @done

    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006
    jsr ttrans_write_meta_row

@done:
    bit $2002
    lda #0
    sta $2005
    lda TitleScroll
    sta $2005

    lda TitlePPUCtrl
    sta $2000
    jmp NMI_Finished

TitleText:
    .byte '"', "runner", '"', $00

TitleSeedText:
    .byte "Current seed: ", $00

TitleData:
    .byte "Start Game", $00, STATES::GS_GAME
    .byte "Enter Seed", $00, STATES::GS_SEED
    .byte "High Scores", $00, STATES::GS_HIGHSCORE
    .byte "Credits", $00, STATES::GS_CREDITS
    .byte $00

Title_BG1:
    .byte $D0, $D4, $D0, $D4, $D0, $D4
Title_BG2:
    .byte $DF, $D1, $D5, $D1, $D5, $D1, $D5
Title_BG3:
    .byte $D7, $D6, $DA, $D6, $DA, $D6, $DA, $D6, $DA
Title_BG4:
    .byte $DD, $DB, $D8, $D9, $D8, $D9, $D8, $D9, $03

Title_BG5:
    .byte $D2, $D0, $D4, $D0, $D4, $D0, $D4, $D0, $D4
Title_BG6:
    .byte $D3, $D1, $D5, $D1, $D5, $D1, $D5, $D1, $D5

TitlePalette:
    .byte $1A,$30,$21,$15, $1A,$04,$34,$0F, $1A,$0A,$39,$06, $1A,$17,$25,$35
    .byte $1A,$10,$00,$30, $1A,$05,$05,$05, $1A,$0A,$0A,$0A, $1A,$0F,$11,$11
    .byte $EA, $EA
