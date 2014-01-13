#!/bin/bash

# get status
fullbat=`cat /sys/class/power_supply/BAT0/energy_full`
fullbat="$fullbat.0" # for python to interpret this as float
currentbat=`cat /sys/class/power_supply/BAT0/energy_now`

# calc percentage
percent=$(python -c "print $currentbat / $fullbat")
batlow=$(python -c "print $percent < 0.05")

if [ "$batlow" == "False" ]; then
    #echo "battery is fine"
else
    echo "battery is critical, going into hibernate"
    sudo hibernate
fi
