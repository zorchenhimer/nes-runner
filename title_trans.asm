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

; Fade frame handler.
ttrans_frame_clear_00:
    jsr ClearSprites

    lda TitlePPUCtrl
    ora #$02
    sta TitlePPUCtrl

    dec framesub_next
    jmp t_spritezero

; Scroll down to playfield
ttrans_frame_scrolling:
    inc TitleScroll
    dec framesub_next

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

    lda #$21
    sta TmpAddr
    lda #$80
    sta TmpAddr+1

    lda #<Meta_Sky
    sta meta_tile_addr
    lda #>Meta_Sky
    sta meta_tile_addr+1
    jmp WaitFrame

ttrans_frame_00b:

    dec framesub_next
    jmp ttrans_draw_done

ttrans_frame_00c:
    lda #$22
    sta TmpAddr
    lda #$40
    sta TmpAddr+1

    lda #<Meta_Ground2
    sta meta_tile_addr
    lda #>Meta_Ground2
    sta meta_tile_addr+1

    dec framesub_next
    jmp ttrans_draw_done

ttrans_frame_statusbar:
    dec framesub_next
    jmp ttrans_draw_done

ttrans_draw_wait:
    lda TitleScroll
    cmp #$AC
    bcc :+
    dec framesub_next
:   jmp ttrans_draw_done

ttrans_draw_done:
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

ttrans_frame_load:
    lda #2
    sta obs_countdown
    lda #15
    sta meta_last_gen
    sta meta_last_buffer

    jsr generate_column

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
    bit $2002
    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006

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

ttrans_nmi_clear_00:
    jsr WriteSprites
    jsr WritePalettes
    jmp Title_Trans_NMI_End

ttrans_nmi_clear_01:
    lda #$21
    sta $2006
    lda #$80
    sta $2006
    jmp :+

ttrans_nmi_clear_02:
    lda #$22
    sta $2006
    lda #$A0
    sta $2006

:   ldx #9
    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$20
:
.repeat 32
    sta $2007
.endrepeat
    dex
    bne :-
    jmp Title_Trans_NMI_End

;;;;;;;;;;;;;;;;;;;
ttrans_nmi_meta_attr:
    jsr ttrans_write_meta_row
    lda TmpAddr+1
    clc
    adc #$40
    sta TmpAddr+1
    bcc :+
    inc TmpAddr+0
:
    jsr ttrans_write_meta_row
    jsr WritePalettes

    ; Draw attribute data for the playfield
    lda #$23
    sta $2006
    lda #$D8
    sta $2006

    lda #$AA
.repeat 8
    sta $2007
.endrepeat

    lda #$55
.repeat 8
    sta $2007
.endrepeat

    jmp Title_Trans_NMI_End

ttrans_nmi_draw_meta_row_ground:
    lda #$22
    sta TmpAddr
    lda #$00
    sta TmpAddr+1

    lda #<Meta_Ground
    sta meta_tile_addr
    lda #>Meta_Ground
    sta meta_tile_addr+1
    jsr ttrans_write_meta_row

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


ttrans_nmi_draw_meta_row:
    ; load up a meta tile
    ; draw one row
    lda TmpAddr
    sta $2006
    lda TmpAddr+1
    sta $2006
    jsr ttrans_write_meta_row
    jmp Title_Trans_NMI_End

ttrans_nmi_draw_statusbar:
    jsr WriteScoreLabel
    jsr WriteSeedLabel
    jmp Title_Trans_NMI_End

ttrans_nmi_fading:
    jsr WritePalettes
    jsr WriteSprites
    jmp Title_Trans_NMI_End

ttrans_frame_nt2:
    dec framesub_next
    jmp ttrans_draw_done

ttrans_nmi_draw_nt2:
    jsr WriteSPZeroLineNT01
    jsr WriteSPZeroLineNT02
    jmp Title_Trans_NMI_End

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
    .word ttrans_frame_00c

    .word ttrans_frame_statusbar
    .word ttrans_draw_wait
    .word ttrans_frame_nt2
    .word ttrans_draw_done

    .word ttrans_frame_load

NMISubHandlers:
    .word ttrans_nmi_clear_00
    .word ttrans_nmi_meta_attr
    .word ttrans_nmi_draw_meta_row_ground
    .word ttrans_nmi_draw_meta_row

    .word ttrans_nmi_draw_statusbar
    .word Title_Trans_NMI_End
    .word ttrans_nmi_draw_nt2

    .word Title_Trans_NMI_End
