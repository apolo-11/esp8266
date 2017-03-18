require('ds1820')

-- read the configuration
dofile("config.lc")

function sendData()
  tmr.wdclr()

  sensorID, sensorAddr = next(sensors);
  if (sensorID == nil) then
    local sleepTime = SEND_PERIOD * 1000 - tmr.now()
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

  print("Sending temp: "..sensorID .. ": "..temp.." C")
  tmr.wdclr()
  http.get("http://"..HOST_NAME.."/rest/measurement/"..sensorID.."?temperature="..temp, nil, function(code, data)
    if (code < 0) then
      print("Restarting because of http error: "..code)
      node.restart()
    else
      print(code, data)
    end

    -- send data from next DS1820 sensor
    node.task.post(sendData)
  end)
end

ds1820.setup(GPIO_DS1820)
sensors=ds1820.addrs()
node.task.post(sendData)
