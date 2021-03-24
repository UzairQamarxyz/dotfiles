#!/bin/bash

ethstatus="$(cat /sys/class/net/enp0s25/operstate)"
wifistatus="$(cat /sys/class/net/wlp3s0/operstate)"
#wifissid="$(nmcli -t -f name,device connection show --active | grep wlp3s0 | cut -d\: -f1)"
#wifiperc="$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70)}')"

if [ $ethstatus == "up" ]; then
    printf "Ethernet  "
elif [ "$wifistatus" == "down" ]; then
    printf "No Internet  "
fi
if [ $wifistatus == "up" ]; then
    printf "Wifi  "
fi
