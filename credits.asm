Credits_Init:
    ; - Clear backgound for both nametables
    ; - Update palettes
    inc SkipNMI

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #$00
    sta $2001

    lda #<credits_palette
    sta PaletteAddr
    lda #>credits_palette
    sta PaletteAddr+1
    jsr LoadPalette

    lda #$20
    sta $2006
    lda #$00
    sta $2006
    jsr credits_ClearNametable

    jsr credits_Header
    jsr Credits_DrawNames

    jsr credits_AttrTable

    ; reset scroll
    bit $2001
    lda #$00
    sta $2005
    sta $2005

    lda #PPU_CTRL_HORIZ
    sta $2000

    lda #%00011110
    sta $2001
    lda #0
    sta SkipNMI
    rts

credits_AttrTable:
    lda #$23
    sta $2006
    lda #$C0
    sta $2006

    lda #$00
    rts

credits_ClearNametable:
    ldx #0
    ldy #0
    lda #' '
@loop2:
    sta $2007
    inx
    cpx #$20
    bne @loop2

    iny
    ldx #0
    cpy #$1E
    bne @loop2
    rts

credits_Header:
    ; First row of twitch logo
    bit $2002
    lda #$20
    sta $2006
    lda #$47
    sta $2006

    lda #$10
    sta $2007
    lda #$11
    sta $2007
    lda #$12
    sta $2007

    ; Second row
    lda #$20
    sta $2006
    lda #$67
    sta $2006

    lda #$13
    sta $2007
    lda #$14
    sta $2007
    lda #$15
    sta $2007

    ; Third row
    lda #$20
    sta $2006
    lda #$87
    sta $2006

    lda #$16
    sta $2007
    lda #$17
    sta $2007
    lda #$18
    sta $2007

    ; top text: "twitch.tv/"
    lda #$20
    sta $2006
    lda #$4A
    sta $2006

    ldx #0
    ldy #$02
@loop1:
    sty $2007
    iny
    cpy #$08
    bne @loop1

    ; top half: "Zorchenhimer"
    lda #$20
    sta $2006
    lda #$6A
    sta $2006

    ldx #0
    ldy #$80
@loop2:
    sty $2007
    iny
    cpy #$8F
    bne @loop2

    ; Bottom half: "Zorchenhimer"
    lda #$20
    sta $2006
    lda #$8A
    sta $2006

    ldx #0
    ldy #$90
@loop3:
    sty $2007
    iny
    cpy #$9F
    bne @loop3
    rts

Credits_DrawNames:
    ; load up name metadata
    lda credits_metadata
    lsr a   ; divide by two
    sta cr_nameCount

    lda #0
    ;sta cr_nameIdx
    sta cr_nameCurrent

    lda #$20
    sta cr_ppuAddr

    lda #$EA
    sta cr_ppuAddr+1

; table loop
@outer:
    bit $2002
    lda cr_ppuAddr
    sta $2006
    lda cr_ppuAddr+1
    sta $2006

    lda cr_nameCurrent
    asl a
    tax

    lda credits_name_table, x
    sta cr_nameAddress

    lda credits_name_table+1, x
    sta cr_nameAddress+1

    ; name loop
    ldy #0
    lda (cr_nameAddress), y
    sta cr_nameLength
    inc cr_nameLength
    iny

@inner:
    lda (cr_nameAddress), y
    sta $2007
    iny
    cpy cr_nameLength
    beq @nameDone
    jmp @inner

@nameDone:

    ; move on to the next name
    dec cr_nameCount
    bne @next
    rts

@next:
    inc cr_nameCurrent
    lda cr_ppuAddr+1
    clc
    adc #64
    sta cr_ppuAddr+1

    lda cr_ppuAddr
    adc #0
    sta cr_ppuAddr
    jmp @outer

Credits_Frame:
    lda #BUTTON_A
    sta btnPressedMask
    jsr ButtonPressedP1
    beq @done

    lda #GS_TITLE
    sta current_gamestate
    inc gamestate_changed

@done:
    rts

credits_Palette:
    .byte $0F,$30,$13,$0F, $0F,$05,$15,$0F, $0F,$0A,$1A,$0F, $0F,$11,$21,$0F
    .byte $0F,$30,$13,$0F, $0F,$05,$15,$0F, $0F,$0A,$1A,$0F, $0F,$11,$21,$0F

credits_metadata:
    ; length of nametable
    .byte credits_nametable_end - credits_name_table

    .include "credits_data.i"
