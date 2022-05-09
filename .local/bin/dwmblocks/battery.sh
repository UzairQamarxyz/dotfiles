#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color4^"
fg="^c$foreground^"

status="$(cat /sys/class/power_supply/AC/online)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"

case $status in
1) i='  ' ;;
0) case ${battery} in
    [9][0-9]|100) i='  ' ;;
    [8][0-9]) i='  ' ;;
    [7][0-9]) i='  ' ;;
    [6][0-9]) i='  ' ;;
    [5][0-9]) i='  ' ;;
    [4][0-9]) i='  ' ;;
    [3][0-9]) i='  ' ;;
    [2][0-9]) i='  ' ;;
    [1][0-9]) i='  ' ;;
    [0-9]) i='  ' ;;
    *) i='  ' ;;
    esac ;;
esac
printf  "%s%s%s%s%% \n" "$c9" "$i" "$fg" "$battery"
