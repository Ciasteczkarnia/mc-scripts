#!/bin/bash
source /home/maxio/mc/settings.txt

#SERVER STOP
screen -S $MC_NAME -X stuff "save-off\n"
sleep 2
screen -S $MC_NAME -X stuff "save-all\n"
sleep 5
screen -S $MC_NAME -X stuff "save-on\n"
sleep 2
screen -S $MC_NAME -X stuff "stop\n"
sleep 10
screen -S $MC_NAME -X stuff "exit\n"
