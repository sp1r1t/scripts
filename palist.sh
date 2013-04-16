#!/bin/bash

pacmd list-sink-inputs | grep -e index -e application.process.binary | sed 's/[ |\t]//g' | sed 's/^index://g' | sed 's/^.*="//'