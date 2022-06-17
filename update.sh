#!/bin/bash

source /home/maxio/mc/scripts/settings.txt
source $SCRIPT_DIR/status.sh

LAST_VERSION=`curl -s 'GET' "https://api.papermc.io/v2/projects/paper/versions/1.19" -H 'accept: application/json' | jq -r '.builds | max'`
SHA256_NEW=`curl -s 'GET' "https://api.papermc.io/v2/projects/paper/versions/1.19/builds/$LAST_VERSION" -H 'accept: application/json' | jq -r '.downloads.application.sha256'`
SHA256_OLD=`sha256sum -z $DIR/server.jar | awk '{print $1}'`


function update () {
    if [ $SHA256_NEW != $SHA256_OLD ]; then

        echo "STARTING THE UPDATE......."
        echo "REMOVING server.jar"
        rm -rf $DIR/server.jar

        echo "DOWNLOADING NEW server.jar"
        curl -s -L https://api.papermc.io/v2/projects/paper/versions/1.19/builds/$LAST_VERSION/downloads/paper-1.19-$LAST_VERSION.jar --output $DIR/server.jar

        echo "DONE"

    else

        echo "server.jar IS UP TO DATE"

    fi
}


if [[ $ON_OFF == "on" ]]; then

    case $1 in #case1

        -f | f | -force | force)

            source $SCRIPT_DIR/stop.sh f
            
            #update function
            update

        ;;

        *)

            echo "SERVER DZIALA, CZY CHCESZ GO WYLACZYC?"
            read -p "Enter [tak/nie]: " STOP_ANSWER

            case $STOP_ANSWER in #case2
                
                -tak | tak | t | -yes | yes | y)

                    echo "CZY CHCESZ SFORSOWAĆ STOP?"
                    read -p "Enter [tak/nie]: " STOP_ANSWER
                    
                    if [[ $STOP_ANSWER =~ ("yes"|"y"|"tak"|"t") ]] ; then
                        source $SCRIPT_DIR/stop.sh f
                    else
                        source $SCRIPT_DIR/stop.sh
                    fi

                    #update function
                    update

                ;;
            
                *)

                    echo "NIE MOZNA ZAKTUALIZOWAC"

                ;;

            esac #case2

        ;;

    esac #case1

elif [[ $ON_OFF == "off" ]]; then

        echo "SERWER JEST WYŁĄCZONY"
        #update function
        update

else

    echo "COS NIE DZIALA"
   
fi

#start script
source $SCRIPT_DIR/start.sh