#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "Error:: Please run this script with root access"
    exit 1 #give other than 0 up to 127
else
    echo "You are running with root user"
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "Installing $2 is.. SUCCESS"
else
    echo "Installing $2 is.. FAIL"
    exit 1
fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed...going to install it"
    dnf install mysql -y
    VALIDATE &? "MYSQL"
else
    echo "MYSQL is already installed... nothing to do"
    
fi

if [ $? -ne 0 ]
then 
    echo "python3 is not installed...going to install it"
    dnf install python3 -y
    VALIDATE &? "python3"
else
    echo "python3 is already installed... nothing to do"
    
fi

if [ $? -ne 0 ]
then 
    echo "ngnix is not installed...going to install it"
    dnf install ngnix -y
    VALIDATE &? "ngnix"
else
    echo "ngnix is already installed... nothing to do"
    
fi