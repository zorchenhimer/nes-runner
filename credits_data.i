credits_data_chunks:
; Blank row before special thanks
cr_data_chunk_00:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

; Top half of header
cr_data_chunk_01:
    .byte CR_OP_RLE, 7, $20
    .byte CR_OP_INC_BYTE, 3, $10
    .byte CR_OP_INC_BYTE, 7, $02
    .byte CR_OP_RLE, 22, $20
    .byte CR_OP_INC_BYTE, 3, $13
    .byte CR_OP_INC_BYTE, 15, $80
    .byte CR_OP_RLE, 7, $20
    .byte CR_OP_ATTR, $00

; Bottom half of header
cr_data_chunk_02:
    .byte CR_OP_RLE, 7, $20
    .byte CR_OP_INC_BYTE, 3, $16
    .byte CR_OP_INC_BYTE, 15, $90
    .byte CR_OP_RLE, 7, $20
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

; Blank row before Miha's credit
cr_data_chunk_03:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

; Special thanks for MihaBrumecArt
cr_data_chunk_04:
    .byte CR_OP_RLE, 8, $20
    .byte CR_OP_INC_BYTE, 16, $A0
    .byte CR_OP_RLE, 16, $20
    .byte CR_OP_INC_BYTE, 16, $B0
    .byte CR_OP_RLE, 8, $20
    .byte CR_OP_ATTR, $0F

; Special thanks for MihaBrumecArt
cr_data_chunk_05:
    .byte CR_OP_RLE, 8, $20
    .byte CR_OP_INC_BYTE, 16, $C0
    .byte CR_OP_RLE, 16, $20
    .byte CR_OP_INC_BYTE, 16, $D0
    .byte CR_OP_RLE, 8, $20
    .byte CR_OP_ATTR, $0F

; Blank row before music credit
cr_data_chunk_06:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

; Special thanks for music
cr_data_chunk_07:
    .byte CR_OP_RLE, 13, $20
    .byte CR_OP_INC_BYTE, 7, $09
    .byte CR_OP_RLE, 21, $20
    .byte CR_OP_INC_BYTE, 14, $E1
    .byte CR_OP_RLE, 9, $20
    .byte CR_OP_ATTR, $F0

; Special thanks for music, pt2
cr_data_chunk_08:
    .byte CR_OP_RLE, 9, $20
    .byte CR_OP_INC_BYTE, 14, $F1
    .byte CR_OP_RLE, 9, $20
    .byte CR_OP_CLEAR_ROW

; Blank row before names
cr_data_chunk_09:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

cr_data_chunk_10: .byte CR_OP_NAME, $09, "SleepyMia"
cr_data_chunk_11: .byte CR_OP_NAME, $09, "KimiMoons"
cr_data_chunk_12: .byte CR_OP_NAME, $0D, "chaos111gamer"
cr_data_chunk_13: .byte CR_OP_NAME, $08, "Gappajin"
cr_data_chunk_14: .byte CR_OP_NAME, $09, "Arkyboots"
cr_data_chunk_15: .byte CR_OP_NAME, $0A, "wolffrider"
cr_data_chunk_16: .byte CR_OP_NAME, $8C, "hayesmaker64"
cr_data_chunk_17: .byte CR_OP_NAME, $07, "koostee"
cr_data_chunk_18: .byte CR_OP_NAME, $0B, "c__plusplus"
cr_data_chunk_19: .byte CR_OP_NAME, $89, "jojoa1997"
cr_data_chunk_20: .byte CR_OP_NAME, $0B, "casseydraws"
cr_data_chunk_21: .byte CR_OP_NAME, $08, "apetresc"
cr_data_chunk_22: .byte CR_OP_NAME, $07, "akmafin"
cr_data_chunk_23: .byte CR_OP_NAME, $09, "varomixer"
cr_data_chunk_24: .byte CR_OP_NAME, $09, "musiclynx"
cr_data_chunk_25: .byte CR_OP_NAME, $08, "mare1997"
cr_data_chunk_26: .byte CR_OP_NAME, $0C, "abridgewater"
cr_data_chunk_27: .byte CR_OP_NAME, $07, "zaronte"
cr_data_chunk_28: .byte CR_OP_NAME, $10, "conundrumjackson"
cr_data_chunk_29: .byte CR_OP_NAME, $07, "rewtguy"
cr_data_chunk_30: .byte CR_OP_NAME, $09, "exoticman"
cr_data_chunk_31: .byte CR_OP_NAME, $06, "jtaroh"
cr_data_chunk_32: .byte CR_OP_NAME, $0D, "xxirawesomexx"
cr_data_chunk_33: .byte CR_OP_NAME, $06, "npylas"
cr_data_chunk_34: .byte CR_OP_NAME, $0E, "muikethedriver"
cr_data_chunk_35: .byte CR_OP_NAME, $09, "tatou1000"
cr_data_chunk_36: .byte CR_OP_NAME, $07, "coluigy"
cr_data_chunk_37: .byte CR_OP_NAME, $0A, "cmgriffing"
cr_data_chunk_38: .byte CR_OP_NAME, $0A, "IchBins_SN"
cr_data_chunk_39: .byte CR_OP_NAME, $09, "kingchub7"
cr_data_chunk_40: .byte CR_OP_NAME, $09, "sir_pengu"
cr_data_chunk_41: .byte CR_OP_NAME, $08, "tastydew"
cr_data_chunk_42: .byte CR_OP_NAME, $47, "SudoKid"
cr_data_chunk_43: .byte CR_OP_NAME, $0B, "vikingcoder"
cr_data_chunk_44: .byte CR_OP_NAME, $0A, "THICC_Ogre"
cr_data_chunk_45: .byte CR_OP_NAME, $09, "Samarium1"
cr_data_chunk_46: .byte CR_OP_NAME, $0B, "brycenels26"
cr_data_chunk_47: .byte CR_OP_NAME, $8D, "MLGBlackbeard"
cr_data_chunk_48: .byte CR_OP_NAME, $0E, "Gossamer_Socks"
cr_data_chunk_49: .byte CR_OP_NAME, $07, "Mgentry"
cr_data_chunk_50: .byte CR_OP_NAME, $0E, "unitycoder_com"
cr_data_chunk_51: .byte CR_OP_NAME, $0B, "shogunslash"
cr_data_chunk_52: .byte CR_OP_NAME, $05, "Loyrl"
cr_data_chunk_53: .byte CR_OP_NAME, $08, "protostr"
cr_data_chunk_54: .byte CR_OP_NAME, $07, "Tsoding"
cr_data_chunk_55: .byte CR_OP_NAME, $0D, "3dcodewarrior"
cr_data_chunk_56: .byte CR_OP_NAME, $4D, "paperfangames"
cr_data_chunk_57: .byte CR_OP_NAME, $55, "zorchenhimerwaifusama"
cr_data_chunk_58: .byte CR_OP_NAME, $09, "Blacky372"
cr_data_chunk_59: .byte CR_OP_NAME, $07, "K1ng440"
cr_data_chunk_60: .byte CR_OP_NAME, $10, "NoctisMaiestatem"
cr_data_chunk_61: .byte CR_OP_NAME, $8E, "StreamElements"
cr_data_chunk_62: .byte CR_OP_NAME, $89, "SlashLife"
cr_data_chunk_63: .byte CR_OP_NAME, $09, "Gobfather"
cr_data_chunk_64: .byte CR_OP_NAME, $05, "Lopan"
cr_data_chunk_65: .byte CR_OP_NAME, $12, "JackBurtonTrucking"
cr_data_chunk_66: .byte CR_OP_NAME, $09, "smurphing"
cr_data_chunk_67: .byte CR_OP_NAME, $0A, "TildeSnake"
cr_data_chunk_68: .byte CR_OP_NAME, $11, "tropicalbananaman"
cr_data_chunk_69: .byte CR_OP_NAME, $06, "Deetle"
cr_data_chunk_70: .byte CR_OP_NAME, $0A, "no_muscles"
cr_data_chunk_71: .byte CR_OP_NAME, $0D, "CommanderRoot"
cr_data_chunk_72: .byte CR_OP_NAME, $09, "zekenater"
cr_data_chunk_73: .byte CR_OP_NAME, $0C, "GunStarrHero"
cr_data_chunk_74: .byte CR_OP_NAME, $4A, "TheJelmega"
cr_data_chunk_75: .byte CR_OP_NAME, $0B, "ClownOfFire"
cr_data_chunk_76: .byte CR_OP_NAME, $08, "FakePyry"
cr_data_chunk_77: .byte CR_OP_NAME, $0D, "MihaBrumecArt"
cr_data_chunk_78: .byte CR_OP_NAME, $07, "jayytt7"
cr_data_chunk_79: .byte CR_OP_NAME, $08, "Arctaeon"
cr_data_chunk_80: .byte CR_OP_NAME, $0F, "ChannelMagnetic"
cr_data_chunk_81: .byte CR_OP_NAME, $08, "movAX13h"
cr_data_chunk_82: .byte CR_OP_NAME, $0B, "thekorn1896"
cr_data_chunk_83: .byte CR_OP_NAME, $10, "InfiniteNesLives"
cr_data_chunk_84: .byte CR_OP_NAME, $47, "Jitspoe"
cr_data_chunk_85: .byte CR_OP_NAME, $48, "v1talDPM"
cr_data_chunk_86: .byte CR_OP_NAME, $0B, "SlayerDarth"
cr_data_chunk_87: .byte CR_OP_NAME, $0C, "Proloospower"
cr_data_chunk_88: .byte CR_OP_NAME, $05, "tetix"
cr_data_chunk_89: .byte CR_OP_NAME, $09, "mikerua13"
cr_data_chunk_90: .byte CR_OP_NAME, $06, "WiedmS"
cr_data_chunk_91: .byte CR_OP_NAME, $08, "Duotones"
cr_data_chunk_92: .byte CR_OP_NAME, $08, "OrcTamer"
cr_data_chunk_93: .byte CR_OP_NAME, $0B, "nord1cpanda"
cr_data_chunk_94: .byte CR_OP_NAME, $08, "ellisaia"
cr_data_chunk_95: .byte CR_OP_NAME, $0C, "LowRidaOrida"
cr_data_chunk_96: .byte CR_OP_NAME, $07, "Renelie"
cr_data_chunk_97: .byte CR_OP_NAME, $08, "funkschy"
cr_data_chunk_98: .byte CR_OP_NAME, $07, "jonnybb"
cr_data_chunk_99: .byte CR_OP_NAME, $0D, "CorreiaisaGod"
cr_data_chunk_100: .byte CR_OP_NAME, $07, "l34ch_r"
cr_data_chunk_101: .byte CR_OP_NAME, $0A, "WodoWiesel"
cr_data_chunk_102: .byte CR_OP_NAME, $07, "Kasreyn"
cr_data_chunk_103: .byte CR_OP_NAME, $0A, "Ickystasis"
cr_data_chunk_104: .byte CR_OP_NAME, $86, "Annerr"
cr_data_chunk_105: .byte CR_OP_NAME, $11, "dullahan_software"
cr_data_chunk_106: .byte CR_OP_NAME, $0A, "Villimin12"
cr_data_chunk_107: .byte CR_OP_NAME, $08, "superJpg"
cr_data_chunk_108: .byte CR_OP_NAME, $09, "ispanico5"
cr_data_chunk_109: .byte CR_OP_NAME, $04, "G4MR"
cr_data_chunk_110: .byte CR_OP_NAME, $07, "vahkesh"
cr_data_chunk_111: .byte CR_OP_NAME, $0C, "XanderGuzman"
cr_data_chunk_112: .byte CR_OP_NAME, $0C, "TwitchJamieH"
cr_data_chunk_113: .byte CR_OP_NAME, $06, "lut321"
cr_data_chunk_114: .byte CR_OP_NAME, $0D, "GarethHubball"
cr_data_chunk_115: .byte CR_OP_NAME, $09, "minxyrose"
cr_data_chunk_116: .byte CR_OP_NAME, $0C, "ancient_gate"
cr_data_chunk_117: .byte CR_OP_NAME, $09, "rhymu8354"
cr_data_chunk_118: .byte CR_OP_NAME, $0A, "AMadGenius"
cr_data_chunk_119: .byte CR_OP_NAME, $0E, "notnullnotvoid"
cr_data_chunk_120: .byte CR_OP_NAME, $0C, "ABuffSeagull"
cr_data_chunk_121: .byte CR_OP_NAME, $0B, "Pocketwatch"
cr_data_chunk_122: .byte CR_OP_NAME, $0A, "Chokladmos"
cr_data_chunk_123: .byte CR_OP_NAME, $0D, "MihaBrumecArt"
cr_data_chunk_124: .byte CR_OP_NAME, $0A, "thebyteman"
cr_data_chunk_125: .byte CR_OP_NAME, $0B, "SimplyFubar"
cr_data_chunk_126: .byte CR_OP_NAME, $08, "nitrixen"
cr_data_chunk_127: .byte CR_OP_NAME, $09, "Darjusz67"
cr_data_chunk_128: .byte CR_OP_NAME, $47, "Aruseus"
cr_data_chunk_129: .byte CR_OP_NAME, $0E, "mordorstroller"
cr_data_chunk_130: .byte CR_OP_NAME, $13, "alejandra_quetzalli"
cr_data_chunk_131: .byte CR_OP_NAME, $0A, "hyperfnord"
cr_data_chunk_132: .byte CR_OP_NAME, $0E, "nightshadedude"
cr_data_chunk_133: .byte CR_OP_NAME, $06, "irrlux"
cr_data_chunk_134: .byte CR_OP_NAME, $0C, "luandevecchi"
cr_data_chunk_135: .byte CR_OP_NAME, $08, "beb_oner"
cr_data_chunk_136: .byte CR_OP_NAME, $08, "ebruning"
cr_data_chunk_137: .byte CR_OP_NAME, $0C, "WillWhateley"
cr_data_chunk_138: .byte CR_OP_NAME, $0B, "rafaelgazze"
cr_data_chunk_139: .byte CR_OP_NAME, $0B, "HeyItsSimon"
cr_data_chunk_140: .byte CR_OP_NAME, $05, "zup84"
cr_data_chunk_141: .byte CR_OP_NAME, $09, "jumbleguy"
cr_data_chunk_142: .byte CR_OP_NAME, $09, "Sakanakao"
cr_data_chunk_143: .byte CR_OP_NAME, $0B, "mdahlhausen"
cr_data_chunk_144: .byte CR_OP_NAME, $06, "nikaji"
cr_data_chunk_145: .byte CR_OP_NAME, $08, "Cynokron"
cr_data_chunk_146: .byte CR_OP_NAME, $07, "IR_gEEK"
cr_data_chunk_147: .byte CR_OP_NAME, $0D, "Ralph_124C_41"
cr_data_chunk_148: .byte CR_OP_NAME, $06, "Tomcii"
cr_data_chunk_149: .byte CR_OP_NAME, $0A, "Codiee1337"
cr_data_chunk_150: .byte CR_OP_NAME, $06, "tsjost"
cr_data_chunk_151: .byte CR_OP_NAME, $08, "BotO0256"
cr_data_chunk_152: .byte CR_OP_NAME, $08, "sylphid8"
cr_data_chunk_153: .byte CR_OP_NAME, $0A, "karlbright"
cr_data_chunk_154: .byte CR_OP_NAME, $08, "zerosx10"
cr_data_chunk_155: .byte CR_OP_NAME, $13, "Epic_Ninja_Elephant"
cr_data_chunk_156: .byte CR_OP_NAME, $09, "SIMPalaxy"
cr_data_chunk_157: .byte CR_OP_NAME, $0A, "MarekVarro"
cr_data_chunk_158: .byte CR_OP_NAME, $07, "lostyCS"
cr_data_chunk_159: .byte CR_OP_NAME, $09, "oguruma76"
cr_data_chunk_160: .byte CR_OP_NAME, $07, "Falk3n_"
cr_data_chunk_161: .byte CR_OP_NAME, $0A, "Darthkikyo"
cr_data_chunk_162: .byte CR_OP_NAME, $05, "im331"
cr_data_chunk_163: .byte CR_OP_NAME, $08, "jmatth11"
cr_data_chunk_164: .byte CR_OP_NAME, $08, "DOWRIGHT"
cr_data_chunk_165: .byte CR_OP_NAME, $0A, "MrBankster"
; Bottom padding for Attribute
cr_data_chunk_166:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

cr_data_chunk_167: .byte CR_OP_NAME, $0B, "Thank you!!"
; Bottom padding for Attribute
cr_data_chunk_168:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00

; Bottom padding for Attribute
cr_data_chunk_169:
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_CLEAR_ROW
    .byte CR_OP_ATTR, $00
    .byte CR_OP_EOD

