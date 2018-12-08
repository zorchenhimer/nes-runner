
function printInfo()
  --Get the emulation state
  state = emu.getState()
  
  emu.drawString(12, 12, "calc_scroll: " .. emu.read(37, 256), 0xFFFFFF, 0xFF00FF00, 1)
  emu.drawString(12, 21, string.format("meta_column_offset: $%X", emu.read(40, 256), emu.read(1009, 256)), 0xFFFFFF, 0xFF000000, 1)
  emu.drawString(12, 30, string.format("last_meta_offset: $%X", emu.read(41, 256)))
  emu.drawString(12, 39, string.format("meta_last_buffer: $%X", emu.read(36, 256)))
  emu.drawString(12, 48, string.format("meta_last_gen: $%X", emu.read(37, 256)))
  emu.drawString(12, 57, string.format("gen_countdown: $%X", emu.read(35, 256)))
  
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(printInfo, emu.eventType.endFrame);