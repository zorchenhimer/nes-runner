; asmsyntax=ca65

; Current note for each channel
Notes:          .res 5

; High and low bytes for notes for Pluse and
; Triangle channels. Fourth byte is ignored, lol.
Notes_LowByte:  .res 5
Notes_HighByte: .res 5

; Indexes for macros, per channel
Instr_VolLengths:   .res 5  ; current volume macro length
Instr_VolSteps:     .res 5  ; current volume macro index

Instr_ArpLengths:   .res 5  ; current volume macro length
Instr_ArpSteps:     .res 5  ; current volume macro index

Instr_Id:   .res 5

SndSeq_Active:  .res 5
SndSeq_Waiting: .res 5   ; Wait command countdown (noting between notes)

; Music sequence indexes (eg, for Song_A_ch2)
SndOrder_Index: .res 4

SndRerunBeat:   .res 1
