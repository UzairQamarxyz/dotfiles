#!/bin/bash

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color9^"
fg="^c$foreground^"
i='󰸗  '

date="$(date "+%A, %d %B")"
printf "%s%s%s%s  \n" "$c9" "$i" "$fg" "$date"
