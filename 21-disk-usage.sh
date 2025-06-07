#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # in project it will be 75
MSG=""
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
    USAGE=$(echo $line | awk '{print$6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print$7}')

    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MSG+="High Disk Usage on $PARTITION: $USAGE\n"
    fi
done <<< $DISK_USAGE

#echo -e $MSG

sh mail.sh "DevOps Team" "High Disk Usage" $IP $MSG "shivarocks.kumar54@gmail.com" "Alert High Disk Usage"