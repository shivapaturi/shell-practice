#!/bin/bash

# SOURCE_DIR=/home/ec2-user/app-logs

# FILE_TO_DELETE=$(find $SOURCE_DIR -name "*.js" -mtime +14)

# while IFS= read -r filepath
# do
#     rm -rf $filepath
# done <<< FILE_TO_DELETE



SOURCE_DIR="/home/ec2-user/app-logs"

# Use find and feed it directly into the loop
find "$SOURCE_DIR" -name "*.js" -mtime +14 | while IFS= read -r filepath
do
    echo "Deleting: $filepath"
    rm -f "$filepath"
done


