; asmsyntax=ca65

;;;;;;;;;;;;;;;;;;;
;; Transition stuff
;;;;;;;;;;;;;;;;;;;

; Start of the transition, ends in a frame handler.
Title_GameTrans:
    lda #95
    sta TitleScroll

    lda #0
    sta framesub_index

    lda #$FF
    sta framesub_next

    lda #16
    sta TmpX
    sta meta_last_buffer

    lda #15
    sta meta_last_gen

    jsr LoadFrameSubPointer

    lda #PPU_CTRL_HORIZ
    sta TitlePPUCtrl

    jmp (DoFramePointer)

Title_Trans_NMI_End:
    bit $2002
    lda #0
    sta $2005
    lda TitleScroll
    sta $2005

    lda TitlePPUCtrl
    sta $2000

    jsr LoadFrameSubPointer
    jmp NMI_Finished

; Frame 00
; Clear sprites and set scroll to the second
; nametable.  Scrolling starts there and wraps
; around to the first nametable.
ttrans_frame_clear_00:
    jsr ClearSprites

    ; Select the third nametable (02)
    ; This is written during NMI
    lda TitlePPUCtrl
    ora #$02
    sta TitlePPUCtrl

    dec framesub_next
    jmp WaitFrame

; NMI 00
; Write sprites and palettes
ttrans_nmi_clear_00:
    jsr WriteSprites
    jsr WritePalettes
    jmp Title_Trans_NMI_End

; Frame 01
; Load BG palette IDs 1 and 2
; Load sprite palette ID 0
; Load start address for first meta tile row
ttrans_frame_scrolling:
    lda #<PalBG1
    sta TmpAddr
    lda #>PalBG1
    sta TmpAddr+1
    jsr LoadPaletteBG1

    lda #<PalBG2
    sta TmpAddr
    lda #>PalBG2
    sta TmpAddr+1
    jsr LoadPaletteBG2

    lda #<PalSP0
    sta TmpAddr
    lda #>PalSP0
    sta TmpAddr+1
    jsr LoadPaletteSP0

    lda #<PalSP1
    sta TmpAddr
    lda #>PalSP1
    sta TmpAddr+1
    jsr LoadPaletteSP1

    ; Load start address for first meta tile row.
    ; Used in ttrans_write_meta_row
    lda #$21
    sta TmpAddr
    lda #$80
    sta TmpAddr+1

    ; Tile to write with ttrans_write_meta_row
    lda #<Meta_Sky
    sta meta_tile_addr
    lda #>Meta_Sky
    sta meta_tile_addr+1

    dec framesub_next
    jmp ttrans_frame_done

; NMI 01
; Draw two meta tile rows, as well as the attributes for
; the first nametable.
ttrans_nmi_meta_attr:
    jsr ttrans_write_meta_row

    ; Get PPU address for second meta tile row
    lda TmpAddr+1
    clc
    adc #$40        ; add 64 for next PPU address
    sta TmpAddr+1
    bcc :+          ; check for overflow
    inc TmpAddr+0
:
    jsr ttrans_write_meta_row
    jsr WritePalettes

    ; Draw attribute data for the playfield
    lda #$23
    sta $2006
    lda #$D8
    sta $2006

    ; Above ground
    lda Meta_Sky+4
.repeat 8
    sta $2007
.endrepeat

    ; Ground
    lda Meta_Ground+4
.repeat 8
    sta $2007
.endrepeat

    ; Status bar
    lda #$AA
.repeat 16
    sta $2007
.endrepeat

    jmp Title_Trans_NMI_End

; Frame 02
; Prepare the ground meta tile for drawing
ttrans_frame_00b:
    ; Third meta tile row
    lda #$22
    sta TmpAddr
    lda #$00
    sta TmpAddr+1

    lda #<Meta_Ground
    sta meta_tile_addr
    lda #>Meta_Ground
    sta meta_tile_addr+1

    dec framesub_next
    jmp ttrans_frame_done

; NMI 02
; Draw the ground meta row
ttrans_nmi_draw_meta_row_ground:
    jsr ttrans_write_meta_row

    ; Get PPU address for fourth meta tile row
    lda TmpAddr+1
    clc
    adc #$40
    sta TmpAddr+1
    bcc :+
    inc TmpAddr+0
:
    lda #<Meta_Ground2
    sta meta_tile_addr
    lda #>Meta_Ground2
    sta meta_tile_addr+1
    jsr ttrans_write_meta_row

    jmp Title_Trans_NMI_End

; Frame 03
; Just wait.  This frame is all drawing, no prep.
ttrans_frame_statusbar:
    dec framesub_next
    jmp ttrans_frame_done

; NMI 03
; Draw the status bar stuff
ttrans_nmi_draw_statusbar:
    jsr game_ClearStatusBar
    jmp Title_Trans_NMI_End

; Frame 04
; Start redrawing the skyline on the third nametable.
; The third nametable will become the second one when
; the mirroring mode is changed to vertical.
ttrans_frame_nt2:
    lda #BackgroundThemes::City
    sta BGTheme

    ; Draw to the third nametable ($2800), not the second.
    lda #$28
    sta BGNametable
    lda #$00
    sta BGYStart

    ; Setup some internal values for drawing two tile
    ; columns of the skyline
    lda #0
    sta bg_current_column
    lda #16
    sta TmpY
    lda #2  ; tile column index to stop before
    sta bg_drawcolumn_cmp

    dec framesub_next
    jmp ttrans_frame_done

; NMI 04, 05
; Draw a few columns, defined from the frame code earlier.
ttrans_nmi_draw_nt2:
    jsr bg_drawOneScreen
    jmp Title_Trans_NMI_End

; Frame 05
; Check if the skyline is finished drawing.
; Advance the animation step if so.
ttrans_frame_skylinecheck:
    inc bg_drawcolumn_cmp
    inc bg_drawcolumn_cmp

    lda bg_drawcolumn_cmp
    cmp #32
    bne :+
    dec framesub_next
:   jmp ttrans_frame_done

; Frame 06 (uses same NMI as 05)
; Wait until the screen is scrolled far enough to
; start drawing the second (currently third) nametable's
; playfield meta columns.
ttrans_frame_waitforcolumndraw:
    dec TmpX
    bne :+
    dec framesub_next

    ; Set number of columns to generate
    lda #2
    sta TmpZ
    sta obs_countdown   ; init the obstacle countdown

:   jmp ttrans_frame_done

; Frame 07
; Generate and buffer a playfield meta column
ttrans_frame_columnbuffer:
    jsr generate_column
    jsr Buffer_Column

    dec TmpZ    ; number of columns to generate
    bne :+
    dec framesub_next

    ; Correct the address for the attribute write. The
    ; second nametable is on the bottom during the transition.
    lda #$2B
    sta attr_address+1
    lda #$D8
    sta attr_address

:
    jmp ttrans_frame_done

; NMI 07
; Write the playfield meta column buffer to the PPU
ttrans_nmi_drawbuffer:
    lda #$29    ; Correct the nametable address for the third nametable.
    sta tile_column_addr_high
    jsr Draw_Column
    lda #$25    ; Set it back to not break things.
    sta tile_column_addr_high

    ; Piggyback off of this variable to deterimne the
    ; second write.  Draw the attributes after the second
    ; meta column is drawn.
    bit framesub_next
    bvc :+

    lda #$AA
    sta attr_buffer
    ; The lower byte isn't always correct.  Make it correct.
    lda #$55
    sta attr_buffer+1

    jsr Draw_Attribute

:   jmp Title_Trans_NMI_End

; Frame 08 (plus all the others)
; Increment the scroll value, and check to see if we have
; finished scrollilng to the playfield yet.  If so, trigger
; loading the game.
ttrans_frame_done:
    inc TitleScroll
    inc TitleScroll

    lda TitleScroll
    cmp #$EF
    bcc :+

    dec framesub_next

    lda #0
    sta TitleScroll
    lda #PPU_CTRL_HORIZ
    ;ora #$02
    sta TitlePPUCtrl

    lda #$E0
    sta SPZ_Y

:   jmp WaitFrame

; Frame 09 (the last one)
; Initialize some variables and trigger a gamestate switch.
ttrans_frame_load:

    ; These two values cannot be the same
    lda #18
    sta meta_last_buffer
    lda #17
    sta meta_last_gen

    lda #0
    sta column_ready

    inc gamestate_changed
    jmp WaitFrame

; Write a row of meta tiles (64 tiles long, two tile rows)
; Start address is in TmpAddr
ttrans_write_meta_row:
    ; Write address for first tile row
    bit $2002
    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006

    ; Write first tile row, alternating between tiles 00 and 01
    ; of the meta tile.
    ldy #0
    lda (meta_tile_addr), y
    tax
    iny
    iny
    lda (meta_tile_addr), y
    ldy #8
@rowALoop:
    stx $2007   ; tile 00
    sta $2007   ; tile 01

    stx $2007   ; and again
    sta $2007
    dey
    bne @rowALoop

    ; Write second tile row, alternating between tiles 02 and 03
    ; of the meta tile.
    ldy #1
    lda (meta_tile_addr), y
    tax
    iny
    iny
    lda (meta_tile_addr), y
    ldy #8
@rowBLoop:
    stx $2007   ; tile 02
    sta $2007   ; tile 03

    stx $2007   ; and again
    sta $2007
    dey
    bne @rowBLoop
    rts

; Advance to the next frame and NMI handlers
; Called only from Title_Trans_NMI_End
LoadFrameSubPointer:
    bit framesub_next
    bvs :+
    rts

:   lda #0
    sta framesub_next

    lda framesub_index
    asl a
    tax

    lda FrameSubHandlers, x
    sta DoFramePointer

    lda NMISubHandlers, x
    sta DoNMIPointer

    inx

    lda FrameSubHandlers, x
    sta DoFramePointer+1

    lda NMISubHandlers, x
    sta DoNMIPointer+1

    inc framesub_index
    rts

FrameSubHandlers:
    .word ttrans_frame_clear_00
    .word ttrans_frame_scrolling
    .word ttrans_frame_00b
    ;.word ttrans_frame_00c

    .word ttrans_frame_statusbar
    .word ttrans_frame_nt2          ; setup skyline
    .word ttrans_frame_skylinecheck ; check for complete skyline

    .word ttrans_frame_waitforcolumndraw    ; waiting
    .word ttrans_frame_columnbuffer         ; buffer

    .word ttrans_frame_done
    .word ttrans_frame_load

NMISubHandlers:
    .word ttrans_nmi_clear_00
    .word ttrans_nmi_meta_attr
    .word ttrans_nmi_draw_meta_row_ground
    ;.word ttrans_nmi_draw_meta_row

    .word ttrans_nmi_draw_statusbar
    .word ttrans_nmi_draw_nt2       ; draw skyline
    .word ttrans_nmi_draw_nt2       ; still drawing skyline

    ;.word ttrans_nmi_skylinedraw
    .word Title_Trans_NMI_End   ; waiting
    .word ttrans_nmi_drawbuffer ; drawing

    .word Title_Trans_NMI_End
