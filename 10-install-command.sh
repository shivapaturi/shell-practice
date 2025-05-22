#!/din/bash

userid= $(id -u)
if [$userid -ne 0]
then
    echo "Error:: please run this script with root user"
else
    echo "You are running with root user"
fi
# installin
dnf install mysql -y

