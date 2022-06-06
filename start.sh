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

if [ $STATUS == "on" ]; then #if1

    echo "SERVER JUZ DZIALA"

elif [ $STATUS == "off" ]; then #if1

    #start sesji
    screen -dmS $MC_NAME
    #sprawdzanie miejsca
    screen -S $MC_NAME -X stuff "cd $DIR\n"
    #server start
    screen -S $MC_NAME -X stuff "$JAVA java -Xmx$Xmx -Xms$Xms -jar $JAR_NAME nogui\n"

    echo "SERVER STARTUJE"

        case $1 in

            -n | n | -nogui | nogui)

                    #nogui

            ;;

            *)

                #with gui
                while true ; do #while1

                    sleep 0.5

                    START_TEXT=`tail -n 3 $DIR/logs/latest.log`

                    if grep -q Done <<< "$START_TEXT" ; then #if2

                        echo -n " `awk -F '[()]' '{printf $2}' <<< "$START_TEXT"`"
                        #newline
                        echo -e
                        break

                    else #if2

                        echo -n "."

                    fi #if2

                done #while1

            ;;

        esac


            echo "SERWER WYSTARTOWAŁ"

else #if1

    echo "COS NIE DZIALA"

fi #if1