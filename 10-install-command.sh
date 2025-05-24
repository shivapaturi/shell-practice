#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "Error:: Please run this script with root access"
    exit 1 #give other than 0 up to 127
else
    echo "You are running with root user"
fi

dnf install mysql -y

