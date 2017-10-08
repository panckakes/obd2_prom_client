from prometheus_client import start_http_server, Summary
from prometheus_client import Gauge
import barometer
import random
import time

import ms5611, util

util.check_apm()

temp = barometer.temp
pres = barometer.pressure

# Create a guage to track temp of ambient air
mtemp = Gauge('navio_barometer_temp', 'Tracks amibent temp')

# Create a guage to track pressure of ambient air
mpres = Gauge('navio_barometer_pressure', 'Tracks amibent pressure')


if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(8000)
    # Generate requests.
    while True:
        process_request(random.random())
        mtemp.set(float(temp()))
        mpres.set(float(pres()))