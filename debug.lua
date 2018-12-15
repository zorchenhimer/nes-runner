
function printInfo()
  --Get the emulation state
  state = emu.getState()
  
  emu.drawString(12, 12, "calc_scroll: " .. emu.read(37, 256), 0xFFFFFF, 0xFF00FF00, 1)
  emu.drawString(12, 21, string.format("meta_column_offset: $%X", emu.read(tonumber("26", 16), 256), emu.read(1009, 256)), 0xFFFFFF, 0xFF000000, 1)
  
  --emu.drawString(12, 30, string.format("last_meta_offset: $%X", emu.read(tonumber("2A", 16), 256)))
  --emu.drawString(12, 39, string.format("meta_last_buffer: $%X", emu.read(tonumber("23", 16), 256)))
  --emu.drawString(12, 48, string.format("meta_last_gen: $%X", emu.read(tonumber("24", 16), 256)))
  --emu.drawString(12, 57, string.format("gen_countdown: $%X", emu.read(35, 256)))
  
end

-- Addresses for variables in RAM
meta_last_buffer = 0x20
meta_columns = 0x300
tile_column_addr_high = 0x3F0
tile_column_addr_low = 0x3F1
tile_column_buffer = 0x380

-- Meta tile defs
--Meta_Sky = { 0x80, 0x90, 0x81, 0x91 }
--Meta_Ground = { 0xA0, 0xB0, 0xA1, 0xB1 }
--Meta_Obstacle = { 0x82, 0x92, 0x83, 0x93 }
--Meta_Pit = { 0xA2, 0xB2, 0xA3, 0xB3 }

Meta_Tiles = {
    { 0x80, 0x90, 0x81, 0x91 }, -- sky
    { 0xA0, 0xB0, 0xA1, 0xB1 }, -- ground
    { 0x82, 0x92, 0x83, 0x93 }, -- obstacle
    { 0xA2, 0xB2, 0xA3, 0xB3 }  -- pit
}


function CheckBuffer()
    local state = emu.getState()
    local frameCount = state.ppu.frameCount

    --
    -- Read buffered meta tiles
    --
    local bufferIdx = emu.read(meta_last_buffer, emu.memType.cpuDebug) - 1
    if bufferIdx < 0 then
        bufferIdx = 31
    end

    -- load up meta_last_buffer
    local bufferOffset = bufferIdx * 4
    local bufferMetaTiles = {}
    local column_address = meta_columns + bufferOffset

    --emu.log(" bufferIdx: " .. bufferIdx .. "; bufferOffset: " .. bufferOffset)

    for i = 1, 4 do
        byteAddr = column_address + i - 1
        tile = emu.read(byteAddr, emu.memType.cpuDebug)
        bufferMetaTiles[i] = tile
    end
    local ppuHigh = emu.read(tile_column_addr_high, emu.memType.cpuDebug)
    local ppuLow = emu.read(tile_column_addr_low, emu.memType.cpuDebug)
    emu.log(
        string.format(
            "[$%04X -> $%02X%02X] ",
            meta_columns + bufferOffset,
            ppuHigh,
            ppuLow
        )
        .. table.concat(bufferMetaTiles, " ")
    )

    --
    -- Check against buffered tiles
    --

    -- load tile buffer from ram
    local tileBuffer = {}
    for i = 1, 16 do
        tile = emu.read(tile_column_buffer + i - 1, emu.memType.cpuDebug)
        tileBuffer[i] = tile
        --emu.log(string.format(" %02X", tile))
    end
    --emu.log(" length of tileBuffer: " .. Length(tileBuffer))

    tileBufferHex = {}
    for i = 1, 16 do
        tileBufferHex[i] = string.format("$%02X", tileBuffer[i])
    end
    emu.log("tileBuffer: " .. table.concat(tileBufferHex, " "))

    -- Compare meta tile to tile buffer
    for i = 1, 4 do -- loop through each meta tile in column
        local mt = bufferMetaTiles[i]
        if mt == nil then
            emu.breakExecution()
            error("meta tile id is nil")
        end

        local mtIndex = mt + 1
        --emu.log(" mtIndex: " .. mtIndex)
        local tiles = Meta_Tiles[mtIndex]
        if tiles == nil then
            emu.breakExecution()
            error("tiles array is nil. mtIndex: " .. mtIndex)
        end

        local tilesHex = {}
        for i = 1, 4 do
            tilesHex[i] = string.format("$%02X", tiles[i])
        end
        emu.log(mt .. " -> " .. table.concat(tilesHex, " "))

        local idxOffset = (i - 1) * 4
        local idxOffsetB = (i + 3) * 2
        --emu.log(" idxOffset: " .. idxOffset)
        --emu.log(" idxOffsetB: " .. idxOffsetB)

        -- check tile buffer
        if tiles[1] ~= tileBuffer[idxOffset+1] then
            NoMatch(0, tiles[1], tileBuffer[idxOffset+1])
        end

        --if tiles[2] ~= tileBuffer[idxOffset+2] then
        --    NoMatch(1, tiles[2], tileBuffer[idxOffset+2])
        --end

        --if tiles[3] ~= tileBuffer[idxOffsetB+1] then
        --    NoMatch(2, tiles[3], tileBuffer[idxOffsetB+1])
        --end

        --if tiles[4] ~= tileBuffer[idxOffsetB+2] then
        --    NoMatch(3, tiles[4], tileBuffer[idxOffsetB+2])
        --end

    end

    emu.log(" ")
end

function NoMatch(idx, tile, b)
    emu.log(
        --" [".. idx .."] tile does not match buffer! " ..
        string.format("[%d] $%02X != $%02X", idx, tile, b)
    )
end

function Length(T)
    local table_length = 0
    for _ in pairs(T) do table_length = table_length + 1 end
    return table_length
end
--Register some code (printInfo function) that will be run at the end of each frame
--emu.addEventCallback(printInfo, emu.eventType.endFrame);
--emu.addEventCallback(CheckBuffer, emu.eventType.endFrame);
emu.addMemoryCallback(CheckBuffer, emu.memCallbackType.cpuWrite, 0x69)
--CheckBuffer()
