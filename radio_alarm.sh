#!/bin/bash

if [ $# -lt 1 ]; then
    # print usage
    echo "usage: ./`basename $0` <hours to sleep>"
    exit
else
    # set sleep time
    sleeptime=`echo "$1 * 60 * 60" | bc`
    
    # cut rational part
    if [ `echo $sleeptime | grep "\."` ]; then
        sleeptime=`echo $sleeptime | cut -d '.' -f1`
    fi
fi

# current time
hour=`date +%H`
minute=`date +%M`

echo "it's now $hour:$minute"

# convert input
var=$1
if [ `echo $var | grep "\."` ]; then
    varInt=`echo $var | cut -d '.' -f1`
    varRest=`echo $var | cut -d '.' -f2`
    varFirstPlace=`echo $varRest | cut -c1`
else
    varInt=$var
    varRest=0
    varFirstPlace=0
fi


# calc new minutes
if [ $varFirstPlace -eq 0 ]; then
    newminutes=0
else
    newminutes=$((6 * $varFirstPlace))
fi

# set wakeup time
wakehour=$(($hour + $varInt))
wakeminute=$(($minute + $newminutes))

# check minute overflow in wakeuptime
if [ $wakeminute -ge 60 ]; then
    wakehour=$(($wakehour + 1))
    wakeminute=$(($wakeminute - 60))
fi


printf "sleeping %d seconds until %2d:%02d\n" "$sleeptime" "$wakehour" "$wakeminute"

sleep $sleeptime; iceweasel http://www.jazzradio.com/smoothlounge