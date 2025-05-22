#!/bin/bash

userid=$(id -u)
if [$userid -ne 0]
then
    echo "Error:: Please run this script with root access"
else
    echo "You are running with root user"
fi
# installing
dnf install mysql -y

