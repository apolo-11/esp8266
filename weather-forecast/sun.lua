local buf
buf = string.char(0x00, 0x00, 0x38, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x3C, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x7C, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x7C, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x7E, 0x00, 0x00, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0xF8, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x3F, 0x00, 0x01, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x01, 0xF8, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x1F, 0x80, 0x01, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x80, 0x03, 0xF0, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x0F, 0x80, 0x03, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0xC0, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0xF8, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFF, 0xFF, 0xC0, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x07, 0xFF, 0xFF, 0xE0, 0x00, 0x00, 0x70, 0x00, 0x0F, 0xFF, 0xFF, 0xF0, 0x00, 0x1E)
buf = buf .. string.char(0xFC, 0x00, 0x1F, 0xF8, 0x1F, 0xF8, 0x00, 0x7F, 0xFF, 0x00, 0x3F, 0x80, 0x01, 0xFC, 0x03, 0xFF)
buf = buf .. string.char(0xFF, 0xC0, 0x7F, 0x00, 0x00, 0xFE, 0x0F, 0xFF, 0x7F, 0xE0, 0xFE, 0x00, 0x00, 0x7F, 0x0F, 0xFE)
buf = buf .. string.char(0x3F, 0xF1, 0xFC, 0x00, 0x00, 0x3F, 0x8F, 0xF0, 0x0F, 0xF1, 0xF8, 0x00, 0x00, 0x1F, 0x8F, 0xC0)
buf = buf .. string.char(0x03, 0xF1, 0xF0, 0x00, 0x00, 0x0F, 0x87, 0x00, 0x00, 0x63, 0xE0, 0x00, 0x00, 0x0F, 0xC0, 0x00)
buf = buf .. string.char(0x00, 0x03, 0xE0, 0x00, 0x00, 0x07, 0xC0, 0x00, 0x00, 0x07, 0xE0, 0x00, 0x00, 0x07, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x07, 0xC0, 0x00, 0x00, 0x07, 0xE0, 0x00, 0x00, 0x07, 0xC0, 0x00, 0x00, 0x03, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x07, 0xC0, 0x00, 0x00, 0x03, 0xE0, 0x00, 0x00, 0x07, 0xC0, 0x00, 0x00, 0x03, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x07, 0xC0, 0x00, 0x00, 0x03, 0xE0, 0x00, 0x00, 0x07, 0xC0, 0x00, 0x00, 0x03, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x07, 0xC0, 0x00, 0x00, 0x03, 0xE0, 0x00, 0x00, 0x07, 0xE0, 0x00, 0x00, 0x07, 0xE0, 0x00)
buf = buf .. string.char(0x00, 0x07, 0xE0, 0x00, 0x00, 0x07, 0xE0, 0x00, 0x00, 0x03, 0xE0, 0x00, 0x00, 0x07, 0xC0, 0x00)
buf = buf .. string.char(0x00, 0x03, 0xF0, 0x00, 0x00, 0x0F, 0xC7, 0x80, 0x00, 0xE1, 0xF0, 0x00, 0x00, 0x0F, 0x8F, 0xE0)
buf = buf .. string.char(0x07, 0xF1, 0xF8, 0x00, 0x00, 0x1F, 0x8F, 0xF8, 0x1F, 0xF1, 0xFC, 0x00, 0x00, 0x3F, 0x8F, 0xFE)
buf = buf .. string.char(0x7F, 0xF0, 0xFE, 0x00, 0x00, 0x7F, 0x07, 0xFF, 0xFF, 0xE0, 0x7F, 0x00, 0x00, 0xFE, 0x01, 0xFF)
buf = buf .. string.char(0xFF, 0x80, 0x3F, 0xC0, 0x03, 0xFC, 0x00, 0x7F, 0xFE, 0x00, 0x1F, 0xFC, 0x3F, 0xF8, 0x00, 0x0E)
buf = buf .. string.char(0xF8, 0x00, 0x0F, 0xFF, 0xFF, 0xF0, 0x00, 0x00, 0x60, 0x00, 0x07, 0xFF, 0xFF, 0xE0, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x03, 0xFF, 0xFF, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7F, 0xFE, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x00, 0x0F, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x03, 0x80, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x07, 0xC0, 0x01, 0xF0, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x07, 0xC0, 0x01, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x80, 0x01, 0xF8, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x0F, 0x80, 0x00, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0xFC, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x1F, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x7E, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x3E, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x3F, 0x00, 0x00)
buf = buf .. string.char(0x00, 0x00, 0x7C, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x0E, 0x00, 0x00)
return buf
