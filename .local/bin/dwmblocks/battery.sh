#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color9^"
fg="^c$foreground^"

status="$(cat /sys/class/power_supply/AC/online)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"

case $status in
1) i='  ' ;;
0) case ${battery%?} in
    [90-100]) i='  ' ;;
    [80-90]) i='  ' ;;
    [70-80]) i='  ' ;;
    [60-70]) i='  ' ;;
    [50-60]) i='  ' ;;
    [40-50]) i='  ' ;;
    [30-40]) i='  ' ;;
    [20-30]) i='  ' ;;
    [10-20]) i='  ' ;;
    [0-10]) i='  ' ;;
    *) i='  ' ;;
    esac ;;
esac
printf "%s%s%s%s%% \n" "$c9" "$i" "$fg" "$battery"
