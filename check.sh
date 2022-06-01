#!/bin/bash

# MC_NAME=minecraft
# DIR=/home/maxio/mc/server
# SCRIPT_DIR=/home/maxio/mc/scripts
# CHECK_DIR=/home/maxio/mc/scripts/check.sh
# JAVA=JAVA_VERSION=17
# JAR_NAME=server.jar
# Xmx=2048M #max
# Xms=1024M #min

CHECK=`screen -ls`
if echo $CHECK | grep -q minecraft; then
#if screen session exists echo on
echo "on"
else
#if screen session exists echo off
echo "off"
fi