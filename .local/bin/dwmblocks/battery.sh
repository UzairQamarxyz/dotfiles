#!/bin/sh

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color9^";
fg="^c$foreground^";

status="$(cat /sys/class/power_supply/AC/online)"
battery="$(cat /sys/class/power_supply/BAT1/capacity)"

case $status in
    1) i='' ;;
    0) case ${battery%?} in
        [6-9]) i='' ;;
        [1-5]) i='' ;;
            *) i=''
       esac
esac
printf "%s%s%s%s%% \n" "$c9" "$i" "$fg" "$battery"
