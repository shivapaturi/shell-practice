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
if [ $? -eq 0 ]
then
    echo "Installing MYSQL is.. SUCCESS"
else
    echo "Installing MYSQL is.. FAIL"
    exit 1
fi