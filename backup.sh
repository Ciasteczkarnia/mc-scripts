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

screen_cmd () {
    screen -S $MC_NAME -X stuff "$1\n"
}

if [ $STATUS == "on" ]; then

        screen_cmd "save-off"
        echo "*save-off*"
        sleep 2

        screen_cmd "save-all"
        echo "*save-all*"
        sleep 5

        echo "TRWA TWORZENIE BACKUPU"
        tar -cpzf $BACKUP_DIR/server-$(date +%F-%H-%M).tar.gz -C $DIR/.. server
        echo "KONIEC TWORZENIA BACKUPU"

        screen_cmd "save-on"
        echo "*save-on*"
        sleep 2

elif [ $STATUS == "off" ]; then

    echo "SERVER NIE DZIALA"

else

    echo "COS NIE DZIALA"
   
fi
