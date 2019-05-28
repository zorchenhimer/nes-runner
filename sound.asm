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
    lda #0
@clr_loop:
    sta Notes, x

    sta Instr_Volumes, x
    sta Instr_Arpeggio, x
    sta Instr_Pitch, x
    sta Instr_HiPitch, x
    sta Instr_Duty, x

    ;sta Instr_Macro, x
    ;sta Instr_MacroLen, x
    ;sta Instr_Macro_Frame, x

    sta SndSeq_Active, x
    sta SndSeq_Waiting, x

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
    beq :+

    lda #5
    ldy #0
    jsr LoadSequence

    lda #6
    ldy #1
    jsr LoadSequence

    lda #7
    ldy #2
    jsr LoadSequence

    lda #8
    ldy #3
    jsr LoadSequence

:
    jsr RunBeat
    jsr RunSfxBeat
    jsr RunVolumeEnvelope

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
    bmi @loopNext    ; don't read data past the end

    ; Load volume macro pointer
    stx TmpChanId    ; Save orig value for later
    txa
    asl a       ; ID -> word offset
    tax

    lda SndPointer_VolMacro, x
    sta TmpAddress
    lda SndPointer_VolMacro+1, x
    sta TmpAddress+1

    ldx TmpChanId
    ldy TmpChanId
    jsr sndGetRealChannel

    ; Clear volume bits, keeping Duty and Constant Volume bits
    lda #$F0
    and Pulse1_DutyVolume, y

    cpx #2
    bne @notTri

    ; Triangle specific stuff
    ldy Instr_VolSteps+2
    inc Instr_VolSteps+2

    ; Triangle has no volume, only on/off
    lda (TmpAddress), y
    beq :+

    ; Channel is on
    jmp @loopNext
:
    ; Mute channel
    lda #$00
    sta Triangle_Counter

    ; Set triangle update flags
    lda SndTriNoiseFlags
    ora #%00000001
    sta SndTriNoiseFlags

@notTri:
    cpx #3
    bne @notNoise

    ; Set noise update flags
    lda SndTriNoiseFlags
    ora #%00010000
    sta SndTriNoiseFlags

@notNoise:
    ldy TmpChanId
    jsr sndGetRealChannel
    sty TmpChanIdReal

    ldy Instr_VolSteps, x
    inc Instr_VolSteps, x

    ; OR volume bits onto DutyVolume variable
    ora (TmpAddress), y
    ldx TmpChanIdReal
    sta Pulse1_DutyVolume, x

    lda SndPulseFlags
    ora #SND_PULSE1_UPDATE_DV|SND_PULSE2_UPDATE_DV
    sta SndPulseFlags

@loopNext:
    inc TmpChanId
    ldx TmpChanId
    cpx #5
    bne @RunEnvelopeLoop
    rts

; Sequence ID in A
; Channel ID in Y
LoadSequence:
    ; ID -> word offset
    asl a
    tax

    tya
    pha
    asl a
    tay

    lda Song_A, x
    sta SndPointer_Sequence, y
    lda Song_A+1, x
    sta SndPointer_Sequence+1, y

    pla
    tay

    lda #1
    sta SndSeq_Active, y

    rts

; Load the next command in the sequence, and execute it.
; Channel ID in Y
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
    lda #0
    sta SndSeq_Active, x
    jmp IncrSequencePointer

DecodeNoise:
    ldy TmpChanId
    ldx Instr_Id, y
    jsr LoadInstrument

    ldx TmpChanOffset
    lda (SndPointer_Sequence, x)

    and #$0F
    sta Noise_Period

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
    lda snd_lookup_instruments, x
    sta SndPointer_Instrument, y    ; storing eg snd_inst_Voice
    lda snd_lookup_instruments+1, x
    sta SndPointer_Instrument+1, y

    ldy TmpChanId ; restore Y
    ldx TmpChanOffset   ; channel offset in X
    lda (SndPointer_Instrument, x) ; Load the volume macro ID
    sta Instr_Volumes, y

    ; vol macro ID -> word offset
    asl a
    tax

    ; Channel ID to offset
    ldy TmpChanOffset

    ; Load up the pointer to the volume macro
    lda snd_macros_Volume, x
    sta SndPointer_VolMacro, y
    sta TmpAddress
    lda snd_macros_Volume+1, x
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

    ; Reset steps to the beginning
    ldy TmpChanId
    lda #0
    sta Instr_VolSteps, y

    jsr sndGetRealChannel
    cpy #2
    bcs @triNoiseFlags

    ; Word offset -> mask offset
    tya
    asl a
    asl a
    tax

    ; Load the volume mask, and apply it
    lda SndPulseFlags
    ora snd_update_masks, x
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

    ldy TmpChanId
    lda Pulse1_TimerHigh, y
    and #$F8
    ora note_table+1, x
    sta Notes_HighByte, y

    jsr sndGetRealChannel
    sta Pulse1_TimerHigh, y ; TODO: move this to engine run loop

    cpy #2
    beq @triFlags

    ; Channel ID -> mask offset
    tya
    asl a
    asl a
    tax

    ; Pulse 1, volume
    lda SndPulseFlags
    ora snd_update_masks, x

    ; Pulse 1, tone low byte
    inx
    inx
    ora snd_update_masks, x

    ; Pulse 1, tone high byte
    inx
    ora snd_update_masks, x
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
    .byte %00000001    ; Pulse 1, volume
    .byte %00000010    ; Pulse 1, Sweep (currently unused/ignored)
    .byte %00000100    ; Pulse 1, Tone Low byte (currently unused/ignored)
    .byte %00001000    ; Pulse 1, Tone High & Duty (currently unused/ignored)

    .byte %00010000    ; Pulse 2, volume
    .byte %00100000    ; Pulse 2, Sweep (currently unused/ignored)
    .byte %01000000    ; Pulse 2, Tone Low byte (currently unused/ignored)
    .byte %10000000    ; Pulse 2, Tone High & Duty (currently unused/ignored)

