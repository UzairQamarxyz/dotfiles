#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color4^"
fg="^c$foreground^"

ethstatus="$(cat /sys/class/net/enp3s0/operstate)"
wifistatus="$(cat /sys/class/net/wlp4s0/operstate)"
wifissid="$(nmcli -t -f name,device connection show --active | grep wlp4s0 | cut -d\: -f1)"
wifiperc="$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70)}')"

if [ $ethstatus == "up" ]; then
    i='  '
    printf "%s%s%sEthernet    \n" "$c9" "$i" "$fg"
elif [ "$wifistatus" == "down" ]; then
    i='睊  '
    printf "%s%s%sNo Internet  \n" "$c9" "$i" "$fg"
fi
if [ $wifistatus == "up" ]; then
    if [ "$wifiperc" -ge 0 ] && [ "$wifiperc" -le 25 ]; then
        i="  "
    elif [ "$wifiperc" -ge 33 ] && [ "$wifiperc" -le 50 ]; then
        i="  "
    elif [ "$wifiperc" -ge 33 ] && [ "$wifiperc" -le 75 ]; then
        i="  "
    elif [ "$wifiperc" -ge 66 ] && [ "$wifiperc" -le 100 ]; then
        i="  "
    fi
    printf "%s%s%s%s  \n" "$c9" "$i" "$fg" "$wifissid"
fi
