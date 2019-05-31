; asmsyntax=ca65

snd_lookup_instruments:
    .word snd_inst_Voice
    .word snd_inst_lead
    .word snd_inst_Perc

    .word sfxInstrument_00
    .word sfxInstrument_01

snd_inst_Voice:
    .byte 0     ; Volume
    .byte 255   ; Arpeggio
    .byte 255   ; Pitch
    .byte 255   ; Hi-pitch
    .byte 0   ; Duty / Noise

snd_inst_lead:
    .byte 1     ; Volume
    .byte 255   ; Arpeggio
    .byte 255   ; Pitch
    .byte 255   ; Hi-pitch
    .byte 2     ; Duty / Noise

snd_inst_Perc:
    .byte $02
    .byte $FF
    .byte $FF
    .byte $FF
    .byte $FF

; INST2A03 "Jump Up"
sfxInstrument_00:
    .byte $03
    .byte $00
    .byte $FF
    .byte $FF
    .byte $FF

; INST2A03 "Fall Down"
sfxInstrument_01:
    .byte $03
    .byte $01
    .byte $FF
    .byte $FF
    .byte $FF

snd_macros_Volume:
    .word snd_macros_Volume_00
    .word snd_macros_Volume_01
    .word snd_macros_Perc
    .word sfxMacro_00

snd_macros_Volume_00:
    ; Length of the following byte list, excluding the stored length value
    .byte (snd_macros_Volume_00_end - snd_macros_Volume_00) - 1

    .byte 15, 15, 14, 14, 13, 13, 12, 12, 12, 12, 11
    .byte 11, 10, 10, 9, 9, 9, 8, 8, 7, 6, 5, 5, 4, 4
    .byte 3, 2, 1, 1, 0, 0
snd_macros_Volume_00_end:

snd_macros_Volume_01:
    .byte (snd_macros_Volume_01_end - snd_macros_Volume_01) - 1

    .byte 15, 15, 15, 15, 15, 12, 10, 9, 7, 4, 0, 0
snd_macros_Volume_01_end:

snd_macros_Perc:
    .byte 28
    .byte $0F, $05, $07, $08, $09, $08, $08, $07, $07, $06
    .byte $05, $04, $03, $02, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $00, $00, $00

; Volume macro for the SFX
sfxMacro_00:
    .byte 10
    .byte $01, $04, $07, $09, $0B, $0D, $0E, $0F, $0F, $00

snd_macros_Arpeggio:
    .word sfxMacro_01
    .word sfxMacro_02

; Arpeggio macros for the SFX
sfxMacro_01:
    .byte 11
    .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A
sfxMacro_02:
    .byte 11
    .byte $00, $FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6


; List of sequences
Song_A:
    .word sfx_jump
    .word sfx_fall

    .word Seq_A
    .word Seq_B
    .word Seq_Noise

    .word pattern04_ch00
    .word pattern04_ch01
    .word pattern04_ch02
    .word pattern04_ch03

; Sequence definitions
Seq_A:
; ROW 00
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 04
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Cs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Ds3
; ROW 09
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 0C
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Cs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Ds3
; ROW 11
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 14
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Cs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 19
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Gs4
; ROW 1D
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs4
    .byte MIDI_PLAY_NOTE, Gs4
    .byte MIDI_PLAY_NOTE, Ds3
; ROW 21
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 24
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Cs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Ds3
; ROW 2
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 2C
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Cs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Ds3
; ROW 31
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3
    .byte MIDI_PLAY_NOTE, Ds4
; ROW 34
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Cs4
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Gs4
; ROW 39
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs4
    .byte MIDI_PLAY_NOTE, Gs4
    .byte MIDI_PLAY_NOTE, Fs4
; ROW 3D
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4
    .byte MIDI_PLAY_NOTE, Fs4

    .byte MIDI_END

Seq_B:
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, D4,  MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, E4,  MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, Fs4, MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, G4,  MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, A5,  MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, B5,  MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, Cs5, MIDI_WAIT|2
    .byte MIDI_PLAY_NOTE, D5,  MIDI_WAIT|2
    .byte MIDI_END

Seq_Noise:
    .byte MIDI_SET_INSTR|2
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_END

sfx_jump:
    .byte MIDI_SET_INSTR|3
    .byte MIDI_PLAY_NOTE, A3 ;  E-3 00 . ... 
    .byte MIDI_END

sfx_fall:
    .byte MIDI_SET_INSTR|4
    .byte MIDI_PLAY_NOTE, G4 ;  E-3 01 . ... 
    .byte MIDI_END

pattern04_ch00:
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, Gs3 ;  G#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, D3 ;  D-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_END

pattern04_ch01:
    .byte MIDI_SET_INSTR|0
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs3 ;  F#3 00 . ... 
    .byte MIDI_WAIT|3
    .byte MIDI_PLAY_NOTE, F3 ;  F-3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs3 ;  C#3 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, As2 ;  A#2 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Gs2 ;  G#2 00 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 00 . ... 
    .byte MIDI_END

pattern04_ch02:
    .byte MIDI_SET_INSTR|1
    .byte MIDI_PLAY_NOTE, Ds3 ;  D#3 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, As3 ;  A#3 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, B3 ;  B-3 01 . ... 
    .byte MIDI_PLAY_NOTE, Cs4 ;  C#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Ds4 ;  D#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_PLAY_NOTE, Fs4 ;  F#4 01 . ... 
    .byte MIDI_PLAY_NOTE, Gs4 ;  G#4 01 . ... 
    .byte MIDI_END

pattern04_ch03:
    .byte MIDI_SET_INSTR|0
    .byte MIDI_NOISE|$00 ;  0-# 00 . ... 
    .byte MIDI_SET_INSTR|2
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$00 ;  0-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$0B ;  B-# 02 . ... 
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_WAIT|1
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
    .byte MIDI_END


