#!/bin/sh

status="$(cat /sys/class/power_supply/AC/online)"
battery="$(cat /sys/class/power_supply/BAT1/capacity)"

printf "Bat: %s%%(%s) \n" "$battery" "$status"
