#!/bin/bash

# check root
if [ $UID -ne 0 ]; then
    echo "don't try to run this without superuser powers"
    exit 1
fi

echo "get available aps"
avail=`iwlist wlan0 scan | grep -i -e essid | sed 's/.*:"\(.*\)".*/\1/'`
IFS='
'
aps=`cat /home/jinn/.wifisec | sed 's/.*,\(.*\),.*/\1/'`

br=0
ap=""

echo "search one to connect"
for i in $aps; do
    for j in $avail; do
        if [ "$i" == "$j" ]; then
            echo "found ap $i"
            ap=`cat /home/jinn/.wifisec | grep $i | sed 's/\(.*\),.*,.*/\1'/`
            br=1
            break
        fi
    done
    if [ $br -eq 1 ]; then
        break
    fi
done

if [ "$ap" != "" ]; then
    /scripts/wpa_connect -n $ap
fi
IFS=