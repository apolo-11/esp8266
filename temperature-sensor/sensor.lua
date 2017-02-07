-- read the configuration
dofile("config.lc")

if (GPIO_DS1820 ~= nil) then
  require("ds1820")
end

function sendDataDS1820()
  tmr.wdclr()
  
  if (#tmpSensors <= 0) then
    return
  end

  local sensorID = table.remove(tmpSensors)
  local temp=ds1820.read(sensors[sensorID])

  if(temp == "NA") then
    print("No data for: "..sensorID)
    return
  end

  print("Sending id="..sensorID.." t="..temp)

  tmr.wdclr()
  http.get("http://"..HOST_NAME.."/rest/measurement/"..sensorID.."?temperature="..temp, nil, function(code, data)
    if (code < 0) then
      print("Restarting because of http error: "..code)
      node.restart()
    else
      print(code, data)
    end

    -- send data from next DS1820 sensor
    node.task.post(sendDataDS1820)
  end)
end

function sendDataForAllDS1820()
  print("Sending data for DS1820 sensors.")
  
  tmr.wdclr()
  
  local sensorID = nil
  local sensorAddr = nil
  
  for sensorID, sensorAddr in pairs(sensors) do
    table.insert(tmpSensors, sensorID)
  end

  -- send data for all sensors
  node.task.post(sendDataDS1820)
end

function sendDataForDHT()
  print("Sending data for DHT sensor.")
  
  status, temp, humi, temp_dec, humi_dec = dht.read(GPIO_DHT)
  if status == dht.OK then
    t = string.format("%d.%03d", math.floor(temp), temp_dec)
    h = string.format("%d.%03d", math.floor(humi), humi_dec)
    id = node.chipid()
    print("Sending id="..id.." t="..t.." h="..h)
    
    tmr.wdclr()
    http.get("http://"..HOST_NAME.."/rest/measurement/"..id.."?temperature="..t.."&humidity="..h, nil, function(code, data)
      if (code < 0) then
        print("Restarting because of http error: "..code)
        node.restart()
      else
        print(code, data)
      end
    end)
  end
end

function sendDataForAll()
  if (GPIO_DS1820 ~= nil) then
    sendDataForAllDS1820()
  end
  if (GPIO_DHT ~= nil) then
    sendDataForDHT()
  end
end

if (GPIO_DS1820 ~= nil) then
  ds1820.setup(GPIO_DS1820)
  sensors=ds1820.addrs()
end
tmpSensors={}

tmr.alarm(0, SEND_PERIOD, 1, function() sendDataForAll() end )
sendDataForAll()

