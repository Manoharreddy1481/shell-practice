#!/bin/bash

DISK_USAGE=$(df -ht | grep xfs)
Disk_THRESHOLD=5
while IFS = read -r line;
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION_NAME=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    IF [ $USAGE -gt $Disk_THRESHOLD ]
    then
        echo "$PARTITION_NAME is greater then $Disk_THRESHOLD, current value is $USAGE, Please check"
    fi
done<<<$DISK_USAGE