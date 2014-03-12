#!/bin/bash

# get status
fullbat=`cat /sys/class/power_supply/BAT0/energy_full`
fullbat="$fullbat.0" # for python to interpret this as float
currentbat=`cat /sys/class/power_supply/BAT0/energy_now`
charging=`cat /sys/class/power_supply/BAT0/status`

# calc percentage
charge=$(python -c "print $currentbat / $fullbat")
batlow=$(python -c "print $charge < 0.06")

percent=$(python -c "print $charge * 100" | cut -d"." -f 1)
date=`date +"%Y/%m/%d %H:%M:%S"`

echo -n $date "" >> /var/log/scripts.log
if [ $charging == "Charging" ]; then
    echo "battery charging, $percent%" >> /var/log/scripts.log
elif [ "$batlow" == "False" ]; then
    echo "battery discharging, $percent%" >> /var/log/scripts.log
else
    echo "battery is critical, $percent%, going into hibernate" >> /var/log/scripts.log
    sudo hibernate
fi
