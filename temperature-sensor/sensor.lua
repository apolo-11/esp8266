require('ds1820')

-- gpio0 - 3 je po startu na 0 a asi dela problemy na ESP-01
-- gpio2 - 4 dela problemy na ESP-02
gpio0 = 4
sendPeriod=5 * 60 * 1000
hostName="teplomer.apolo-11.cz"

function sendData()
  tmr.wdclr()
  
  if (#tmpSensors <= 0) then
    return
  end
  
  if (connectionClosed == false) then
	print("Restarting because the connection was not closed")
	node.restart()
  end

  local sensorID = table.remove(tmpSensors)
  local temp=ds1820.read(sensors[sensorID])

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

function sendDataForAll()
  print("Sending data for all sensors.")
  
  tmr.wdclr()
  
  local sensorID = nil
  local sensorAddr = nil
  
  for sensorID, sensorAddr in pairs(sensors) do
    table.insert(tmpSensors, sensorID)
  end

  sendData()
end

function getDns()
  print("Getting IP for "..hostName)
  tmr.wdclr()
  local sk = net.createConnection(net.TCP, 0)
  sk:dns(hostName,function(conn,ip)
						print(hostName.." - "..ip)
						remoteIP=ip
                  end)
  sk = nil
end

connectionClosed = true
remoteIP = nil
getDns()
ds1820.setup(gpio0)
sensors=ds1820.addrs()
tmpSensors={}

tmr.alarm(2, 3600*1000, 1, function() getDns() end )
tmr.alarm(1, 1000, 0, function() sendDataForAll() end )
tmr.alarm(0, sendPeriod, 1, function() sendDataForAll() end )
