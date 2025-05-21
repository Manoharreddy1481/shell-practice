#!/bin/bash
source_dir=/home/ec2-user/logs
if [ -d $source_dir ]
then
    echo " $source_dir exist"
else
    echo " $source_dir does not exist"
    exit 1
fi
files=$(find $source_dir -name "*.log" -mtime +14)
echo " files are : $files
while IFS= read -r file
do
    echo "deleting file $file"
    rm -rf $file
done <<<$files