#!/bin/bash

# test internet connection
inet=0
if ping -W 3 -c 1 8.8.8.8 >/dev/null; then
    inet=1
    #echo "connected to the interwebz"
#else
    #echo "no webz connection"
fi

if [ $inet -eq 1 ]; then
    offlineimap -o 
fi