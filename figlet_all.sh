#!/bin/bash

if [ $# -lt 1 ]; then
    text="muh"
else
    for i in $*; do
        text=`echo $text $i`
    done
fi

dir=/usr/share/figlet

list=`ls -1 /usr/share/figlet | grep .flf | sed 's/\.flf$//'`

for font in $list; do
    echo $font
    figlet -f $font $text
done