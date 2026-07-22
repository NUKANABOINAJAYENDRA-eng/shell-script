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
DISK_USEAGE_THRESHOLD=1
message=
#IFS - Internal file seperator in space
while IFS= read line 
do
    #echo "output: $line"

    #this cmd will give usage in number (instead of %)
    usage=$(echo $line | awk '{print $1}' | cut -d % -f1)

    #this cmd will giev us partition
    partition=$(echo $line | awk '{print $1}')
    #now u need to check whether it is more than usage or not
    if [ $usage -gt $DISK_USEAGE_THRESHOLD ];
    then
        message+="HIGH DISK USAGE ON $partition: $usage"
    fi

done <<< $DISK_USEAGE

echo "message: $message"