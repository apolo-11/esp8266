function unrequire(m)
	package.loaded[m] = nil
	_G[m] = nil
end

-- setup display
i2c.setup(0, 3,4, i2c.SLOW)
disp = u8g.ssd1306_128x64_i2c(0x3c)
disp:setFont(u8g.font_6x10)
disp:setFontRefHeightExtendedText()
disp:setDefaultForegroundColor()
disp:setFontPosTop()

-- draw welcome screen
local icon = dofile("apolo.lc")
disp:firstPage()
repeat
  disp:drawBitmap( 32, 0, 8, 64, icon )
until disp:nextPage() == false
icon = nil

-- configure wifi
require("wifisetup")
wifisetup.setup(function()
  unrequire("wifisetup")
  require("forecast")
  collectgarbage()

  -- show forecast
  
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
