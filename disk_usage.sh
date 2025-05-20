#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
Disk_THRESHOLD=5
while IFS = read -r line
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION_NAME=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $Disk_THRESHOLD ]
    then
        echo "$PARTITION_NAME is greater then $Disk_THRESHOLD, current value is $USAGE, Please check"
    fi
done <<< $DISK_USAGE

# #!/bin/bash

# DISK_USAGE=$(df -hT | grep xfs)
# DISK_THRESHOLD=5 #real projects, it is usually 75


# while IFS= read -r line #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
# do
#     USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
#     PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
#     if [ $USAGE -ge $DISK_THRESHOLD ]
#     then
#         echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
#     fi
# done <<< $DISK_USAGE