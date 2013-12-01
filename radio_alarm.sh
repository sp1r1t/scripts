#!/bin/bash

if [ $# -lt 1 ]; then
    echo "usage: ./`basename $0` <hours to sleep>"
else
    sleeptime=`echo "$1 * 60 * 60" | bc`
fi

echo "sleeping $sleeptime seconds"

sleep $sleeptime; iceweasel http://www.jazzradio.com/smoothlounge