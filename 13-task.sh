#!/bin/bash

#the task is given for practicing shell-shript

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILES=/tmp/$SCRIPT_NAME-$DATE.log

R= "\e[31m"
G= "\e[32m"
N= "\e[0m"
Y= "\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " $R $2.... FAILURE $N"
    else
        echo -e " $y $2... SUCCESS $N"
    fi
}


if [ $USERID -ne 0 ]
then 
    echo "error:: the instalation is a failure"
    exit 1
fi

PACKAGES=("git, nginx, postfix, tomcat, mysql")

for i in "${PACKAGES[@]}"
do 
    if rpm -q "$PACKAGES" &>>$LOGFILES
    then 
        echo "$PACKAGES is already installed"
    else
        echo "$PACKAGES is installing"
    fi
done 

