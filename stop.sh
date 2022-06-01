#!/bin/bash

# MC_NAME=minecraft
# DIR=/home/maxio/mc/server
# SCRIPT_DIR=/home/maxio/mc/scripts
# STATUS_DIR=/home/maxio/mc/scripts/status.sh
# JAVA=JAVA_VERSION=17
# JAR_NAME=server.jar
# Xmx=2048M #max
# Xms=1024M #min

source /home/maxio/mc/scripts/settings.txt
STATUS=`$STATUS_DIR`

if [ $STATUS == "on" ]; then

    screen -S $MC_NAME -X stuff "save-off\n"
    echo "save-off"
    sleep 2

    screen -S $MC_NAME -X stuff "save-all\n"
    echo "save-all"
    sleep 5

    screen -S $MC_NAME -X stuff "save-on\n"
    echo "save-on"
    sleep 2

    screen -S $MC_NAME -X stuff "stop\n"
    echo "stop"
    sleep 10

    #stoping screen session
    screen -S $MC_NAME -X stuff "exit\n"
    echo "exit"


    echo "SERVER ZOSTAL ZATRZYMANY"

elif [ $STATUS == "off" ]; then

    echo "SERVER JUZ NIE DZIALA"

else

    echo "COS NIE DZIALA"
   
fi