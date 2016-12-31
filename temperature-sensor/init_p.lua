function unrequire(m)
	package.loaded[m] = nil
	_G[m] = nil
end

require('wifisetup')
wifisetup.setup(function()
  unrequire('wifisetup')
  dofile("sensor.lc")
end)
