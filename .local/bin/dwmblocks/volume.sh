#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color9^";
fg="^c$foreground^";

status=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)\].*/\1/')
level=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')

if [ $status == 'off' ]
then
    i='';
    printf "%s%s%sMute  \n" "$c9" "$i" "$fg"
elif [ $status == 'on' ]
then
    if [ $level == 0 ]
    then
	i=''
    elif [ $level -gt 0 ]
    then
	i='' 
    fi
    printf "%s%s%s%s%%  \n" "$c9" "$i" "$fg" "$level"
fi
