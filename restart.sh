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

    #stop script
    source "$SCRIPT_DIR/stop.sh"
    #start script
    source "$SCRIPT_DIR/start.sh"

    echo "SERVER DZIALA"

elif [ $STATUS == "off" ]; then

    echo "SERVER NIE DZIALA, NIE MOZNA ZRESTARTOWAC"

else

    echo "COS NIE DZIALA"
    
fi
