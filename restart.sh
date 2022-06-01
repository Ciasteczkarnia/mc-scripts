#!/bin/bash

# MC_NAME=minecraft
# DIR=/home/maxio/mc/server
# SCRIPT_DIR=/home/maxio/mc/scripts
# CHECK_DIR=/home/maxio/mc/scripts/check.sh
# JAVA=JAVA_VERSION=17
# JAR_NAME=server.jar
# Xmx=2048M #max
# Xms=1024M #min

source /home/maxio/mc/scripts/settings.txt
CHECK=`$CHECK_DIR`


if [ $CHECK == "on" ]; then

    #stop script
    source "$SCRIPT_DIR/stop.sh"
    #start script
    source "$SCRIPT_DIR/start.sh"

    echo "SERVER DZIALA"

elif [ $CHECK == "off" ]; then

    echo "SERVER NIE DZIALA, NIE MOZNA ZRESTARTOWAC"

else

    echo "COS NIE DZIALA"
    
fi
