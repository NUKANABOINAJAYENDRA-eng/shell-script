#!/bin/bash


#installng mysql by shell-script

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error:: please run the cmd with root access"
    exit 1
fi

#it is our responsibility to check installation is success or not
yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "the installion is a failure"
    eixt 1
else 
    else "installation is success"
fi