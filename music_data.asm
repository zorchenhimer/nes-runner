; FamiTracker exported music data: RunnJumper_6132019.ftm
;

; Module header
	.word ft_song_list
	.word ft_instrument_list
	.word ft_sample_list
	.word ft_samples
	.byte 0 ; flags
	.word 3600 ; NTSC speed
	.word 3000 ; PAL speed

; Instrument pointer list
ft_instrument_list:
	.word ft_inst_0
	.word ft_inst_1
	.word ft_inst_2
	.word ft_inst_3
	.word ft_inst_4
	.word ft_inst_5
	.word ft_inst_6
	.word ft_inst_7
	.word ft_inst_8
	.word ft_inst_9
	.word ft_inst_10
	.word ft_inst_11
	.word ft_inst_12
	.word ft_inst_13
	.word ft_inst_14
	.word ft_inst_15
	.word ft_inst_16
	.word ft_inst_17
	.word ft_inst_18
	.word ft_inst_19

; Instruments
ft_inst_0:
	.byte 19
	.word ft_seq_2a03_5
	.word ft_seq_2a03_1
	.word ft_seq_2a03_9

ft_inst_1:
	.byte 19
	.word ft_seq_2a03_10
	.word ft_seq_2a03_6
	.word ft_seq_2a03_14

ft_inst_2:
	.byte 3
	.word ft_seq_2a03_20
	.word ft_seq_2a03_16

ft_inst_3:
	.byte 3
	.word ft_seq_2a03_25
	.word ft_seq_2a03_16

ft_inst_4:
	.byte 17
	.word ft_seq_2a03_0
	.word ft_seq_2a03_4

ft_inst_5:
	.byte 19
	.word ft_seq_2a03_15
	.word ft_seq_2a03_11
	.word ft_seq_2a03_19

ft_inst_6:
	.byte 1
	.word ft_seq_2a03_30

ft_inst_7:
	.byte 1
	.word ft_seq_2a03_35

ft_inst_8:
	.byte 17
	.word ft_seq_2a03_45
	.word ft_seq_2a03_39

ft_inst_9:
	.byte 17
	.word ft_seq_2a03_40
	.word ft_seq_2a03_44

ft_inst_10:
	.byte 17
	.word ft_seq_2a03_50
	.word ft_seq_2a03_44

ft_inst_11:
	.byte 21
	.word ft_seq_2a03_75
	.word ft_seq_2a03_12
	.word ft_seq_2a03_64

ft_inst_12:
	.byte 5
	.word ft_seq_2a03_80
	.word ft_seq_2a03_17

ft_inst_13:
	.byte 21
	.word ft_seq_2a03_85
	.word ft_seq_2a03_22
	.word ft_seq_2a03_69

ft_inst_14:
	.byte 21
	.word ft_seq_2a03_90
	.word ft_seq_2a03_27
	.word ft_seq_2a03_74

ft_inst_15:
	.byte 23
	.word ft_seq_2a03_95
	.word ft_seq_2a03_21
	.word ft_seq_2a03_37
	.word ft_seq_2a03_79

ft_inst_16:
	.byte 19
	.word ft_seq_2a03_100
	.word ft_seq_2a03_26
	.word ft_seq_2a03_84

ft_inst_17:
	.byte 19
	.word ft_seq_2a03_105
	.word ft_seq_2a03_31
	.word ft_seq_2a03_89

ft_inst_18:
	.byte 19
	.word ft_seq_2a03_115
	.word ft_seq_2a03_41
	.word ft_seq_2a03_94

ft_inst_19:
	.byte 3
	.word ft_seq_2a03_110
	.word ft_seq_2a03_36

; Sequences
ft_seq_2a03_0:
	.byte $01, $FF, $00, $00, $0A
ft_seq_2a03_1:
	.byte $06, $FF, $00, $00, $18, $16, $11, $05, $01, $00
ft_seq_2a03_4:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_5:
	.byte $08, $FF, $00, $00, $0F, $0E, $0C, $0A, $08, $03, $01, $00
ft_seq_2a03_6:
	.byte $09, $FF, $00, $00, $00, $FE, $FB, $F8, $F2, $F0, $EE, $EA, $E8
ft_seq_2a03_9:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_10:
	.byte $0C, $FF, $00, $00, $0D, $0C, $09, $08, $07, $05, $03, $02, $01, $01, $01, $00
ft_seq_2a03_11:
	.byte $05, $FF, $00, $00, $0C, $08, $05, $02, $00
ft_seq_2a03_12:
	.byte $0C, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $FF, $FF
ft_seq_2a03_14:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_15:
	.byte $01, $FF, $00, $00, $04
ft_seq_2a03_16:
	.byte $04, $FF, $00, $00, $09, $00, $00, $00
ft_seq_2a03_17:
	.byte $0C, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $FF, $FF
ft_seq_2a03_19:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_20:
	.byte $05, $FF, $00, $00, $06, $04, $02, $01, $00
ft_seq_2a03_21:
	.byte $1A, $FF, $00, $00, $00, $00, $FF, $FF, $FE, $FE, $FD, $FD, $FC, $FC, $FB, $FB, $FA, $FA, $F9, $F9
	.byte $F8, $F8, $F7, $F7, $F6, $F6, $F5, $F5, $F4, $F4
ft_seq_2a03_22:
	.byte $0C, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $FF, $FF
ft_seq_2a03_25:
	.byte $04, $FF, $00, $00, $05, $04, $02, $02
ft_seq_2a03_26:
	.byte $1A, $FF, $00, $00, $00, $00, $FF, $FF, $FE, $FE, $FD, $FD, $FC, $FC, $FB, $FB, $FA, $FA, $F9, $F9
	.byte $F8, $F8, $F7, $F7, $F6, $F6, $F5, $F5, $F4, $F4
ft_seq_2a03_27:
	.byte $0C, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $FF, $FF
ft_seq_2a03_30:
	.byte $2C, $FF, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $03, $03, $03, $03
	.byte $04, $04, $04, $04, $05, $05, $05, $05, $06, $06, $06, $06, $07, $07, $07, $07, $08, $08, $08, $08
	.byte $09, $09, $09, $09, $0A, $0A, $0A, $0A
ft_seq_2a03_31:
	.byte $04, $FF, $00, $00, $0C, $00, $00, $00
ft_seq_2a03_35:
	.byte $28, $FF, $00, $00, $0A, $0A, $0A, $0A, $09, $09, $09, $09, $08, $08, $08, $08, $07, $07, $07, $07
	.byte $06, $06, $06, $06, $05, $05, $05, $05, $04, $04, $04, $04, $03, $03, $03, $03, $02, $02, $02, $02
	.byte $01, $01, $01, $01
ft_seq_2a03_36:
	.byte $02, $FF, $00, $00, $FC, $00
ft_seq_2a03_37:
	.byte $0A, $00, $00, $00, $FF, $FE, $FF, $00, $00, $01, $02, $01, $00, $00
ft_seq_2a03_39:
	.byte $01, $FF, $00, $00, $01
ft_seq_2a03_40:
	.byte $2C, $FF, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $03, $03, $03, $03
	.byte $04, $04, $04, $04, $05, $05, $05, $05, $06, $06, $06, $06, $07, $07, $07, $07, $08, $08, $08, $08
	.byte $09, $09, $09, $09, $0A, $0A, $0A, $0A
ft_seq_2a03_41:
	.byte $04, $FF, $00, $00, $0C, $00, $00, $00
ft_seq_2a03_44:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_45:
	.byte $28, $FF, $00, $00, $0A, $0A, $0A, $0A, $09, $09, $09, $09, $08, $08, $08, $08, $07, $07, $07, $07
	.byte $06, $06, $06, $06, $05, $05, $05, $05, $04, $04, $04, $04, $03, $03, $03, $03, $02, $02, $02, $02
	.byte $01, $01, $01, $01
ft_seq_2a03_50:
	.byte $28, $FF, $00, $00, $0B, $0B, $0B, $0B, $09, $09, $09, $09, $08, $08, $08, $08, $07, $07, $07, $07
	.byte $06, $06, $06, $06, $05, $05, $05, $05, $04, $04, $04, $04, $03, $03, $03, $03, $02, $02, $02, $02
	.byte $01, $01, $01, $01
ft_seq_2a03_64:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_69:
	.byte $01, $FF, $00, $00, $01
ft_seq_2a03_74:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_75:
	.byte $01, $FF, $00, $00, $01
ft_seq_2a03_79:
	.byte $01, $FF, $00, $00, $03
ft_seq_2a03_80:
	.byte $01, $FF, $00, $00, $0A
ft_seq_2a03_84:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_85:
	.byte $01, $FF, $00, $00, $0A
ft_seq_2a03_89:
	.byte $01, $FF, $00, $00, $01
ft_seq_2a03_90:
	.byte $01, $FF, $00, $00, $07
ft_seq_2a03_94:
	.byte $01, $FF, $00, $00, $01
ft_seq_2a03_95:
	.byte $0D, $FF, $00, $00, $0D, $0C, $0B, $0A, $09, $08, $07, $06, $05, $04, $03, $02, $01
ft_seq_2a03_100:
	.byte $01, $FF, $00, $00, $02
ft_seq_2a03_105:
	.byte $05, $FF, $00, $00, $0A, $07, $04, $02, $00
ft_seq_2a03_110:
	.byte $10, $FF, $00, $00, $0F, $0E, $0C, $0A, $09, $08, $07, $06, $05, $05, $03, $03, $03, $03, $03, $01
ft_seq_2a03_115:
	.byte $05, $FF, $00, $00, $04, $03, $02, $01, $00

; DPCM instrument list (pitch, sample index)
ft_sample_list:

; DPCM samples list (location, size, bank)
ft_samples:


; Song pointer list
ft_song_list:
	.word ft_song_0
	.word ft_song_1
	.word ft_song_2
	.word ft_song_3

; Song info
ft_song_0:
	.word ft_s0_frames
	.byte 2	; frame count
	.byte 64	; pattern length
	.byte 8	; speed
	.byte 150	; tempo
	.byte 0	; initial bank

ft_song_1:
	.word ft_s1_frames
	.byte 10	; frame count
	.byte 64	; pattern length
	.byte 4	; speed
	.byte 150	; tempo
	.byte 0	; initial bank

ft_song_2:
	.word ft_s2_frames
	.byte 9	; frame count
	.byte 64	; pattern length
	.byte 5	; speed
	.byte 150	; tempo
	.byte 0	; initial bank

ft_song_3:
	.word ft_s3_frames
	.byte 5	; frame count
	.byte 64	; pattern length
	.byte 6	; speed
	.byte 150	; tempo
	.byte 0	; initial bank


;
; Pattern and frame data for all songs below
;

; Bank 0
ft_s0_frames:
	.word ft_s0f0
	.word ft_s0f1
ft_s0f0:
	.word ft_s0p0c0, ft_s0p0c1, ft_s0p0c2, ft_s0p0c3, ft_s0p0c4
ft_s0f1:
	.word ft_s0p1c0, ft_s0p1c1, ft_s0p1c2, ft_s0p1c3, ft_s0p0c4
; Bank 0
ft_s0p0c0:
	.byte $82, $00, $80, $26, $12, $19, $1E, $25, $28, $2C, $31, $2D, $2C, $28, $25, $23, $12, $19, $1E, $25
	.byte $28, $2C, $31, $2D, $2C, $28, $25, $23, $10, $17, $1C, $23, $26, $2A, $2F, $2B, $2A, $26, $23, $21
	.byte $0E, $15, $1A, $21, $24, $28, $2D, $29, $28, $24, $21, $84, $8C, $01, $1F, $10

; Bank 0
ft_s0p0c1:
	.byte $E9, $12, $17, $10, $0B, $0E, $1B

; Bank 0
ft_s0p0c2:
	.byte $82, $00, $E4, $1E, $25, $2A, $31, $34, $38, $3D, $39, $38, $34, $31, $2F, $1E, $25, $2A, $31, $34
	.byte $38, $3D, $39, $38, $34, $31, $2F, $1C, $23, $28, $2F, $32, $36, $3B, $37, $36, $32, $2F, $2D, $1A
	.byte $21, $26, $2D, $30, $34, $39, $35, $34, $30, $2D, $84, $8C, $01, $2B, $10

; Bank 0
ft_s0p0c3:
	.byte $E7, $11, $0B, $14, $0B, $11, $0B, $14, $1B

; Bank 0
ft_s0p0c4:
	.byte $00, $3F

; Bank 0
ft_s0p1c0:
	.byte $82, $00, $80, $26, $0D, $14, $19, $20, $23, $27, $2C, $28, $27, $23, $20, $1C, $0D, $14, $19, $20
	.byte $23, $27, $2C, $28, $27, $23, $20, $1E, $0D, $14, $19, $20, $23, $27, $2C, $28, $27, $23, $20, $1C
	.byte $0D, $14, $19, $20, $23, $27, $2C, $28, $27, $23, $20, $84, $8C, $01, $1E, $10

; Bank 0
ft_s0p1c1:
	.byte $E9, $0D, $17, $0B, $11, $E4, $0D, $03, $14, $11

; Bank 0
ft_s0p1c2:
	.byte $82, $00, $E4, $19, $20, $25, $2C, $2F, $33, $38, $34, $33, $2F, $2C, $28, $19, $20, $25, $2C, $2F
	.byte $33, $38, $34, $33, $2F, $2C, $2A, $19, $20, $25, $2C, $2F, $33, $38, $34, $33, $2F, $2C, $28, $19
	.byte $20, $25, $2C, $2F, $33, $38, $34, $33, $2F, $2C, $84, $8C, $01, $2A, $10

; Bank 0
ft_s0p1c3:
	.byte $E7, $11, $0B, $15, $0B, $11, $0B, $15, $1B

; Bank 0
ft_s1_frames:
	.word ft_s1f0
	.word ft_s1f1
	.word ft_s1f2
	.word ft_s1f3
	.word ft_s1f4
	.word ft_s1f5
	.word ft_s1f6
	.word ft_s1f7
	.word ft_s1f8
	.word ft_s1f9
ft_s1f0:
	.word ft_s1p0c0, ft_s1p0c1, ft_s1p0c2, ft_s1p0c3, ft_s0p0c4
ft_s1f1:
	.word ft_s1p1c0, ft_s1p1c1, ft_s1p1c2, ft_s1p1c3, ft_s0p0c4
ft_s1f2:
	.word ft_s1p2c0, ft_s1p2c1, ft_s1p0c2, ft_s1p2c3, ft_s0p0c4
ft_s1f3:
	.word ft_s1p3c0, ft_s1p2c1, ft_s1p3c2, ft_s1p2c3, ft_s0p0c4
ft_s1f4:
	.word ft_s1p2c0, ft_s1p4c1, ft_s1p0c2, ft_s1p2c3, ft_s0p0c4
ft_s1f5:
	.word ft_s1p3c0, ft_s1p5c1, ft_s1p3c2, ft_s1p2c3, ft_s0p0c4
ft_s1f6:
	.word ft_s1p6c0, ft_s1p6c1, ft_s1p6c2, ft_s1p6c3, ft_s0p0c4
ft_s1f7:
	.word ft_s1p7c0, ft_s1p7c1, ft_s1p7c2, ft_s1p6c3, ft_s0p0c4
ft_s1f8:
	.word ft_s1p8c0, ft_s1p8c1, ft_s1p8c2, ft_s1p6c3, ft_s0p0c4
ft_s1f9:
	.word ft_s1p9c0, ft_s1p9c1, ft_s1p9c2, ft_s0p0c4, ft_s0p0c4
; Bank 0
ft_s1p0c0:
	.byte $80, $24, $0D, $05, $82, $0B, $E1, $2A, $2A, $2A, $2A, $84, $2A, $09

; Bank 0
ft_s1p0c1:
	.byte $7F, $3F

; Bank 0
ft_s1p0c2:
	.byte $82, $01, $E5, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19
	.byte $7F, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19, $84, $7F, $00, $8C, $01, $00, $04

; Bank 0
ft_s1p0c3:
	.byte $82, $01, $E2, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D
	.byte $1A, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $84, $1D, $01

; Bank 0
ft_s1p1c0:
	.byte $00, $05, $E1, $2A, $05, $2A, $11, $2A, $21

; Bank 0
ft_s1p1c1:
	.byte $00, $0B, $82, $00, $80, $22, $25, $80, $24, $31, $80, $22, $28, $80, $24, $34, $80, $22, $2C, $80
	.byte $24, $38, $80, $22, $28, $80, $24, $34, $80, $22, $2C, $80, $24, $38, $80, $22, $2F, $80, $24, $3B
	.byte $80, $22, $2A, $80, $24, $36, $80, $22, $2C, $80, $24, $38, $80, $22, $2F, $80, $24, $3B, $80, $22
	.byte $31, $84, $80, $24, $3D, $20

; Bank 0
ft_s1p1c2:
	.byte $82, $01, $E5, $19, $7F, $19, $25, $19, $7F, $84, $25, $03, $EF, $25, $03, $19, $09, $7F, $01, $7F
	.byte $1F

; Bank 0
ft_s1p1c3:
	.byte $82, $01, $E2, $1D, $1D, $1A, $1D, $1D, $1A, $1D, $1D, $84, $1A, $0D, $80, $26, $15, $04, $8C, $01
	.byte $00, $1C

; Bank 0
ft_s1p2c0:
	.byte $82, $01, $80, $24, $31, $2A, $2C, $80, $22, $31, $2A, $2C, $80, $24, $31, $2A, $2C, $80, $22, $31
	.byte $2A, $2C, $80, $24, $31, $2A, $2C, $80, $22, $31, $2A, $2C, $80, $24, $31, $2A, $2C, $80, $22, $31
	.byte $2A, $84, $2C, $11

; Bank 0
ft_s1p2c1:
	.byte $E6, $28, $05, $EC, $28, $05, $E7, $28, $07, $80, $20, $28, $03, $E6, $25, $05, $EC, $25, $05, $E7
	.byte $25, $07, $80, $20, $25, $13

; Bank 0
ft_s1p2c3:
	.byte $82, $01, $E2, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $1A, $1D, $1D, $1A, $80, $26, $15, $E2, $1D
	.byte $1A, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $1A, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $84, $1A
	.byte $00, $8C, $01, $00, $00, $82, $01, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $84, $1A, $05

; Bank 0
ft_s1p3c0:
	.byte $82, $01, $80, $24, $2F, $2A, $2C, $80, $22, $2F, $2A, $2C, $80, $24, $2F, $2A, $2C, $80, $22, $2F
	.byte $2A, $2C, $80, $24, $31, $2F, $31, $80, $22, $33, $31, $33, $34, $33, $34, $3D, $38, $84, $31, $11

; Bank 0
ft_s1p3c2:
	.byte $82, $01, $E5, $17, $7F, $17, $23, $17, $7F, $17, $7F, $17, $23, $17, $7F, $15, $7F, $15, $21, $15
	.byte $7F, $14, $7F, $14, $20, $14, $7F, $19, $7F, $19, $25, $19, $84, $7F, $00, $8C, $01, $00, $04

; Bank 0
ft_s1p4c1:
	.byte $E6, $2C, $05, $EC, $2C, $05, $E7, $2C, $07, $80, $20, $2C, $03, $E6, $28, $05, $EC, $28, $05, $E7
	.byte $28, $07, $80, $20, $28, $13

; Bank 0
ft_s1p5c1:
	.byte $E6, $2A, $05, $EC, $2A, $05, $E7, $2A, $07, $80, $20, $2A, $03, $E6, $27, $05, $EC, $27, $05, $E7
	.byte $27, $05, $24, $00, $EA, $25, $14

; Bank 0
ft_s1p6c0:
	.byte $82, $00, $80, $22, $36, $80, $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $31, $80, $24, $31
	.byte $80, $22, $36, $80, $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $3D, $80, $24, $3D, $80, $22
	.byte $36, $80, $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $31, $80, $24, $31, $80, $22, $36, $80
	.byte $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $3D, $80, $24, $3D, $80, $22, $36, $80, $24, $36
	.byte $80, $22, $38, $80, $24, $38, $80, $22, $31, $80, $24, $31, $80, $22, $36, $80, $24, $36, $80, $22
	.byte $38, $80, $24, $38, $80, $22, $3D, $80, $24, $3D, $80, $22, $36, $80, $24, $36, $80, $22, $38, $80
	.byte $24, $38, $80, $22, $31, $80, $24, $31, $84, $E1, $2C, $01, $2A, $01, $27, $11

; Bank 0
ft_s1p6c1:
	.byte $EE, $27, $05, $28, $03, $25, $07, $28, $03, $26, $00, $27, $06, $2C, $03, $30, $00, $31, $06, $EA
	.byte $31, $0C, $80, $22, $40, $08

; Bank 0
ft_s1p6c2:
	.byte $82, $01, $E5, $12, $7F, $12, $1E, $12, $7F, $12, $7F, $12, $1E, $12, $7F, $14, $7F, $14, $20, $14
	.byte $7F, $14, $7F, $14, $20, $14, $84, $7F, $11

; Bank 0
ft_s1p6c3:
	.byte $82, $01, $E2, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $1A, $1D, $1D, $1A, $80, $26, $15, $E2, $1D
	.byte $1A, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $1A, $1D, $1D, $1A, $80, $26, $15, $E2, $1D, $84, $1A
	.byte $00, $8C, $01, $00, $10

; Bank 0
ft_s1p7c0:
	.byte $ED, $2F, $05, $31, $03, $2C, $07, $2F, $03, $2C, $00, $2D, $04, $31, $00, $7F, $00, $2A, $03, $27
	.byte $00, $28, $06, $E8, $26, $00, $27, $14

; Bank 0
ft_s1p7c1:
	.byte $EE, $27, $05, $28, $03, $25, $07, $28, $03, $29, $00, $2A, $04, $2C, $00, $7F, $00, $21, $03, $1F
	.byte $00, $20, $06, $24, $00, $25, $14

; Bank 0
ft_s1p7c2:
	.byte $82, $01, $E5, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19
	.byte $7F, $19, $7F, $19, $25, $19, $84, $7F, $11

; Bank 0
ft_s1p8c0:
	.byte $82, $00, $80, $22, $36, $80, $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $31, $80, $24, $31
	.byte $80, $22, $36, $80, $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $3D, $80, $24, $3D, $80, $22
	.byte $36, $80, $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $31, $80, $24, $31, $80, $22, $36, $80
	.byte $24, $36, $80, $22, $38, $80, $24, $38, $80, $22, $3D, $80, $24, $3D, $80, $22, $36, $80, $24, $36
	.byte $80, $22, $38, $80, $24, $38, $80, $22, $31, $80, $24, $31, $80, $22, $36, $80, $24, $36, $80, $22
	.byte $38, $80, $24, $38, $80, $22, $3D, $80, $24, $3D, $80, $22, $36, $80, $24, $36, $80, $22, $38, $80
	.byte $24, $38, $80, $22, $31, $80, $24, $31, $80, $22, $36, $80, $24, $36, $80, $22, $38, $80, $24, $38
	.byte $80, $22, $40, $84, $80, $24, $40, $10

; Bank 0
ft_s1p8c1:
	.byte $EE, $27, $05, $28, $03, $25, $07, $28, $03, $26, $00, $27, $06, $2C, $03, $33, $00, $34, $06, $33
	.byte $15

; Bank 0
ft_s1p8c2:
	.byte $82, $01, $E5, $12, $7F, $12, $1E, $12, $7F, $12, $7F, $12, $1E, $12, $7F, $14, $7F, $14, $20, $14
	.byte $7F, $14, $7F, $14, $20, $14, $84, $7F, $00, $8C, $01, $00, $10

; Bank 0
ft_s1p9c0:
	.byte $82, $01, $80, $24, $36, $38, $31, $36, $38, $3D, $2A, $2C, $25, $2A, $2C, $31, $1E, $20, $19, $1E
	.byte $20, $25, $12, $14, $0D, $12, $14, $84, $19, $11

; Bank 0
ft_s1p9c1:
	.byte $EA, $31, $05, $EB, $31, $39

; Bank 0
ft_s1p9c2:
	.byte $82, $01, $E5, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19, $7F, $19, $7F, $19, $25, $19
	.byte $7F, $19, $7F, $19, $25, $19, $84, $7F, $00, $8C, $01, $00, $10

; Bank 0
ft_s2_frames:
	.word ft_s2f0
	.word ft_s2f1
	.word ft_s2f2
	.word ft_s2f3
	.word ft_s2f4
	.word ft_s2f5
	.word ft_s2f6
	.word ft_s2f7
	.word ft_s2f8
ft_s2f0:
	.word ft_s2p2c0, ft_s2p2c1, ft_s2p2c2, ft_s2p2c3, ft_s0p0c4
ft_s2f1:
	.word ft_s2p0c0, ft_s2p0c1, ft_s2p0c2, ft_s2p0c3, ft_s0p0c4
ft_s2f2:
	.word ft_s2p1c0, ft_s2p1c1, ft_s2p1c2, ft_s2p0c3, ft_s0p0c4
ft_s2f3:
	.word ft_s2p0c0, ft_s2p0c1, ft_s2p0c2, ft_s2p0c3, ft_s0p0c4
ft_s2f4:
	.word ft_s2p1c0, ft_s2p1c1, ft_s2p1c2, ft_s2p0c3, ft_s0p0c4
ft_s2f5:
	.word ft_s2p4c0, ft_s2p4c1, ft_s2p0c2, ft_s2p0c3, ft_s0p0c4
ft_s2f6:
	.word ft_s2p3c0, ft_s2p3c1, ft_s2p1c2, ft_s2p0c3, ft_s0p0c4
ft_s2f7:
	.word ft_s2p4c0, ft_s2p4c1, ft_s2p0c2, ft_s2p0c3, ft_s0p0c4
ft_s2f8:
	.word ft_s2p3c0, ft_s2p3c1, ft_s2p1c2, ft_s2p0c3, ft_s0p0c4
; Bank 0
ft_s2p0c0:
	.byte $EA, $19, $05, $E5, $0D, $05, $EA, $20, $17, $82, $05, $E5, $0F, $10, $12, $13, $84, $14, $03

; Bank 0
ft_s2p0c1:
	.byte $EA, $10, $05, $0D, $05, $19, $17, $82, $05, $13, $14, $15, $16, $84, $17, $03

; Bank 0
ft_s2p0c2:
	.byte $E0, $0F, $03, $0F, $03, $E5, $0D, $03, $7F, $01, $E0, $0F, $03, $E5, $0D, $03, $7F, $01, $E1, $31
	.byte $03, $E5, $1B, $00, $80, $20, $1B, $02, $E0, $0F, $03, $0F, $03, $E5, $0D, $01, $7F, $01, $E0, $0F
	.byte $01, $0F, $03, $0F, $05, $E1, $31, $03, $E5, $0D, $03

; Bank 0
ft_s2p0c3:
	.byte $E2, $1E, $01, $1E, $03, $1E, $01, $1E, $03, $1E, $01, $E3, $1E, $03, $E2, $1E, $01, $1E, $01, $E3
	.byte $1E, $01, $80, $26, $14, $04, $7F, $00, $E2, $1E, $01, $1E, $01, $1E, $03, $1E, $01, $1E, $01, $1E
	.byte $01, $1B, $05, $1E, $01, $1E, $01, $E3, $1E, $01, $80, $26, $14, $04, $7F, $02

; Bank 0
ft_s2p1c0:
	.byte $EA, $19, $05, $20, $05, $1C, $0F, $80, $20, $28, $05, $E1, $1C, $01, $82, $05, $EA, $1E, $1C, $1B
	.byte $1C, $84, $17, $03

; Bank 0
ft_s2p1c1:
	.byte $EA, $10, $05, $0D, $05, $19, $0F, $EF, $1E, $03, $E1, $2A, $03, $82, $05, $EA, $13, $14, $15, $16
	.byte $84, $17, $01, $E1, $2A, $01

; Bank 0
ft_s2p1c2:
	.byte $E0, $0F, $03, $0F, $03, $E5, $0D, $03, $7F, $01, $E0, $0F, $03, $E5, $0D, $03, $7F, $01, $E1, $31
	.byte $03, $E5, $1E, $00, $80, $20, $1E, $02, $E0, $0F, $03, $82, $01, $1B, $20, $E5, $0D, $7F, $E0, $0F
	.byte $84, $0F, $03, $0F, $01, $0F, $03, $E1, $31, $01, $E0, $20, $01, $E5, $1C, $03

; Bank 0
ft_s2p2c0:
	.byte $00, $01, $E1, $1C, $07, $1C, $02, $1C, $00, $19, $31

; Bank 0
ft_s2p2c1:
	.byte $E1, $2A, $05, $2A, $05, $2A, $03, $1E, $02, $1E, $00, $1E, $00, $1B, $01, $19, $28

; Bank 0
ft_s2p2c2:
	.byte $E0, $0F, $03, $1B, $01, $20, $01, $E5, $0D, $01, $7F, $35

; Bank 0
ft_s2p2c3:
	.byte $E2, $1E, $00, $1E, $00, $82, $01, $1E, $1E, $1E, $1E, $1E, $1B, $82, $00, $1E, $1E, $1E, $1E, $84
	.byte $1A, $01, $1A, $01, $1A, $01, $80, $26, $15, $06, $8C, $01, $00, $20

; Bank 0
ft_s2p3c0:
	.byte $E7, $24, $00, $25, $04, $20, $00, $21, $04, $1E, $0D, $82, $01, $1B, $1C, $1E, $1C, $1B, $84, $19
	.byte $05, $17, $00, $18, $04, $14, $00, $15, $04, $14, $05, $0F, $00, $10, $02

; Bank 0
ft_s2p3c1:
	.byte $EA, $10, $05, $0D, $05, $82, $01, $19, $80, $22, $1C, $20, $21, $20, $84, $1E, $05, $EF, $1E, $03
	.byte $E1, $2A, $03, $82, $05, $EA, $13, $14, $15, $16, $84, $17, $01, $E1, $2A, $01

; Bank 0
ft_s2p4c0:
	.byte $E7, $24, $00, $25, $04, $82, $00, $1F, $7F, $1F, $7F, $1F, $7F, $84, $20, $0D, $82, $01, $80, $22
	.byte $1C, $1E, $1F, $20, $20, $84, $E7, $2A, $00, $2B, $04, $27, $00, $28, $04, $24, $00, $25, $04, $20
	.byte $00, $21, $04, $1F, $00, $20, $02

; Bank 0
ft_s2p4c1:
	.byte $EA, $10, $05, $0D, $05, $19, $0D, $82, $01, $80, $22, $2B, $2C, $2F, $31, $31, $82, $05, $EA, $13
	.byte $14, $15, $16, $84, $17, $03

; Bank 0
ft_s3_frames:
	.word ft_s3f0
	.word ft_s3f1
	.word ft_s3f2
	.word ft_s3f3
	.word ft_s3f4
ft_s3f0:
	.word ft_s0p0c4, ft_s0p0c4, ft_s0p0c4, ft_s3p2c3, ft_s0p0c4
ft_s3f1:
	.word ft_s3p0c0, ft_s3p0c1, ft_s3p0c2, ft_s3p0c3, ft_s0p0c4
ft_s3f2:
	.word ft_s3p1c0, ft_s3p1c1, ft_s3p1c2, ft_s3p0c3, ft_s0p0c4
ft_s3f3:
	.word ft_s3p0c0, ft_s3p0c1, ft_s3p5c2, ft_s3p0c3, ft_s0p0c4
ft_s3f4:
	.word ft_s3p1c0, ft_s3p1c1, ft_s3p6c2, ft_s3p4c3, ft_s0p0c4
; Bank 0
ft_s3p0c0:
	.byte $82, $05, $EA, $29, $25, $2C, $25, $27, $24, $2C, $84, $24, $04, $8C, $01, $00, $10

; Bank 0
ft_s3p0c1:
	.byte $00, $02, $82, $05, $EE, $29, $25, $2C, $25, $27, $24, $2C, $84, $24, $04, $8C, $01, $00, $0D

; Bank 0
ft_s3p0c2:
	.byte $E5, $22, $17, $20, $27

; Bank 0
ft_s3p0c3:
	.byte $E0, $11, $02, $E2, $20, $01, $20, $00, $20, $02, $20, $02, $80, $26, $16, $02, $E2, $20, $01, $20
	.byte $00, $20, $02, $20, $02, $E0, $11, $02, $E2, $20, $01, $20, $00, $20, $02, $20, $02, $80, $26, $16
	.byte $02, $E2, $20, $01, $20, $00, $20, $02, $20, $01, $20, $10

; Bank 0
ft_s3p1c0:
	.byte $82, $05, $EA, $25, $22, $29, $22, $24, $1F, $21, $84, $1D, $04, $8C, $01, $00, $10

; Bank 0
ft_s3p1c1:
	.byte $00, $02, $82, $05, $EE, $25, $22, $29, $22, $24, $1F, $21, $84, $1D, $04, $8C, $01, $00, $0D

; Bank 0
ft_s3p1c2:
	.byte $E5, $1E, $17, $1D, $27

; Bank 0
ft_s3p2c3:
	.byte $E2, $20, $02, $20, $01, $20, $00, $20, $02, $E3, $1C, $01, $8C, $01, $00, $34

; Bank 0
ft_s3p4c3:
	.byte $E0, $11, $02, $E2, $20, $01, $20, $00, $20, $02, $20, $02, $80, $26, $16, $02, $E2, $20, $01, $20
	.byte $00, $20, $02, $20, $02, $E0, $11, $02, $E2, $20, $01, $20, $00, $20, $02, $20, $02, $80, $26, $16
	.byte $02, $E2, $20, $01, $20, $00, $20, $02, $20, $01, $8A, $02, $20, $10

; Bank 0
ft_s3p5c2:
	.byte $E5, $22, $17, $23, $01, $E4, $24, $09, $E5, $27, $1B

; Bank 0
ft_s3p6c2:
	.byte $E5, $24, $01, $E4, $25, $09, $E5, $22, $0B, $24, $0B, $1D, $05, $21, $15


; DPCM samples (located at DPCM segment)
