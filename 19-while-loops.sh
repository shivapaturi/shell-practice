#!/bin/bash

# a=0

# while [ $a -lt 10 ]
# do
#     echo $a
#     a=$((a + 1))
# done

while IFS=read -r line
do
    echo $line
done < 18-delete-old-logs.sh