local buf
buf = string.char(0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x01, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x1F, 0x00, 0x03, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x07, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x1F, 0x00, 0x07, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x80, 0x07, 0xC0, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x0F, 0x80, 0x0F, 0x80, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x80, 0x0F, 0x80, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x07, 0x80, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x06, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xF8, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x01, 0xFF, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFF, 0xFF, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x07, 0xFF, 0xFF, 0x80, 0x07, 0x00, 0x00, 0x00, 0x0F, 0x80, 0x07, 0xC0, 0x7F)
buf = buf .. string.char(0x00, 0x00, 0x01, 0xFF, 0x00, 0x07, 0xE1, 0xFF, 0x00, 0x00, 0x3F, 0xFF, 0x80, 0x03, 0xF1, 0xFF)
buf = buf .. string.char(0x00, 0x00, 0x7F, 0xFF, 0xE0, 0x01, 0xF9, 0xFC, 0x00, 0x00, 0xFE, 0x07, 0xF0, 0x00, 0x78, 0xE0)
buf = buf .. string.char(0x00, 0x01, 0xF0, 0x01, 0xF0, 0x00, 0x7C, 0x00, 0x00, 0x03, 0xE0, 0x00, 0xF8, 0x00, 0x3C, 0x00)
buf = buf .. string.char(0x00, 0x07, 0x80, 0x00, 0x3E, 0x00, 0x3C, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x1F, 0x00, 0x3C, 0x00)
buf = buf .. string.char(0x00, 0x1E, 0x00, 0x00, 0x0F, 0x00, 0x3C, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x0F, 0x00, 0x3C, 0x00)
buf = buf .. string.char(0x03, 0xFF, 0xE0, 0x00, 0x07, 0x80, 0x3C, 0x00, 0x0F, 0xFF, 0xF0, 0x00, 0x03, 0x80, 0x3C, 0x00)
buf = buf .. string.char(0x1F, 0xC1, 0xF8, 0x00, 0x03, 0xC0, 0x3C, 0x00, 0x1F, 0x00, 0x7C, 0x00, 0x00, 0x7E, 0x3C, 0x00)
buf = buf .. string.char(0x3C, 0x00, 0x1E, 0x1F, 0xFE, 0x7F, 0x3C, 0x00, 0x78, 0x00, 0x0E, 0x3F, 0xFE, 0x1F, 0xFC, 0xF0)
buf = buf .. string.char(0x78, 0x00, 0x0C, 0x7F, 0xFC, 0x07, 0xF9, 0xFC, 0x70, 0x00, 0x00, 0xFF, 0xF8, 0x03, 0xF9, 0xFF)
buf = buf .. string.char(0xF0, 0x00, 0x01, 0xFF, 0xF0, 0x01, 0xF0, 0xFF, 0xE0, 0x00, 0x03, 0xFF, 0xE0, 0x00, 0xE0, 0x3F)
buf = buf .. string.char(0xE0, 0x00, 0x03, 0xFF, 0xC0, 0x00, 0xE0, 0x1F, 0xE0, 0x00, 0x07, 0xFF, 0x80, 0x00, 0x70, 0x03)
buf = buf .. string.char(0xE0, 0x00, 0x0F, 0xFF, 0x00, 0x00, 0x70, 0x00, 0xF0, 0x00, 0x1F, 0xFE, 0x00, 0x00, 0x70, 0x00)
buf = buf .. string.char(0x70, 0x00, 0x3F, 0xFC, 0x00, 0x00, 0x70, 0x00, 0x78, 0x00, 0x7F, 0xF8, 0x00, 0x00, 0xF0, 0x00)
buf = buf .. string.char(0x78, 0x00, 0xFF, 0xF0, 0x00, 0x00, 0xE0, 0x00, 0x3C, 0x01, 0xFF, 0xFF, 0xFC, 0x03, 0xE0, 0x00)
buf = buf .. string.char(0x3E, 0x03, 0xFF, 0xFF, 0xF8, 0x07, 0xC0, 0x00, 0x1F, 0x87, 0xFF, 0xFF, 0xF0, 0x07, 0x80, 0x00)
buf = buf .. string.char(0x0F, 0xE0, 0x00, 0xFF, 0xC7, 0xFF, 0x80, 0x00, 0x07, 0xE0, 0x01, 0xFF, 0x8F, 0xFF, 0x00, 0x00)
buf = buf .. string.char(0x00, 0xC0, 0x03, 0xFF, 0x1F, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFC, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x07, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xF0, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x0F, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0xC0, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x1F, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x01, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
return buf