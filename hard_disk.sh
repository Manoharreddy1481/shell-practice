#!/bin/bash
disk_usage=$(df -hT | grep xfs)
disk_treshold=5
while IFS= read -r line
do  
    usage=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    partition_name=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $usage -ge $disk_treshold ]
    then
        echo "$partition_name is used more than the $disk_threshold, so, current usage is $usage, please check"

    fi
done <<<$disk_usage