#!/bin/bash

# MC_NAME=minecraft
# DIR=/home/maxio/mc/server
# SCRIPT_DIR=/home/maxio/mc/scripts
# STATUS_DIR=/home/maxio/mc/scripts/status.sh
# JAVA=JAVA_VERSION=17
# JAR_NAME=server.jar
# Xmx=2048M #max
# Xms=1024M #min

STATUS=`screen -ls`
# if echo $STATUS | grep -q minecraft; then
if grep -q minecraft <<< "$STATUS" ; then
#if screen session exists echo on
echo "on"
else
#if screen session exists echo off
echo "off"
fi