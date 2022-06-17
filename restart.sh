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
source $SCRIPT_DIR/status.sh

if [ $ON_OFF == "on" ]; then #1

        case $1 in

            -f* | f* | -force* | force*)

                #force stop script
                source $SCRIPT_DIR/stop.sh -f

            ;;

            *)

                #stop script
                source $SCRIPT_DIR/stop.sh

            ;;

        esac
        

    source $SCRIPT_DIR/status.sh #renew
    #start script
    if [ $ON_OFF == "off" ]; then #2

        case $1$2 in

            *-n | *n | *-nogui | *nogui)

                #nogui
                source $SCRIPT_DIR/start.sh -n

            ;;

            *)

                #with gui
                source $SCRIPT_DIR/start.sh

            ;;

        esac

    else #2

        echo "SERWER NIE URUCHOMIL SIE, COS NIE DZIALA!!!"

    fi #2

elif [ $ON_OFF == "off" ]; then #1

    echo "SERVER NIE DZIALA, NIE MOZNA ZRESTARTOWAC"

else #1

    echo "COS NIE DZIALA"
    
fi #1
