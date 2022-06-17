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

LS_INFO=`screen -ls`
START_TEXT=`tail -n 10 $DIR/logs/latest.log`

# if screen ls = on
if grep -q minecraft <<< "$LS_INFO" ; then
#if screen session exists echo on
    ON_OFF="on"

    
else
#if screen session exists echo off
    ON_OFF="off"
    
fi

if grep -q Done <<< "$START_TEXT" ; then

    START="done"

else

    START="error"

fi

case $1 in

    -gui | gui | -g | g)

        echo "SERVER JEST $ON_OFF"
    
    ;;
    
esac