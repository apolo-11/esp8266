# esp8266

This repository contains couple of projects with the ESP 8266 chip.

## Projects
* **lib** - Common libraries used in another projects.
* **temperature-sensor** - Temperature sensor with DS 1820 which sends data to remote server over HTTP.
* **temperature-sensor-with-interrupt** - Similar to temperature-sensor. It deep sleeps the ESP to save the battery. The timer must be connected to reset otherwise the ESP will sleep forever. Not suitable for ESP-01!
* **weather-forecast** - Shows weather forecast on an OLED display. Weather forecast is awailable only for cities in Czech Repuplic.

## Links
* NodeMCU documentation: http://nodemcu.readthedocs.io/en/master/en/
* Tool to make customized firmware: https://nodemcu-build.com/
