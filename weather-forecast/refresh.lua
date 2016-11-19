local data
local icon
local connectionClosed = true
local screen = 0

function Refresh()
    tmr.wdclr()
	
    if data == nil then
      return -1
    end
	
    --disp:setFontRefHeightExtendedText()
    disp:setDefaultForegroundColor()
    disp:setFont(u8g.font_6x10)
    disp:setFontPosTop()
	
	local pocitadlo = 0

    if screen == 0 then
      disp:firstPage()
      repeat
        disp:drawStr(65,0, data["day"])
        disp:drawStr(65,10, data["onPlace"])
        disp:drawStr(65,44, data["time"])
        disp:drawStr(65,54, data["date"])
        disp:drawBitmap( 0, 0, 8, 64, icon )
		pocitadlo = pocitadlo + 1
      until disp:nextPage() == false
    elseif screen == 1 then
      ShowTextualForecast()
      screen = -1
    end
    
	print("Pocitadlo 1: "..pocitadlo)
    screen = screen + 1
end


function ShowTextualForecast()
	--disp:setFontRefHeightExtendedText()
	--disp:setDefaultForegroundColor()
	--disp:setFont(u8g.font_6x10)
	disp:setFontPosTop()
	
	local pocitadlo = 0
	
	disp:firstPage()
	repeat
		DrawTextualForecats()
		pocitadlo = pocitadlo + 1
    until disp:nextPage() == false	
	
	print("Pocitadlo 2: "..pocitadlo)
end


function DrawTextualForecats()
	local all = tostring(data["forecast"])
	local i = 0
	
	repeat
		tmr.wdclr()
		if all:len{} > 21 then
			line = all:sub(0,21)
			all = all:sub(22)
		else
			line = all
			all = nil
		end
		disp:drawStr(0, i*10,line)
		i = i + 1
	until all == nil
end

function DownloadForecast()
	if (connectionClosed == false) then
		print("Restarting because the connection was not closed")
		node.restart()
	end

	connectionClosed = false
	
	conn = net.createConnection(net.TCP, 0)

	conn:on("receive",function(conn,pl)
		print("Data received")

		local i
		i = pl:find("{")
		if i == nil then
		   return -1
		end
		local local_data = cjson.decode(pl:sub(i))
		print("Json decode done!")
		
		conn:close()
		
		icon = dofile(local_data["icon"]..".lc")
		data = local_data
		collectgarbage()
	end)

	conn:on("disconnection",function(conn)
		connectionClosed = true
	end)

	conn:on("sent",function() 
		sent_flag = false
	end)

	conn:on("connection",function(conn)
		print("Connection Get!")

		conn:send("GET http://teplomer.apolo-11.cz/rest/predpoved/plzen HTTP/1.1\r\n"..
		 "Host: teplomer.apolo-11.cz\r\n"..
		 "Connection: keep-alive\r\n\r\n")
	end)
	
	conn:connect(80,"teplomer.apolo-11.cz")  
end
