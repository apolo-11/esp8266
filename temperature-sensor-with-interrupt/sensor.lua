require('ds1820')

-- gpio0 - 3 je po startu na 0 a asi dela problemy na ESP-01
-- gpio2 - 4 dela problemy na ESP-02
gpio0 = 4
-- Je to v nano sekundach.
sendPeriod=(5 * 60 + 2) * 1000 * 1000
hostName="teplomer.apolo-11.cz"

function sendData()
  tmr.wdclr()

  sensorID, sensorAddr = next(sensors);
  if (sensorID == nil) then
    local sleepTime = sendPeriod - tmr.now()
    print("Go to deep sleep for "..sleepTime)
    node.dsleep(sleepTime)
    return
  end

  if (connectionClosed == false) then
	print("Restarting because the connection was not closed")
    node.restart()
  end

  -- remove the sensor from map
  sensors[sensorID]=nil
  local temp=ds1820.read(sensorAddr)

  if(temp == "NA") then
    print("No data for: "..sensorID)
    return
  end
  
  tmr.wdclr()

  print("Sending temp: "..sensorID .. ": "..temp.." C")
  print("Heap "..node.heap())
  local conn=net.createConnection(net.TCP, 0)
  connectionClosed = false
  conn:on("receive", function(conn, payload)
                          tmr.wdclr()
						  print('Received')
						  --print(payload)
						  conn:close()
						end)
  conn:on("sent", function(conn) tmr.wdclr() print("Sent") end )
  conn:on("disconnection", function(conn)
                          tmr.wdclr()
						  print('Disconnected')
						  connectionClosed = true
						  tmr.alarm(3, 100, 0, function() sendData() end )
						end)
  conn:on("connection", function(conn)
						  tmr.wdclr()
						  print("Connected")
						  conn:send("GET /rest/measurement/"..sensorID.."?temperature="..temp.." HTTP/1.1\r\n"
						  .."Host: "..hostName.."\r\n"
						  .."Accept: */*\r\n"
						  .."User-Agent: Mozilla/4.0 (compatible; Windows NT 5.1)\r\n"
						  .."\r\n")
						end)
  conn:connect(80,remoteIP)
end

connectionClosed = true
remoteIP = nil

print("Getting IP for "..hostName)
tmr.wdclr()
local sk = net.createConnection(net.TCP, 0)
sk:dns(hostName,function(conn,ip)
          print(hostName.." - "..ip)
          remoteIP=ip
          conn:close()
          ds1820.setup(gpio0)
          sensors=ds1820.addrs()
          tmr.alarm(3, 100, 0, function() sendData() end )
   end)
sk = nil
