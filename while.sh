#!/bin/bash

flag=0

while [ $flag -lt 10 ]
do      
	echo $flag
	flag=$(($flag + 1))
        echo $flag
        sleep 0.5
done
