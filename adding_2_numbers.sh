#!/bin/bash
NUMBER1=$1
NUMBER2=$2
sum=$(($NUMBER1+$NUMBER2))
echo "sum is: $sum"
echo " All variables: $@"
echo " count of variables: $#"
echo " script Nmae: $0"
echo "process instance id: $$"
echo "PID of the last background command: $!"
echo " state of a previos command: $?"
