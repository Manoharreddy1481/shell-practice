#!/bin/bash
for num in {2..100};
do 
    for (i=2; i<num; i++);
    do
        if (num%i==0)
        then
            continue 2
        fi
    done
echo $num
done