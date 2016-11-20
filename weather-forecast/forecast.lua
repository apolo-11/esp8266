local data
local icon
local connectionClosed = true
local screen = 0

function Refresh()
    tmr.wdclr()
	
    if data == nil then
      return -1
    end

    if screen == 0 then
      --disp:setFontPosTop()
      disp:firstPage()
      repeat
        disp:drawStr(65,0, data["day"])
        disp:drawStr(65,10, data["onPlace"])
        disp:drawStr(65,44, data["time"])
        disp:drawStr(65,54, data["date"])
        disp:drawBitmap(0, 0, 8, 64, icon)
      until disp:nextPage() == false
    elseif screen == 1 then
      ShowTextualForecast()
      screen = -1
    end

    screen = screen + 1
end


function ShowTextualForecast()
	--disp:setFontPosTop()
	disp:firstPage()
	repeat
		DrawTextualForecats()
  until disp:nextPage() == false	
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

		local first
    local last
		first = pl:find("{")
    last = pl:find("}", first)
		if first == nil then
		   return -1
		end
    
    pl = pl:sub(first, last)
    first = nil
    last = nil
    --print(pl)
  
		local local_data = cjson.decode(pl)
    pl = nil
		print("Json decode done!")

		conn:close()
    collectgarbage()
		
		icon = dofile(local_data["icon"]..".lc")
		data = local_data
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
		 "Connection: close\r\n\r\n")
	end)
	
	conn:connect(80,"teplomer.apolo-11.cz")  
end
