#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1  # set to 75 in production
MSG=""
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read -r line; do
    USAGE=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo "$line" | awk '{print $7}')
    if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
        MSG+="High Disk Usage on $PARTITION: $USAGE % <br>"  # HTML line break
    fi
done <<< "$DISK_USAGE"

# If message is non-empty, send alert
if [ -n "$MSG" ]; then
    sh mail.sh "DevOps Team" "High Disk Usage" "$IP" "$MSG" "shivapaturi8@gmail.com" "ALERT - High Disk Usage"
fi
