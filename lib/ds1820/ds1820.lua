--------------------------------------------------------------------------------
-- DS18B20 one wire module for NODEMCU
-- NODEMCU TEAM
-- LICENCE: http://opensource.org/licenses/MIT
-- Vowstar <vowstar@nodemcu.com>
-- 2015/02/14 sza2 <sza2trash@gmail.com> Fix for negative values
--------------------------------------------------------------------------------

-- Set module name as parameter of require
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------------------------------------
-- Local used variables
--------------------------------------------------------------------------------
-- DS18B20 dq pin
local pin = nil
-- DS18B20 default pin
local defaultPin = 9
--------------------------------------------------------------------------------
-- Local used modules
--------------------------------------------------------------------------------
-- Table module
local table = table
-- String module
local string = string
-- One wire module
local ow = ow
-- Timer module
local tmr = tmr
-- Limited to local environment
setfenv(1,M)
--------------------------------------------------------------------------------
-- Implementation
--------------------------------------------------------------------------------
C = 0
F = 1
K = 2
function setup(dq)
  pin = dq
  if(pin == nil) then
    pin = defaultPin
  end
  ow.setup(pin)
end

function addrs()
  local count = 0
  local addrs = {}
  local addr = nil
  
  setup(pin)
  ow.reset_search(pin)
  
  repeat
    addr = ow.search(pin)
    if(addr ~= nil) then
      crc = ow.crc8(string.sub(addr,1,7))
      if (crc == addr:byte(8)) then
        sensor = ""
		for j = 1,7 do sensor = sensor .. string.format("%02x", addr:byte(j)) end
		if(addrs[sensor] == nil) then
	      -- print("Found: "..sensor)
		  addrs[sensor]=addr
		end
	  end
    else
	  count = count + 1
	end
	tmr.wdclr()
  until(count > 20)
  
  ow.reset_search(pin)
  
  return addrs
end

function readNumber(addr, unit)
  setup(pin)
  flag = false
  if(addr == nil) then
    ow.reset_search(pin)
    count = 0
    repeat
      count = count + 1
      addr = ow.search(pin)
      tmr.wdclr()
    until((addr ~= nil) or (count > 100))
    ow.reset_search(pin)
  end
  if(addr == nil) then
    return "NA"
  end
  crc = ow.crc8(string.sub(addr,1,7))
  if (crc == addr:byte(8)) then
    if ((addr:byte(1) == 0x10) or (addr:byte(1) == 0x28)) then
      -- print("Device is a DS18S20 family device.")
      ow.reset(pin)
      ow.select(pin, addr)
      ow.write(pin, 0x44, 1)
      tmr.delay(850000)
      present = ow.reset(pin)
      ow.select(pin, addr)
      ow.write(pin,0xBE,1)
      -- print("P="..present)
      data = nil
      data = string.char(ow.read(pin))
      for i = 1, 8 do
        data = data .. string.char(ow.read(pin))
      end
      --print(data:byte(1,9))
      crc = ow.crc8(string.sub(data,1,8))
      -- print("CRC="..crc)
      if (crc == data:byte(9)) then
        t = (data:byte(1) + data:byte(2) * 256)
        if (t > 32767) then
          t = t - 65536
        end
        if(unit == nil or unit == C) then
          t = t * 625
        elseif(unit == F) then
          t = t * 1125 + 320000
        elseif(unit == K) then
          t = t * 625 + 2731500
        else
          return nil
        end
        t1 = t / 10000
	    t2 = (t >= 0 and t % 10000) or (10000 - t % 10000)
        temperature = "" .. t1 .. "." .. string.format("%04d", t2)
		if (temperature == "85.0000") then
    	  return "NA"
	    else
	      return temperature
	    end
      end
      tmr.wdclr()
    else
     --print("Device family is not recognized.")
    end
  else
   --print("CRC is not valid!")
  end
  
  return "NA"
end

function read(addr, unit)
  t = readNumber(addr, unit)
  if (t == nil) then
    return nil
  else
    return t
  end
end

-- Return module table
return M
