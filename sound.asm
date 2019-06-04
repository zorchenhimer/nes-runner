; asmsyntax=ca65

Sound_Init:
    ; Enable use channels
    lda #%00001111
    sta $4015

    ; Disable length counter
    lda #$7F
    sta Pulse1_DutyVolume
    sta Pulse2_DutyVolume

    ; Clear buffers
    lda #00
    sta Pulse1_4001
    sta Pulse1_TimerLow
    sta Pulse1_TimerHigh

    sta Pulse2_4005
    sta Pulse2_TimerLow
    sta Pulse2_TimerHigh

    sta Triangle_Counter
    sta Triangle_TimerLow
    sta Triangle_TimerHigh

    sta Noise_EnvVolume
    sta Noise_Period
    sta Noise_Length

    ; DMC channel.  Unused, just turn everything off.
    sta $4010
    sta $4011
    sta $4012
    sta $4013

    lda #TICKS_PER_BEAT
    sta SndBeat ; for music
    sta SfxBeat ; for sound effects

    ; Clear indexes and stuff
    ldx #4
@clr_loop:
    lda #0
    sta Notes, x

    sta Instr_VolLengths, x
    sta Instr_VolSteps, x

    sta Instr_ArpLengths, x

    sta SndSeq_Active, x
    sta SndSeq_Waiting, x

    lda #1
    sta Instr_VolSteps, x
    sta Instr_ArpSteps, x

    dex
    bpl @clr_loop

    rts

Sound_WriteBuffers:

    ; Write the two Pulse channels
    lsr SndPulseFlags
    bcc :+
    lda Pulse1_DutyVolume
    ora #$30
    sta $4000

:   lsr SndPulseFlags
    bcc :+
    lda Pulse1_4001
    sta $4001

:   lsr SndPulseFlags
    bcc :+
    lda Pulse1_TimerLow
    sta $4002

:   lsr SndPulseFlags
    bcc :+
    lda Pulse1_TimerHigh
    sta $4003

    ; Pulse 2
:   lsr SndPulseFlags
    bcc :+
    lda Pulse2_DutyVolume
    ora #$30
    sta $4004

:   lsr SndPulseFlags
    bcc :+
    lda Pulse2_4005
    sta $4005

:   lsr SndPulseFlags
    bcc :+
    lda Pulse2_TimerLow
    sta $4006

:   lsr SndPulseFlags
    bcc :+
    lda Pulse2_TimerHigh
    sta $4007
:

    ; Triangle stuff
    lsr SndTriNoiseFlags
    bcc :+
    lda Triangle_Counter
    sta $4008
:

    lsr SndTriNoiseFlags ; Unused $4009
    lsr SndTriNoiseFlags
    bcc :+
    lda Triangle_TimerLow
    sta $400A
:

    lsr SndTriNoiseFlags
    bcc :+
    lda Triangle_TimerHigh
    sta $400B
:

    lsr SndTriNoiseFlags
    bcc :+
    lda Noise_EnvVolume
    ora #$30
    sta $400C
:

    lsr SndTriNoiseFlags ; Unused $400D
    lsr SndTriNoiseFlags
    bcc :+
    lda Noise_Period
    sta $400E
:

    lsr SndTriNoiseFlags
    bcc :+
    lda Noise_Length
    sta $400F
:

    ; Clear the rest of the flags (ignore noise for now)
    lda #0
    sta SndTriNoiseFlags

    rts

Sound_RunFrame:
    ; TODO: remove this
    lda #BUTTON_SELECT
    jsr ButtonPressedP1
    beq @topOfBeat

    jsr LoadSong

@topOfBeat:
    jsr RunBeat

    ; Only set when decoding a MIDI_END op code
    bit SndRerunBeat
    bpl @noRerun
    lda #0
    sta SndRerunBeat
    lda #1
    sta SndBeat
    jmp @topOfBeat
@noRerun:

    jsr RunSfxBeat
    jsr RunVolumeEnvelope
    jsr RunArpeggio

    rts

RunBeat:
    ; Check for music beat
    dec SndBeat
    bne @noBeat
    ; Load next command if beat triggers

    lda #TICKS_PER_BEAT
    sta SndBeat

    ldy #0
    sty TmpY

@seqDecodeLoop:
    lda SndSeq_Active, y
    beq @notActive
    sty TmpChanId

    lda SndSeq_Waiting, y
    beq :+
    ldx TmpChanId
    dec SndSeq_Waiting, x
    jmp @notActive
:
    jsr DecodeSequenceCommand
@notActive:
    inc TmpY
    ldy TmpY
    cpy #4
    bne @seqDecodeLoop

    nop
@noBeat:
    rts

RunSfxBeat:
    lda SndSeq_Active+4 ; SFX channel
    bne :+

    ; Reset beat if sfx is not playing
    lda #0
    sta SfxBeat
    rts
:
    ; decrement beat. counter
    dec SfxBeat
    bmi :+
    rts

:   ldy #4
    sty TmpChanId
    jmp DecodeSequenceCommand

RunVolumeEnvelope:
    ldx #0  ; Channel ID
    stx TmpChanId
@RunEnvelopeLoop:
    ; Check length of volume macro
    lda Instr_VolLengths, x
    sec
    sbc Instr_VolSteps, x
    bmi @skipLoop    ; don't read data past the end

    inc Instr_VolSteps, x

    ; ID -> offset
    txa
    asl a
    sta TmpChanOffset

    ;ldx TmpChanId   ; Source channel
    ldy TmpChanId   ; Real channel
    jsr sndGetRealChannel

    cpx #2
    bne @notTri

    ; Triangle has no volume, only on/off
    ldx TmpChanOffset
    lda (SndPointer_VolMacro, x)
    beq :+

    ; Channel is on
    lda #$FF
    sta Triangle_Counter
    jmp @loopNext
:
    ; Mute channel
    lda #$00
    sta Triangle_Counter

    ; Set triangle update flags
    lda SndTriNoiseFlags
    ora #%00000001
    sta SndTriNoiseFlags
    jmp @loopNext

@notTri:
    cpx #3
    bne @notNoise

    ; Set noise update flags
    lda SndTriNoiseFlags
    ora #%10110000
    sta SndTriNoiseFlags
    jmp @pulseNoiseVol

@notNoise:
    lda SndPulseFlags
    ora #SND_PULSE1_UPDATE_DV|SND_PULSE2_UPDATE_DV
    sta SndPulseFlags

@pulseNoiseVol:
    ldy TmpChanId
    ; Clear volume bits, keeping Duty and Constant Volume bits

    jsr sndGetRealChannel
    sty TmpChanIdReal

    ; ID -> offset
    ldx TmpChanOffset

    ; Load old value
    lda Pulse1_DutyVolume, y
    ; Clear the low bits
    and #$F0
    ; OR it with the new value
    ora (SndPointer_VolMacro, x)
    ; Save it again
    sta Pulse1_DutyVolume, y

@loopNext:
    ldx TmpChanOffset
    inc SndPointer_VolMacro, x
    bne :+
    inc SndPointer_VolMacro+1, x
:

@skipLoop:
    inc TmpChanId
    ldx TmpChanId
    cpx #5
    bne @RunEnvelopeLoop
    rts

RunArpeggio:
    ldy #0
    sty TmpChanId
@loop:
    ; Check length of macro
    lda Instr_ArpLengths, y
    sec
    sbc Instr_ArpSteps, y
    bmi @loopSkip

    tya
    tax
    inc Instr_ArpSteps, x

    ; Channel ID -> word offset
    tya
    asl a
    tax

    lda Notes, y
    clc
    adc (SndPointer_ArpMacro, x)
    inc SndPointer_ArpMacro, x
    asl a
    tax ; new note offset

    ; Determine if it's a noise channel
    jsr sndGetRealChannel

    cpy #3
    beq @itsNoise

    ; Load note and apply arpeggio delta
    lda note_table, x
    sta Pulse1_TimerLow, y

    ; Again for the note high bits.  Keep the
    ; high bits of the register.
    lda Pulse1_TimerHigh, y
    and #$F8
    ora note_table+1, x
    sta Pulse1_TimerHigh, y

@loopNext:
    lda #$0D
    jsr UpdateChannelFlags

@loopSkip:
    inc TmpChanId
    ldy TmpChanId
    cpy #5
    bne @loop
    rts

@itsNoise:
    ; It's just a value, not a note.
    and #$0F
    sta Noise_Period
    jmp @loopNext

; Flags in A's low bits
; Channel ID in Y
UpdateChannelFlags:
    and #$0F

    cpy #2
    bcc @pulse

    ; Noise
    asl a
    asl a
    asl a
    asl a

@notNoise:
    ; Triangle (+ noise)
    ora SndTriNoiseFlags
    sta SndTriNoiseFlags
    rts

@pulse:
    cpy #1
    bne @pulse0

    ; Pulse 2
    asl a
    asl a
    asl a
    asl a

@pulse0:
    ; Pulse 1 (+ pulse 2)
    ora SndPulseFlags
    sta SndPulseFlags
    rts

; TODO: this. it's broken (end of sequence breaks)
LoadSong:
    lda #0
    ldx #0
@loop:
    sta SndOrder_Index, x
    inx
    cpx #4
    bne @loop

    ldx #0
    jsr UpdateSequences

    ldx #1
    jsr UpdateSequences

    ldx #2
    jsr UpdateSequences

    ldx #3
    jmp UpdateSequences

; Load up individual sequences
; Channel ID in X
UpdateSequences:
    ; Find the sequences

;    ldx #0  ; channel ID
    stx TmpX
;@loop:
    ldy SndOrder_Index, x

    ; Channel ID -> offset
    lda TmpX
    asl a
    tax

    ; Pattern Index -> TmpAddr2
    lda Pattern_Idx, x
    sta TmpAddr2
    lda Pattern_Idx+1, x
    sta TmpAddr2+1

    ; load channel order index table pointer
    lda Orders, x
    sta TmpAddress
    lda Orders+1, x
    sta TmpAddress+1

    ; load ID of current pattern
    lda (TmpAddress), y

    ; ID -> offset
    asl a
    tay

    ; Pattern pointer

    lda (TmpAddr2), y
    sta SndPointer_Sequence, x
    iny
    lda (TmpAddr2), y
    sta SndPointer_Sequence+1, x

    ldx TmpX
    lda #1
    sta SndSeq_Active, x

    ;inc TmpX
    ;ldx TmpX
    ;cpx #4
    ;bne @loop
    rts

; Sequence ID in A
; Channel ID in Y
;LoadSfx:
;    ; ID -> word offset
;    asl a
;    tax
;
;    tya
;    pha
;    asl a
;    tay
;
;    lda Pattern_Idx, x
;    sta SndPointer_Sequence, y
;    lda Pattern_Idx+1, x
;    sta SndPointer_Sequence+1, y
;
;    pla
;    tay
;
;    lda #1
;    sta SndSeq_Active, y
;
;    rts

; Load the next command in the sequence, and execute it.
; Channel ID in TmpChanId
DecodeSequenceCommand:
    ldy TmpChanId

    ; ID -> word offset
    tya
    asl a
    tax
    sta TmpChanOffset

    ; Lookup the pointer in the table
    lda (SndPointer_Sequence, x)

    ; Shift by three and not for because we're
    ; using it as the index to a word lookup
    lsr a
    lsr a
    lsr a

    ; Mask off the last bit that could be
    ; left over from the shift
    and #$0E

    tay
    lda LookupDecoding, y
    sta TmpAddress
    lda LookupDecoding+1, y
    sta TmpAddress+1

    jmp (TmpAddress)

DecodeWait:
    ldx TmpChanOffset
    lda (SndPointer_Sequence, X)
    and #$0F
    sec
    sbc #1

    ; Check for underflow
    bpl :+
    lda #0
:
    ldy TmpChanId
    sta SndSeq_Waiting, y
    jmp IncrSequencePointer

; Increment a sequence's pointer
IncrSequencePointer:
    ldx TmpChanOffset
    inc SndPointer_Sequence, x
    bne :+
    inc SndPointer_Sequence+1, x
:
    rts

DecodePlayNote:
    ldy TmpChanId
    ldx Instr_Id, y
    jsr LoadInstrument

    jsr IncrSequencePointer

    ldx TmpChanOffset
    lda (SndPointer_Sequence, x)
    ldy TmpChanId

    jsr LoadNote
    jmp IncrSequencePointer

DecodeSetInstrument:
    ldx TmpChanOffset
    lda (SndPointer_Sequence, x)
    and #$0F

    ldx TmpChanId
    sta Instr_Id, x

    jsr IncrSequencePointer

    ; Decode next command
    jmp DecodeSequenceCommand

DecodeMute:
    ; TODO
    jmp IncrSequencePointer

DecodeEnd:
    ldx TmpChanId
    inc SndOrder_Index, x

    lda SndOrder_Index, x
    cmp #SONG_LENGTH
    bne :+
    lda #0
    sta SndOrder_Index
:

    lda #$FF
    sta SndRerunBeat

    jmp UpdateSequences
    ;jmp IncrSequencePointer
    ;jmp DecodeSequenceCommand

DecodeNoise:
    ldy TmpChanId
    ldx Instr_Id, y
    jsr LoadInstrument

    ldx TmpChanOffset
    lda (SndPointer_Sequence, x)

    and #$0F
    sta Noise_Period
    sta Notes, y

    lda #%01000000
    ora SndTriNoiseFlags
    sta SndTriNoiseFlags

    jmp IncrSequencePointer

LookupDecoding:
    .word DecodePlayNote
    .word DecodeSetInstrument
    .word DecodeWait
    .word DecodeMute
    .word DecodeEnd
    .word DecodeNoise

; Y holds the channel ID: 0- Pulse 1, 1- Pulse 2, etc
; X holds the new instrument ID
LoadInstrument:
    ; Instrument ID to lookup offset
    txa
    asl a
    tax

    sty TmpChanId    ; save Y for later

    ; Channel ID to offset
    tya
    asl a
    tay
    sty TmpChanOffset

    ; Load pointer to instrument macro definitions
    lda sndIdx_Instruments, x
    sta SndPointer_Instrument, y    ; storing eg snd_inst_Voice
    lda sndIdx_Instruments+1, x
    sta SndPointer_Instrument+1, y

    ldy TmpChanId ; restore Y
    ldx TmpChanOffset   ; channel offset in X
    lda (SndPointer_Instrument, x) ; Load the volume macro ID

    ; vol macro ID -> word offset
    asl a
    tax

    ; Channel ID to offset
    ldy TmpChanOffset

    ; Load up the pointer to the volume macro
    lda sndIdx_Macro_Volume, x
    sta SndPointer_VolMacro, y
    sta TmpAddress
    lda sndIdx_Macro_Volume+1, x
    sta SndPointer_VolMacro+1, y
    sta TmpAddress+1

    ; Load and save the length of the volume macro
    ldx TmpChanId
    ldy #0

    ;lda (SndPointer_VolMacro, x)
    lda (TmpAddress), y
    sec
    sbc #1
    sta Instr_VolLengths, x

    ; move the pointer to the start of the data
    ldx TmpChanOffset
    inc SndPointer_VolMacro, x
    bne :+
    inc SndPointer_VolMacro+1, x
:
    ; Reset steps to the beginning
    ldy TmpChanId
    lda #0
    sta Instr_VolSteps, y

    ; Arpeggio
    inc SndPointer_Instrument, x
    bne :+
    inc SndPointer_Instrument+1, x
:

    lda (SndPointer_Instrument, x)
    cmp #$FF
    beq @noArpeggio

    asl a
    tax ; instrument offset
    ldy TmpChanOffset

    ; Load arpeggio pointer
    lda sndIdx_Macro_Arpeggio, x
    sta SndPointer_ArpMacro, y
    lda sndIdx_Macro_Arpeggio+1, x
    sta SndPointer_ArpMacro+1, y


    ; Load the macro length and reset steps
    ldx TmpChanOffset
    lda (SndPointer_ArpMacro, x)
    ldy TmpChanId
    sta Instr_ArpLengths, y
    lda #0
    sta Instr_ArpSteps, y

    ; Increment the pointer past the length
    inc SndPointer_ArpMacro, x
    bne :+
    inc SndPointer_ArpMacro+1, x
:

@noArpeggio:
    jsr sndGetRealChannel
    cpy #2
    bcs @triNoiseFlags

    ; Load the volume mask, and apply it
    lda SndPulseFlags
    ora snd_update_masks, y
    sta SndPulseFlags
    rts

@triNoiseFlags:
    cpy #3
    beq @tri
    lda #%00001101
    ora SndTriNoiseFlags
    sta SndTriNoiseFlags
    rts

@tri:
    lda #%11010000
    ora SndTriNoiseFlags
    sta SndTriNoiseFlags
    rts

; Incoming channel ID in Y
; Normalized to 0-3
sndGetRealChannel:
    cpy #4
    bcc :+
    dey
    dey
    dey
    dey
    jmp sndGetRealChannel
:
    rts

; Y holds the channel ID: 0- Pulse 1, 1- Pulse 2, etc
; A holds the note
LoadNote:
    ; Store the note ID for later
    sta Notes, y
    asl a   ; Note ID -> word offset
    tax

    ; Save some channel stuff for later
    sty TmpChanId
    tya
    asl a   ; Channel ID -> word offset
    sta TmpChanOffset

    ; Lookup note in word table
    lda note_table, x

    ; Save value
    sta Notes_LowByte, y

    jsr sndGetRealChannel
    sta Pulse1_TimerLow, y ; TODO: move this to engine run loop

    ;ldy TmpChanId
    lda Pulse1_TimerHigh, y
    and #$F8
    ora note_table+1, x
    sta Notes_HighByte, y
    sta Pulse1_TimerHigh, y

    jsr sndGetRealChannel
    cpy #2
    beq @triFlags

    ; Pulse 1, volume
    lda SndPulseFlags
    ora snd_update_masks, y
    sta SndPulseFlags
    rts

@triFlags:
    lda #$FF
    sta Triangle_Counter

    lda #$80
    ora Triangle_TimerHigh
    sta Triangle_TimerHigh

    lda #%00001101
    sta SndTriNoiseFlags
    rts

snd_update_masks:
    .byte %00001101    ; Pulse 1
    .byte %11010000    ; Pulse 2

