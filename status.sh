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

data_renew () {

    LS_INFO=`screen -ls`
    CONSOLE_LOG=`tail -n 10 $DIR/logs/latest.log`

}

data_renew #always renew on source


status_function () { # $1 - what to find 

    data_renew
    if grep -q $MC_NAME <<< "$LS_INFO" ; then
        
        ON_OFF="on"

    else

        ON_OFF="off"

    fi
}

console_function () { # $1 - what to find 

    data_renew
    if grep -q "$1" <<< "$CONSOLE_LOG" ; then

        VAR="yes"

    else

        VAR="no"

    fi
}







case $1 in

    -gui | gui | -g | g)

        status_function
        echo "SERVER JEST $ON_OFF"
    
    ;;
    
esac