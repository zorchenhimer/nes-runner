; asmsyntax=ca65

;PAL Period Lookup Table.  Thanks Celius!
;http://www.freewebs.com/the_bott/NotesTablePAL.txt
note_table:
    ;      C      Db     D      Eb     E      F      Gb     G      Ab     A      Bb     B
    .word                                                                $0760, $06F6, $0692 ; A1-B1 ($00-$02)
    .word $0634, $05DB, $0586, $0537, $04EC, $04A5, $0462, $0423, $03E8, $03B0, $037B, $0349 ; C2-B2 ($03-$0E)
    .word $0319, $02ED, $02C3, $029B, $0275, $0252, $0231, $0211, $01F3, $01D7, $01BD, $01A4 ; C3-B3 ($0F-$1A)
    .word $018C, $0176, $0161, $014D, $013A, $0129, $0118, $0108, $00F9, $00EB, $00DE, $00D1 ; C4-B4 ($1B-$26)
    .word $00C6, $00BA, $00B0, $00A6, $009D, $0094, $008B, $0084, $007C, $0075, $006E, $0068 ; C5-B5 ($27-$32)
    .word $0062, $005D, $0057, $004E, $0049, $0045, $0045, $0041, $003E, $003A, $0037, $0034 ; C6-B6 ($33-$3E)
    .word $0031, $002E, $002B, $0029, $0026, $0024, $0022, $0020, $001E, $001D, $001B, $0019 ; C7-B7 ($3F-$4A)
    .word $0018, $0016, $0015, $0014, $0013, $0012, $0011, $0010, $000F, $000E, $000D, $000C ; C8-B8 ($4B-$56)
    .word $000B, $000B, $000A, $0009, $0009, $0008, $0008                                    ; C9-F#9 ($57-$5D)

;Note: octaves in music traditionally start at C, not A    
A1 = $00    ;the "1" means Octave 1
As1 = $01   ;the "s" means "sharp"
Bb1 = $01   ;the "b" means "flat"  A# == Bb, so same value
B1 = $02

C2 = $03
Cs2 = $04
Db2 = $04
D2 = $05
Ds2 = $06
Eb2 = $06
E2 = $07
F2 = $08
Fs2 = $09
Gb2 = $09
G2 = $0A
Gs2 = $0B
Ab2 = $0B
A2 = $0C
As2 = $0D
Bb2 = $0D
B2 = $0E

C3 = $0F
Cs3 = $10
Db3 = $10
D3 = $11
Ds3 = $12
Eb3 = $12
E3 = $13
F3 = $14
Fs3 = $15
Gb3 = $15
G3 = $16
Gs3 = $17
Ab3 = $17
A3 = $18
As3 = $19
Bb3 = $19
B3 = $1a

C4 = $1b
Cs4 = $1c
Db4 = $1c
D4 = $1d
Ds4 = $1e
Eb4 = $1e
E4 = $1f
F4 = $20
Fs4 = $21
Gb4 = $21
G4 = $22
Gs4 = $23
Ab4 = $23
A4 = $24
As4 = $25
Bb4 = $25
B4 = $26

C5 = $27
Cs5 = $28
Db5 = $28
D5 = $29
Ds5 = $2a
Eb5 = $2a
E5 = $2b
F5 = $2c
Fs5 = $2d
Gb5 = $2d
G5 = $2e
Gs5 = $2f
Ab5 = $2f
A5 = $30
As5 = $31
Bb5 = $31
B5 = $32

C6 = $33
Cs6 = $34
Db6 = $34
D6 = $35
Ds6 = $36
Eb6 = $36
E6 = $37
F6 = $38
Fs6 = $39
Gb6 = $39
G6 = $3a
Gs6 = $3b
Ab6 = $3b
A6 = $3c
As6 = $3d
Bb6 = $3d
B6 = $3e

C7 = $3f
Cs7 = $40
Db7 = $40
D7 = $41
Ds7 = $42
Eb7 = $42
E7 = $43
F7 = $44
Fs7 = $45
Gb7 = $45
G7 = $46
Gs7 = $47
Ab7 = $47
A7 = $48
As7 = $49
Bb7 = $49
B7 = $4a

C8 = $4b
Cs8 = $4c
Db8 = $4c
D8 = $4d
Ds8 = $4e
Eb8 = $4e
E8 = $4f
F8 = $50
Fs8 = $51
Gb8 = $51
G8 = $52
Gs8 = $53
Ab8 = $53
A8 = $54
As8 = $55
Bb8 = $55
B8 = $56

C9 = $57
Cs9 = $58
Db9 = $58
D9 = $59
Ds9 = $5a
Eb9 = $5a
E9 = $5b
F9 = $5c
Fs9 = $5d
Gb9 = $5d
