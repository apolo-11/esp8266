local buf
buf = string.char(0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x03, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xFE, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x1F, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7F, 0xFE, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0xFF, 0xDE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF, 0x1F, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x01, 0xFC, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xF8, 0x1F, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x07, 0xF0, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xE0, 0x1F, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x07, 0xE0, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xC0, 0x1F, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x07, 0xE0, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x07, 0xE0, 0x3F, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x3E, 0x03, 0xF0, 0x7F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x03, 0xF8, 0xFE, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x03, 0xFF, 0x01, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x0F, 0xFF, 0x01, 0xFF, 0xFC, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x3F, 0xFF, 0x00, 0xFF, 0xF8, 0x00, 0x00, 0x00, 0x7F, 0xFF, 0x80, 0x3F, 0xE0, 0x01, 0xE0)
buf = buf .. string.char(0x01, 0xFF, 0xCF, 0x80, 0x0F, 0x80, 0x07, 0xF0, 0x03, 0xFF, 0x0F, 0x80, 0x00, 0x00, 0x0F, 0xF0)
buf = buf .. string.char(0x07, 0xFC, 0x0F, 0x80, 0x00, 0x00, 0x3F, 0xF0, 0x1F, 0xF0, 0x0F, 0xC0, 0x00, 0x01, 0xFF, 0xF8)
buf = buf .. string.char(0x1F, 0xE0, 0x0F, 0xC0, 0x00, 0x03, 0xFF, 0xF8, 0x3F, 0xC0, 0x07, 0xC0, 0x00, 0x0F, 0xFF, 0xF8)
buf = buf .. string.char(0x7F, 0x00, 0x07, 0xC0, 0x00, 0x1F, 0xF8, 0xF8, 0x7E, 0x00, 0x07, 0xC0, 0x00, 0x7F, 0xF0, 0xFC)
buf = buf .. string.char(0xFC, 0x00, 0x07, 0xE0, 0x01, 0xFF, 0x80, 0xFC, 0xFC, 0x00, 0x07, 0xE0, 0x03, 0xFF, 0x00, 0x7C)
buf = buf .. string.char(0xF8, 0x00, 0x03, 0xE0, 0x07, 0xFC, 0x00, 0x7C, 0xF8, 0x00, 0x03, 0xE0, 0x0F, 0xF8, 0x00, 0x7E)
buf = buf .. string.char(0xF8, 0x00, 0x03, 0xE0, 0x3F, 0xE0, 0x00, 0x7E, 0xF8, 0x00, 0x03, 0xE0, 0x7F, 0xC0, 0x00, 0x3E)
buf = buf .. string.char(0xF8, 0x00, 0x03, 0xE0, 0xFF, 0x00, 0x00, 0x3E, 0xF8, 0x00, 0x07, 0xE0, 0xFE, 0x00, 0x00, 0x3E)
buf = buf .. string.char(0xFC, 0x00, 0x07, 0xC1, 0xFC, 0x00, 0x00, 0x3E, 0x7E, 0x00, 0x0F, 0xC1, 0xF8, 0x00, 0x00, 0x3F)
buf = buf .. string.char(0x7F, 0x00, 0x3F, 0x83, 0xF0, 0x00, 0x00, 0x3F, 0x3F, 0x80, 0x7F, 0x83, 0xF0, 0x00, 0x00, 0x3F)
buf = buf .. string.char(0x1F, 0xF1, 0xFF, 0x03, 0xE0, 0x00, 0x00, 0x1F, 0x1F, 0xFF, 0xFE, 0x07, 0xE0, 0x00, 0x00, 0x1F)
buf = buf .. string.char(0x0F, 0xFF, 0xFC, 0x07, 0xE0, 0x00, 0x00, 0x1F, 0x07, 0xFF, 0xF8, 0x07, 0xE0, 0x00, 0x00, 0x1F)
buf = buf .. string.char(0x01, 0xFF, 0xE0, 0x07, 0xE0, 0x00, 0x00, 0x1F, 0x00, 0x3F, 0x80, 0x07, 0xE0, 0x00, 0x00, 0x1F)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x07, 0xE0, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x07, 0xE0, 0x00, 0x00, 0x3F)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x03, 0xE0, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x03, 0xF0, 0x00, 0x00, 0x3F)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x03, 0xF0, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x01, 0xF8, 0x00, 0x00, 0x7E)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x01, 0xFC, 0x00, 0x00, 0xFC, 0x00, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x03, 0xFC)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x07, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x7F, 0xC0, 0x0F, 0xF0)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x3F, 0xF0, 0x7F, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x1F, 0xFF, 0xFF, 0xC0)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x07, 0xFF, 0xFF, 0x80, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFF, 0xFE, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0xE0, 0x00)
return buf