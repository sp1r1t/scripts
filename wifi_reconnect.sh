#!/bin/bash

ret=`ping -c 1 192.168.66.1`

if [ $ret -ne 0 ]; then
    wpa_connect home
fi