#!/bin/bash

ifdown wlan0
iwconfig wlan0 essid attwifi
ifup wlan0