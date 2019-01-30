;cr_nameIdx      .rs 1  ; character index in a name
cr_chunkCurrent: .res 1  ; current name
cr_chunkAddress: .res 2  ; address of the current name in rom
cr_chunkLength:  .res 1  ; length of the current chunk
cr_currentPPULine: .res 1   ; index in the PPU address lookup table

cr_currentAttrOffset:   .res 1  ; offset for the Attribute lookup table
;cr_attrNameTable:       .res 1  ; nametable to write the attribute stuff

cr_scroll:          .res 1  ; 0-240
cr_scroll_table:    .res 1  ; nametable to use (value written to $2000)
cr_tmpByte:         .res 1
cr_scrollWait:      .res 1  ; frames to wait for the next scroll
cr_nextChunkWait:   .res 1  ; scroll lines until the next chunk update
cr_UpdateReady:     .res 1  ; is there a tile or attribute update ready for the PPU?
cr_AttributeReady:  .res 1
cr_AttrSecondWrite: .res 1
cr_AttrTmp:        .res 1

cr_tileBufferOffset:    .res 1
cr_AttributeByte:       .res 1
cr_AttributeAddress:    .res 2
cr_loopCounter:         .res 1
cr_t2Count:             .res 1

Credits_NameCount = (credits_data_chunks_end - credits_data_chunks) / 2

CR_SCROLL_SPEED = 3     ; frames to wait for the next scroll update
CR_SCROLL_WAIT  = 120   ; frames to wait to start scrolling

CR_TOP      = %10011000
CR_BOTTOM   = %10011010

CR_UPDATE_TILE  = %10000000
CR_UPDATE_ATTR  = %01000000

CR_PADDING      = $20

CR_OP_EOD       = 0
CR_OP_CLEAR_ROW = 1
CR_OP_INC_BYTE  = 2
CR_OP_RLE       = 3
CR_OP_BYTE_LIST = 4
CR_OP_ATTR      = 5
CR_OP_NAME      = 6
