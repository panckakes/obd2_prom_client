"""
Provided to you by Emlid Ltd (c) 2014.
twitter.com/emlidtech || www.emlid.com || info@emlid.com
Example: Get pressure from MS5611 barometer onboard of Navio shield for Raspberry Pi
To run this example navigate to the directory containing it and run following commands:
sudo python Barometer_example.py
"""

import time

import ms5611, util

util.check_apm()

baro = ms5611.MS5611()
baro.initialize()

def temp():
	baro.refreshTemperature()
	time.sleep(0.01) # Waiting for temperature data ready 10ms
	baro.readTemperature()

	baro.calculatePressureAndTemperature()

	return baro.TEMP

def pressure():
	baro.refreshPressure()
	time.sleep(0.01) # Waiting for pressure data ready 10ms
	baro.readPressure()

	baro.calculatePressureAndTemperature()

	return baro.PRES
