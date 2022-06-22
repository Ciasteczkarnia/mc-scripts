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

saving_done () {

    while true ; do #while1

            sleep 0.5
            
            console_function "$1"

            if [ $VAR == "yes" ] ; then #if2

                echo "$2"
                break

            else #if2

                echo -n "."

            fi #if2

    done #while1

}

status_function
if [[ $ON_OFF == "on" ]] ; then

    case $1 in

        -f | -force)

            screen -S $MC_NAME -X stuff "stop\n"
            echo "*stop*"
            saving_done "All dimensions are saved" "DONE"

            #stoping screen session
            screen -S $MC_NAME -X stuff "exit\n"
            echo "*exit*"


            echo "SERVER ZOSTAL ZATRZYMANY PRZYMUSOWO xD"

        ;;

        *)

            screen -S $MC_NAME -X stuff "save-off\n"
            echo "*save-off*"
            saving_done "is now disabled" "DONE"

            screen -S $MC_NAME -X stuff "save-all\n"
            echo "*save-all*"
            saving_done "Saved the game" "DONE"

            screen -S $MC_NAME -X stuff "save-on\n"
            echo "*save-on*"
            saving_done "is now enabled" "DONE"

            screen -S $MC_NAME -X stuff "stop\n"
            echo "*stop*"
            saving_done "All dimensions are saved" "DONE"

            #stoping screen session
            screen -S $MC_NAME -X stuff "exit\n"
            echo "*exit*"

        ;;

    esac

    status_function
    if [[ $ON_OFF == "on" ]] ; then
    
            echo "PROCES Z SERWEREM NADAL TRWA, PROBA ZABICIA PROCESU"
            while true ; do #while1

                sleep 0.5
                
                status_function
                if [ $ON_OFF == "off" ] ; then #if2

                    echo "ZABIJANIE ZAKONCZONE"
                    break

                else #if2

                    PID="`grep "$MC_NAME" <<< $LS_INFO | awk -F\. '{printf $1}'`" #not very proud
                    
                    for i in $PID ; do
                        echo "ZABIJANIE PROCESU $i"
                        kill $i
                    done

                fi #if2

            done #while1

        echo "SERWER ZOSTAL ZATRZYMANY POPRAWNIE (zabicie procesu)"

    else

        echo "SERWER ZOSTAL ZATRZYMANY POPRAWNIE"
    
    fi

elif [[ $ON_OFF == "off" ]] ; then

    echo "SERVER JUZ NIE DZIALA"

else

    echo "COS NIE DZIALA"
   
fi