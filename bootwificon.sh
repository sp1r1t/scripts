#!/bin/bash

sudo ifconfig wlan0 up
string=$(sudo iwlist wlan0 scan | grep "red leader")
if [ -n "$string" ]; then
    echo "you're at home, baby"
    sudo wpa_connecnt home
fi