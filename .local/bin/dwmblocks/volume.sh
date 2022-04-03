#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color9^"
fg="^c$foreground^"

status=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)\].*/\1/')
level=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')

if [ $status == 'off' ]; then
    i='婢  '
    printf "%s%s%sMute  \n" "$c9" "$i" "$fg"
elif [ $status == 'on' ]; then
    if [ $level -le 33 ]; then
        i='奄  '
    elif [ $level -le 66 ]; then
        i='奔  '
    elif [ $level -le 100 ]; then
        i='  '
    fi
    printf "%s%s%s%s%% \n" "$c9" "$i" "$fg" "$level"
fi
