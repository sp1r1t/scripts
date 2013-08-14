#!/bin/bash

# get battery information
acpi=$(acpi -b)

if [ "$(echo $acpi | grep 100%)" != "" ]; then
    acpi="i haz charged to the full!"
# only print percent if acpi has no time for (dis)charge yet (this happens right after (un)plugging)
elif [ "$(echo $acpi | grep zero)" != "" ]; then
    acpi=$(echo $acpi | sed 's_^.*\([0-9][0-9]%\).*$_\1_')

# sed for discharging
elif [ "$(echo $acpi | grep Discharging)" != "" ]; then
    acpi=$(echo $acpi | sed 's_Battery [0-9]*: Discharging, \(.*\), \([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\) .*$_\1 v \2_')

# sed for charging
elif [ "$(echo $acpi | grep Charging)" != "" ]; then
    acpi=$(echo $acpi | sed 's_Battery [0-9]*: Charging, \(.*\), \([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\).*$_\1 ^ \2_')
fi

# output result
echo $acpi