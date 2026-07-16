#!/bin/bash

#checking the number is gerater than 7 or not
Number=$1

if [ $Number -gt 7 ]
then
    echo "$Number is greater than 7"
else
    echo "$Number is less than 7"
fi