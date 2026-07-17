#!/bin/bash

#the task is given for practicing shell-shript

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILES=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " $R $2.... FAILURE $N"
    else
        echo -e " $y $2... SUCCESS $N"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo -e " $R error:: please run with root access $N"
    exit 1
fi


for i in $@
do
    if $i installed
    then
        echo -e " $Y $@ is already installed $N "
    else
        yum install $i -y
    fi

done
