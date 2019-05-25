; asmsyntax=ca65

; Current note for each channel
Notes:          .res 5

; High and low bytes for notes for Pluse and
; Triangle channels. Fourth byte is ignored, lol.
Notes_LowByte:  .res 5
Notes_HighByte: .res 5

; Indexes for macros, per channel
Instr_Volumes:      .res 5  ; Volume macro index
Instr_VolLengths:   .res 5  ; current volume macro length
Instr_VolSteps:     .res 5  ; current volume macro index

Instr_Arpeggio: .res 5
Instr_Pitch:    .res 5
Instr_HiPitch:  .res 5
Instr_Duty:     .res 5

; These aren't gonna work. Each macro (on the same instrument)
; can be a different length.
;Instr_Macro:    .res 4  ; index of current macro
;Instr_MacroLen: .res 4  ; length of current macro
;Instr_Macro_Frame:  .res 4  ; index of value in current macro
Instr_Id:   .res 5

SndSeq_Active:  .res 5
SndSeq_Waiting: .res 5
