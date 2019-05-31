; asmsyntax=ca65

SND_PULSE1_UPDATE_DV    = 1
SND_PULSE1_UPDATE_01    = 2
SND_PULSE1_UPDATE_TL    = 4
SND_PULSE1_UPDATE_TH    = 8

SND_PULSE2_UPDATE_DV    = 1 << 4
SND_PULSE2_UPDATE_01    = 2 << 4
SND_PULSE2_UPDATE_TL    = 4 << 4
SND_PULSE2_UPDATE_TH    = 8 << 4

;SND_TRIANGLE_UPDATE = 4
;SND_NOISE_UPDATE    = 8

SndPulseFlags:      .res 1
SndTriNoiseFlags:   .res 1

; Buffers of registers.  To be written on next frame.
Pulse1_DutyVolume:  .res 1
Pulse2_DutyVolume:  .res 1
Triangle_Counter:   .res 1
Noise_EnvVolume:    .res 1

Pulse1_TimerHigh:   .res 1
Pulse2_TimerHigh:   .res 1
Triangle_TimerHigh: .res 1
Noise_Period:       .res 1

Pulse1_TimerLow:    .res 1
Pulse2_TimerLow:    .res 1
Triangle_TimerLow:  .res 1
Noise_Length:       .res 1

Pulse1_4001:        .res 1
Pulse2_4005:        .res 1


SndPointer_Instrument:  .res 10
SndPointer_VolMacro:    .res 10
SndPointer_ArpMacro:    .res 10
SndPointer_Sequence:    .res 10

; Ticks until next beat
SndBeat:    .res 1
SfxBeat:    .res 1
sfxPlaying: .res 1  ; flag to start SFX
TICKS_PER_BEAT = 8

; Used in LoadInstrument
TmpOffset:  .res 1

TmpChanOffset:  .res 1
TmpChanId:      .res 1
TmpChanIdReal:      .res 1

TmpAddress: .res 2

MIDI_PLAY_NOTE  = $00 ; Two bytes - OP code, then note index
MIDI_SET_INSTR  = $10 ; Lower is istrument ID
MIDI_WAIT       = $20 ; Lower is wait beats
MIDI_MUTE       = $30
MIDI_END        = $40
MIDI_NOISE      = $50 ; Only for the noise channel. Value is OR'd on to the end
