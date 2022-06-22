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
if [ $ON_OFF == "on" ]; then #if1

    echo "SERVER JUZ DZIALA"

elif [ $ON_OFF == "off" ]; then #if1

    #start sesji
    screen -dmS $MC_NAME
    # #sprawdzanie miejsca
    screen -S $MC_NAME -X stuff "cd $DIR\n"
    # #server start
    screen -S $MC_NAME -X stuff "$JAVA -Xmx$Xmx -Xms$Xms -jar $JAR_NAME nogui\n"

    echo "SERVER STARTUJE"

        case $1 in

            -n | n | -nogui | nogui)

                    #nogui

            ;;

            *)

                #with gui
                while true ; do #while1

                    sleep 0.5
                    
                    console_function "Done"
                    if [ $VAR == "yes" ] ; then #if2

                        echo -n " `awk -F '[()]' '{printf $2}' <<< "$CONSOLE_LOG"`"
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