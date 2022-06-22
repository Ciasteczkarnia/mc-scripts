#!/bin/bash

# MC_NAME=minecraft
# DIR=/home/maxio/mc/server
# SCRIPT_DIR=/home/maxio/mc/scripts
# STATUS_DIR=/home/maxio/mc/scripts/status.sh
# JAVA=JAVA_VERSION=17
# JAR_NAME=server.jar
# Xmx=2048M #max
# Xms=1024M #min

source "`dirname "$BASH_SOURCE"`/settings.txt"
source "$SCRIPT_DIR/status.sh"

status_function
if [[ $ON_OFF == "on" ]]; then

    screen -r $MC_NAME

elif [[ $ON_OFF == "off" ]]; then

    echo "SERVER NIE DZIALA"

else


    echo "COS NIE DZIALA"
   
fi