require('wifisetup')

i2c.setup(0, 3,4, i2c.SLOW)
disp = u8g.ssd1306_128x64_i2c(0x3c)
disp:setFont(u8g.font_6x10)
disp:setFontRefHeightExtendedText()
disp:setDefaultForegroundColor()
disp:setFontPosTop()

dofile("refresh.lc")

wifisetup.setup(function() 
  tmr.alarm(0,10*60*1000,1,function() 
    print("Download forecast")
    DownloadForecast()
  end)

  tmr.alarm(1,10000,1,function() 
    print("Refresh screen")
    Refresh()
  end)
  
  DownloadForecast()
end)
