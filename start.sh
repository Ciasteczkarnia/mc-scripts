#!/bin/bash
source /home/maxio/mc/settings.txt

#START SESJI 
screen -dmS $MC_NAME
#SPRAWDZANIE MIEJSCA
screen -S $MC_NAME -X stuff "cd $DIR\n"
#SERVER START
screen -S $MC_NAME -X stuff "$JAVA java -Xmx$Xmx -Xms$Xms -jar $JAR_NAME nogui\n"