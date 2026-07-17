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
        echo -e " installing $2....$R FAILURE $N"
    else
        echo -e " installing $2... $Y SUCCESS $N"
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
    yum list installed $i  &>>LOGFILES
    if [ $? -ne 0 ]
    then
        echo " $i is not installed, just go and install it"
        yum install $i -y  &>>$LOGFILES
    else
        echo -e "$Y $i is already installed $N"
    fi

done
