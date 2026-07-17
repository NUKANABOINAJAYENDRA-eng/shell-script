#!/bin/bash

#using validate function

#This created for understanding well about validate function.

#special functions

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

# this function shoul validate the previous cmd and inform user it is success or a failure.
VALIDATE(){
    #1 --> it will recive the argument-1
    if [ $1 -ne 0 ]
    then
            echo "$2...FAILURE"
            exit 1
    else
        echo "$2...success"
    fi
}


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error:: please run the cmd with root access"
    exit 1
#else 
    #echo "the instalation is sucess"
fi

#it is our responsibility to check installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing mysql"

#installing postfix
yum install postfix -y &>>$LOGFILE

VALIDATE $? "installing postfix"