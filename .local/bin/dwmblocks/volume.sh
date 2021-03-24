#!/bin/bash

status=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)\].*/\1/')
level=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')

if [ $status == 'off' ]; then
    printf "Mute  "
elif [ $status == 'on' ]; then
    printf "Vol:%s%%  " "$level"
fi
