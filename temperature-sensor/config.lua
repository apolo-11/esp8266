-- GPIO for the DS1820 temperature sensor.
-- GPIO_0 = 3 (use for ESP-02)
-- GPIO_2 = 4 (use for ESP-01 because it is not working properly with GPIO_0). 
GPIO_DS1820 = nil

-- GPIO for the DHT21 temperature and humidity sensor.
GPIO_DHT = 4

-- How often is data measured and sent to remote server.
SEND_PERIOD = 5 * 60 * 1000

-- Server to sent data to.
HOST_NAME = "teplomer.apolo-11.cz"
