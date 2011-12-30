#!/bin/bash

if [ $# -ge 1 ]; then 
    time=$1
else
    echo "Using default time 00:00:00"
    time=00:00:00
fi

if [ $# -ge 2 ]; then
    day=$2
else
    echo -n "Using current day: "
    echo $(date +"%a %d.")
fi

goal=$(date --date="$(date +"%a %b %d") $time $(date +"%Z %Y")" +%s)
start=$(date +%s)

tleft=`expr $goal - $start`

echo $tleft