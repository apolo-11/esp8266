local moduleName = ... 
local M = {}
_G[moduleName] = M

local srv = nil

local function parse_wifi_credentials(vars)
  if vars == nil or vars == "" then
      return false
  end

  local _, _, wifi_ssid = string.find(vars, "wifi_ssid\=([^&]+)")
  local _, _, wifi_password = string.find(vars, "wifi_password\=([^&]+)")

  if wifi_ssid == nil or wifi_ssid == "" or wifi_password == nil then
      return false
  end

  pwd_len = string.len(wifi_password)
  if pwd_len ~= 0 and (pwd_len < 8 or pwd_len > 64) then
      print("Password length should be between 8 and 64 characters")
      return false
  end

  print("New WiFi credentials:")
  print("  ssid     : " .. wifi_ssid)
  print("  password : " .. wifi_password)
  
  wifi.setmode(wifi.STATION)
  wifi.sta.config(wifi_ssid, wifi_password)

  return true
end

local function start_server()
  wifi.setmode(wifi.SOFTAP)
  cfg={}
  cfg.ssid="esp8266-"..node.chipid()
  wifi.ap.config(cfg)

  srv=net.createServer(net.TCP) 
  srv:listen(80, function(conn) 

    local Status = 0
    local responseBytes = 0
    local method=""
    local url=""
    local vars=""

    conn:on("receive",function(conn, payload)

      if Status==0 then
        _, _, method, url, vars = string.find(payload, "([A-Z]+) /([^?]*)%??(.*) HTTP")
        -- print(method, url, vars)                          
      end

      if vars~=nil then
        
        if parse_wifi_credentials(vars) then
          print("Close")
          conn:close()
          node.restart()
        end
      end

      if url == "favicon.ico" then
        conn:send("HTTP/1.1 404 file not found")
        responseBytes = -1
        return
      end    

      responseBytes = 0
      conn:send("HTTP/1.1 200 OK\r\n\r\n")
    end)
    
    conn:on("sent",function(conn) 
      if responseBytes>=0 and method=="GET" then
        if file.open("wifisetup.html", "r") then            
          file.seek("set", responseBytes)
          local line=file.read(512)
          file.close()
          if line then
            conn:send(line)
            responseBytes = responseBytes + 512    

            if (string.len(line)==512) then
              return
            end
          end
        end        
      end

      conn:close()
    end)
    
  end)
end

function M.setup(onSetupDone)

  wifi.setmode(wifi.STATION)
	
  tmr.alarm(0,1000,1,function() 
    if wifi.sta.getip() ~= nil then
      tmr.stop(2)
      tmr.stop(1)
      tmr.stop(0)
      print("WiFi Connect OK")
      onSetupDone()
    else
      print("Waiting for WiFi...")
    end
  end)
  
  tmr.alarm(1,30*1000,0,function() 
    tmr.stop(0)
    tmr.alarm(0,5000,1,function()
      print("Waiting for WiFi configuration ower HTTP...")
    end)
    start_server()
  end)
  
  tmr.alarm(2,10*60*1000,0,function()
    print("Failed to configure. Try restart.")
    wifi.setmode(wifi.STATION)
    node.restart()
  end)
	
end

return M
