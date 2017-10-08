#!/bin/bash
# This script runs a client side prometheus sever

# setting up enviroment variables for clear code
SOURCEDIR=/home/pi/dev/obd2
PROMDIR=/home/pi/dev/obd2/prom
PYTHON=/usr/bin/python
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"     #current working directory

clear

printf "Checking to see if promethes server is running\n\n"

#prints out the processes that match '[/]home/pi/dev/obd2/prom/prom.py' that is not the grep process itself
ps aux | grep '[/]home/pi/dev/obd2/prom/prom.py'

#check to see if prom.py is running as daemon
if [ $(ps aux | grep '[/]home/pi/dev/obd2/prom/prom.py' | awk '{print $2}') ]
then
    printf "\nThe prometheus server is already running\n\n"
else
    printf "Starting prometheus client server as a service (prom.py)\n\n"
    # line to launch prom server as daemon
    setsid $PYTHON $PROMDIR/prom.py >/dev/null 2>&1 < /dev/null &
    exit
fi

#give user option to kill running prometheus process
read -p "(1) to exit script -- (2) to kill the prometheus service: `echo $'\n> '`" answer
case ${answer:0:1} in
    y|Y|1 )
        printf "exiting script"
    ;;
    n|N|2 )
        printf "killing prometheus service\n"

        printf "printing services that match prom\n"
        ps ax | grep prom

        printf "Killing prom service\n"
        kill $(ps aux | grep '[p]rom' | awk '{print $2}')

        #Check to see if prom service is still active
        if [ $(ps aux | grep '[/]home/pi/dev/obd2/prom/prom.py' | awk '{print $2}') ]
        then
            printf "\nThe prometheus server is still running\n\n"
        fi

        printf "prometheus server was killed\n"
    ;;
esac