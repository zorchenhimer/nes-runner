; asmsyntax=ca65

; Title: Bad Apple
; Author: 
; Copyright: 
; Comment: A comment or something

sndIdx_Macro_Volume:
    .word sndMacro_00
    .word sndMacro_01
    .word sndMacro_02
    .word sndMacro_03
    .word sndMacro_04
    .word sndMacro_05
    .word sndMacro_06

sndMacro_00: .byte 45, $0F, $0F, $0E, $0E, $0D, $0D, $0C, $0C, $0C, $0C, $0B, $0B, $0A, $0A, $09, $09, $09, $08, $08, $07, $06, $05, $05, $04, $04, $03, $02, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
sndMacro_01: .byte 11, $0F, $0F, $0F, $0F, $0F, $0C, $0A, $09, $07, $04, $00
sndMacro_02: .byte 28, $0F, $05, $07, $08, $09, $08, $08, $07, $07, $06, $05, $04, $03, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
sndMacro_03: .byte 9, $00, $02, $04, $06, $08, $0A, $0C, $0E, $0F
sndMacro_04: .byte 11, $00, $08, $08, $08, $08, $08, $07, $06, $04, $02, $00
sndMacro_05: .byte 7, $00, $0F, $0F, $0F, $0F, $0F, $00
sndMacro_06: .byte 38, $0F, $0F, $0E, $0C, $0B, $09, $06, $04, $03, $04, $04, $05, $05, $05, $05, $05, $05, $05, $04, $04, $04, $03, $0A, $0A, $09, $09, $08, $07, $07, $06, $05, $05, $04, $02, $01, $01, $00, $00
sndIdx_Macro_Arpeggio:
    .word sndMacro_07

sndMacro_07: .byte 23, $00, $06, $07, $09, $0A, $0B, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
sndIdx_Macro_Pitch:
    .word sndMacro_08

sndMacro_08: .byte 17, $F8, $FA, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $03, $0B, $17, $28, $40
sndIdx_Macro_HiPitch:
    .word sndMacro_09

sndMacro_09: .byte 18, $17, $20, $2A, $30, $34, $36, $3E, $40, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00
sndIdx_Macro_Duty:
    .word sndMacro_10
    .word sndMacro_11
    .word sndMacro_12

sndMacro_10: .byte 2, $01, $02
sndMacro_11: .byte 1, $00
sndMacro_12: .byte 14, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00


sndIdx_Instruments:
    .word sndInstrument_00
    .word sndInstrument_01
    .word sndInstrument_02
    .word sndInstrument_03
    .word sndInstrument_04
    .word sndInstrument_05
    .word sndInstrument_06
    .word sndInstrument_07

; INST2A03 "Voice"
sndInstrument_00: .byte $00, $ff, $ff, $ff, $00
; INST2A03 "lead"
sndInstrument_01: .byte $01, $ff, $ff, $ff, $09
; INST2A03 "Perc"
sndInstrument_02: .byte $02, $ff, $ff, $ff, $ff
; INSTVRC6 "Useless"
sndInstrument_03: .byte $01, $ff, $ff, $ff, $00
; INSTVRC6 "Long lead"
sndInstrument_04: .byte $02, $ff, $ff, $ff, $01
; INST2A03 "lead2"
sndInstrument_05: .byte $04, $ff, $ff, $ff, $01
; INSTVRC6 "Useless2"
sndInstrument_06: .byte $03, $ff, $ff, $ff, $02
; INST2A03 "Perc"
sndInstrument_07: .byte $09, $ff, $ff, $ff, $ff

; Name: "New song"
; Speed: 6
; Tempo: 135
; Rows: 64

Pattern_Idx:
    .word Pattern_Idx_Ch00
    .word Pattern_Idx_Ch01
    .word Pattern_Idx_Ch02
    .word Pattern_Idx_Ch03
    .word Pattern_Idx_Ch04

Pattern_Idx_Ch00:
    .word pattern00_ch00
    .word pattern01_ch00
    .word pattern02_ch00
    .word pattern03_ch00
    .word pattern04_ch00
    .word pattern05_ch00
    .word pattern06_ch00
    .word pattern07_ch00
    .word pattern08_ch00
    .word pattern09_ch00
    .word pattern0A_ch00
    .word pattern0B_ch00
    .word pattern0C_ch00
    .word pattern0D_ch00
    .word pattern0E_ch00
    .word pattern0F_ch00
    .word pattern10_ch00
    .word pattern11_ch00

Pattern_Idx_Ch01:
    .word pattern00_ch01
    .word pattern01_ch01
    .word pattern02_ch01
    .word pattern03_ch01
    .word pattern04_ch01
    .word pattern05_ch01
    .word pattern06_ch01
    .word pattern07_ch01
    .word pattern08_ch01
    .word pattern09_ch01
    .word pattern0A_ch01
    .word pattern0B_ch01
    .word pattern0C_ch01
    .word pattern0D_ch01
    .word pattern0E_ch01
    .word pattern0F_ch01
    .word pattern10_ch01
    .word pattern11_ch01

Pattern_Idx_Ch02:
    .word pattern00_ch02
    .word pattern01_ch02
    .word pattern02_ch02
    .word pattern03_ch02
    .word pattern04_ch02
    .word pattern05_ch02
    .word pattern06_ch02
    .word pattern07_ch02
    .word pattern08_ch02
    .word pattern09_ch02
    .word pattern0A_ch02
    .word pattern0B_ch02
    .word pattern0C_ch02
    .word pattern0D_ch02
    .word pattern0E_ch02
    .word pattern0F_ch02
    .word pattern10_ch02
    .word pattern11_ch02

Pattern_Idx_Ch03:
    .word pattern00_ch03
    .word pattern01_ch03
    .word pattern02_ch03
    .word pattern03_ch03
    .word pattern04_ch03
    .word pattern05_ch03
    .word pattern06_ch03
    .word pattern07_ch03
    .word pattern08_ch03
    .word pattern09_ch03
    .word pattern0A_ch03
    .word pattern0B_ch03
    .word pattern0C_ch03
    .word pattern0D_ch03
    .word pattern0E_ch03
    .word pattern0F_ch03
    .word pattern10_ch03
    .word pattern11_ch03

Pattern_Idx_Ch04:
    .word pattern00_ch04
    .word pattern01_ch04
    .word pattern02_ch04
    .word pattern03_ch04
    .word pattern04_ch04
    .word pattern05_ch04
    .word pattern06_ch04
    .word pattern07_ch04
    .word pattern08_ch04
    .word pattern09_ch04
    .word pattern0A_ch04
    .word pattern0B_ch04
    .word pattern0C_ch04
    .word pattern0D_ch04
    .word pattern0E_ch04
    .word pattern0F_ch04
    .word pattern10_ch04
    .word pattern11_ch04

pattern00_ch00:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern00_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern00_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern00_ch03:
; 0 events
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern00_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern01_ch00:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern01_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern01_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern01_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern01_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern02_ch00:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_END


pattern02_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern02_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_END


pattern02_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern02_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern03_ch00:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_END


pattern03_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern03_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_END


pattern03_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern03_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern04_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern04_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs2 ;  G#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern04_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern04_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern04_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern05_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern05_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern05_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern05_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern05_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern06_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern06_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs2 ;  G#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern06_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern06_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern06_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern07_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern07_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern07_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern07_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern07_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern08_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern08_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs2 ;  G#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs2 ;  G#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern08_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern08_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern08_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern09_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F4 ;  F-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F4 ;  F-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern09_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs2 ;  G#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern09_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern09_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern09_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0A_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0A_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0A_ch02:
; 0 events
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END


pattern0A_ch03:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0A_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0B_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F4 ;  F-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F4 ;  F-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0B_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0B_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0B_ch03:
; 0 events
    .byte MIDI_SET_INSTR|7
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$04 ;  4-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0B_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0C_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, D4 ;  D-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D4 ;  D-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0C_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, C4 ;  C-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, C4 ;  C-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, C3 ;  C-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D4 ;  D-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G4 ;  G-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0C_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0C_ch03:
; 0 events
    .byte MIDI_SET_INSTR|7
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0C_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0D_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, D4 ;  D-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D4 ;  D-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0D_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, C4 ;  C-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, C4 ;  C-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E4 ;  E-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A3 ;  A-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, G3 ;  G-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0D_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0D_ch03:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0D_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0E_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_END


pattern0E_ch01:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, A2 ;  A-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_END


pattern0E_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0E_ch03:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0E_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0F_ch00:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0F_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_PLAY_NOTE, B2 ;  B-2 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0F_ch02:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_PLAY_NOTE, E3 ;  E-3 00 . ... 
    .byte MIDI_END


pattern0F_ch03:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern0F_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern10_ch00:
; 0 events
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F4 ;  F-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F4 ;  F-4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern10_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern10_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern10_ch03:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern10_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern11_ch00:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern11_ch01:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern11_ch02:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern11_ch03:
; 0 events
    .byte MIDI_SET_INSTR|7
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$02 ;  2-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_NOISE|$08 ;  8-# 07 . ... 
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


pattern11_ch04:
; 0 events
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_WAIT|0
    .byte MIDI_END


Orders:
    .word Order_00
    .word Order_01
    .word Order_02
    .word Order_03
    .word Order_04

Order_00: .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $08, $09, $0A, $0A, $0A, $10, $02, $03, $06, $07, $06, $07, $08, $08, $08, $09, $0A, $0A, $0A, $0B, $0C, $0C, $0C, $0D, $0E, $0F
Order_01: .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $08, $09, $0A, $0A, $0A, $10, $02, $03, $06, $07, $06, $07, $08, $08, $08, $09, $0A, $0A, $0A, $0B, $0C, $0C, $0C, $0D, $0E, $0F
Order_02: .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $08, $09, $0B, $0B, $0B, $11, $02, $03, $06, $07, $06, $07, $08, $08, $08, $09, $0B, $0B, $0B, $0C, $0D, $0D, $0D, $0E, $0F, $10
Order_03: .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $08, $09, $0B, $0B, $0B, $11, $02, $03, $06, $07, $06, $07, $08, $08, $08, $09, $0B, $0B, $0B, $0C, $0D, $0D, $0D, $0E, $0F, $10
Order_04: .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $08, $09, $0A, $0A, $0A, $10, $02, $03, $06, $07, $06, $07, $08, $08, $08, $09, $0A, $0A, $0A, $0B, $0C, $0C, $0C, $0D, $0E, $0F

SONG_LENGTH = 194
