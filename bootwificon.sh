#!/bin/bash

ifconfig wlan0 up
string=$(iwlist wlan0 scan)
wifi=$(echo $string  | grep "red leader")
if [ -n "$wifi" ]; then
    echo "you're at home, baby"
    wpa_connect home
fi
wifi=$(echo $string  | grep "looong cat")
if [ -n "$wifi" ]; then
    echo "mifi tiem"
    wpa_connect mifi
fi
wifi=$(echo $string  | grep "shaolin3")
if [ -n "$wifi" ]; then
    echo "amitufo"
    wpa_connect sta3
fi
