#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color4^"
fg="^c$foreground^"
i='  '

time="$(date "+%I:%M%p")"
printf "%s%s%s%s  \n" "$c9" "$i" "$fg" "$time"
