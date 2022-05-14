#!/bin/bash

icon_color="^C4^"
fg_color="^C15^"

status=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)\].*/\1/')
level=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')

if [ $status == 'off' ]; then
    i='婢  '
    echo -n "${icon_color}${i}${fg_color}Mute"
elif [ $status == 'on' ]; then
    if [ $level -le 33 ]; then
        i='奄  '
    elif [ $level -le 66 ]; then
        i='奔  '
    elif [ $level -le 100 ]; then
        i='  '
    fi
    echo -n "${icon_color}${i}${fg_color}${level}%"
fi
