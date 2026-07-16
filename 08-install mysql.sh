#!/bin/bash


#installng mysql by shell-script

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error:: please run the cmd with root access"
    exit 1
#else 
    #echp "the instalation is sucess"
fi

#it is our responsibility to check installation is success or not
yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "the installion is a failure"
    eixt 1
else 
    echo  "the installion is success"
fi


#installing postfix
yum install postfix -y

if [ $? -ne 0 ]
then 
    echo "the installion is a failure"
    eixt 1
else 
    echo  "the installion is success"
fi