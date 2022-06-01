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

    echo "SERVER JUZ DZIALA"

elif [ $STATUS == "off" ]; then

    #start sesji
    screen -dmS $MC_NAME
    #sprawdzanie miejsca
    screen -S $MC_NAME -X stuff "cd $DIR\n"
    #server start
    screen -S $MC_NAME -X stuff "$JAVA java -Xmx$Xmx -Xms$Xms -jar $JAR_NAME nogui\n"

    echo "SERVER STARTUJE"

else

    echo "COS NIE DZIALA"

fi