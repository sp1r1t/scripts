#!/bin/bash

# test internet connection
inet=0
if ping -W 3 -c 1 8.8.8.8 &> /dev/null; then
    echo 1
else
    echo 0
fi
