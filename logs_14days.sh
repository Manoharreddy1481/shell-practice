#!/bin/bash
folder=/home/ec2-user/logs
if [ -d $folder ]
then
    echo "$folder is exist"
else
    echo "$folder is does not exist"
    exit 1
fi
files=$(find $folder -name "*.log" -mtime +14)
    echo "files are : $files"
    while IFS= read -r file
    do
        echo "deleting the file : $file"
        rm -rf $file
    done <<<$files
        

