#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # in project it will be 75
MSG=""

while IFS= read line
do
    USAGE=$(echo $line | awk '{print$6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print$7}')

    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MSG+="High disk utilistion on $PARTITION: $USAGE%\n"
    fi
done <<< $DISK_USAGE

if [ -n "$MSG" ]; then
    echo -e "$MSG"
fi