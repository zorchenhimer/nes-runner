; asmsyntax=ca65

snd_lookup_instruments:
    .word snd_inst_Voice
    .word snd_inst_lead
    .word snd_inst_Perc
    ;.word snd_inst_Useless
    ;.word snd_inst_LongLead
    ;.word snd_inst_lead2
    ;.word snd_inst_Useless2
    ;.word snd_inst_Perc2

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

snd_macros_Volume_count = snd_macros_Volume - snd_macros_Volume_00
snd_macros_Volume:
    .word snd_macros_Volume_00
    .word snd_macros_Volume_01
    .word snd_macros_Perc

snd_macros_Volume_00:
    ; Length of the following byte list, excluding the stored length value
    .byte (snd_macros_Volume_00_end - snd_macros_Volume_00) - 1

    .byte 15, 15, 14, 14, 13, 13, 12, 12, 12, 12, 11
    .byte 11, 10, 10, 9, 9, 9, 8, 8, 7, 6, 5, 5, 4, 4
    .byte 3, 2, 1, 1, 0
snd_macros_Volume_00_end:

snd_macros_Volume_01:
    .byte (snd_macros_Volume_01_end - snd_macros_Volume_01) - 1

    .byte 15, 15, 15, 15, 15, 12, 10, 9, 7, 4, 0
snd_macros_Volume_01_end:

snd_macros_Perc:
    .byte 28
    .byte $0F, $05, $07, $08, $09, $08, $08, $07, $07, $06
    .byte $05, $04, $03, $02, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $00, $00, $00

snd_macros_Duty_count = snd_macros_Duty - snd_macros_Duty_00
snd_macros_Duty:
    .word snd_macros_Duty_00
    .word snd_macros_Duty_01
    .word snd_macros_Duty_09

snd_macros_Duty_00:
    .byte (snd_macros_Duty_00_end - *) - 1
    .byte 1, 2
snd_macros_Duty_00_end:

snd_macros_Duty_01:
    .byte (snd_macros_Duty_01_end - *) - 1
    .byte 0
snd_macros_Duty_01_end:

snd_macros_Duty_09:
    .byte (snd_macros_Duty_09_end - *) - 1
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0
snd_macros_Duty_09_end:

; List of sequences
Song_A:
    .word Seq_A
    .word Seq_B
    .word Seq_Noise

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
    .byte MIDI_NOISE|$02 ;  2-# 02 . ... 
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

; [...]
