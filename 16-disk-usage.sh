#!/bin/bash

LOGFILES_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILES_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USEAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USEAGE_THRESHOLD=5

#IFS - Internal file seperator in space
while IFS= read line 
do
    echo "output: $line"
done <<< $DISK_USEAGE
