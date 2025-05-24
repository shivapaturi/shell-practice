#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[47m" # white or normal(N) colour 47 or 0 can be used

if [ $USERID -ne 0 ]
then
    echo -e "$R Error:: Please run this script with root access $W"
    exit 1 #give other than 0 up to 127
else
    echo "You are running with root user"
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is..$G SUCCESS $W"
else
    echo -e "Installing $2 is..$R FAIL $W"
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
    echo -e "Nothing to do MYSQL.. $Y already installed $W"
    
fi

if [ $? -ne 0 ]
then 
    echo "python3 is not installed...going to install it"
    dnf install python3 -y
    VALIDATE &? "python3"
else
    echo -e "Nothing to do python3.. $Y already installed $W"
    
fi

if [ $? -ne 0 ]
then 
    echo "ngnix is not installed...going to install it"
    dnf install ngnix -y
    VALIDATE &? "ngnix"
else
    echo -e "Nothing to do ngnix.. $Y already installed $W"
    
fi