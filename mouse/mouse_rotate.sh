#!/bin/bash

function abs {
    echo "$i" | nawk '{ print ($1 >= 0) ? $1 : 0 - $1}'
}

base=90
xdotool click 1
xdotool mousedown 1

for j in `seq 0 90`; do
    #section 1
    for i in `seq -- 0 -1 -9`; do
        x=$i
        a=$(abs $i)
        y=$(($a - 10))
        #echo "x $x  $y"
        xdotool mousemove_relative -- $x $y
    done
    
#section 2
    for i in `seq -- -10 -1`; do
        x=$i
        a=$(abs $i)
        y=$(($x + 10))
        #echo "x $x  $y"
        xdotool mousemove_relative -- $x $y
    done
    
    #section 3
    for i in `seq -- 0 9`; do
        x=$i
        y=$((10 - $x))
        #echo "x $x  $y"
        xdotool mousemove_relative -- $x $y
    done
    
    #section 4
    for i in `seq -- 10 -1 1`; do
        x=$i
        a=$(abs $i)
        y=$(($a - 10))
        #echo "x $x  $y"
        xdotool mousemove_relative -- $x $y
    done
done

xdotool mouseup 1    

