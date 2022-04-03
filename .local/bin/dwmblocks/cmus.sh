#!/bin/bash

# A dwm_bar function that shows the current artist, track, position, duration, and status from cmus
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: cmus

# Source colors from pywal
source "${HOME}/.cache/wal/colors.sh"
c9="^c$color9^"
fg="^c$foreground^"

#ARTIST=$(cmus-remote -Q | grep -a '^tag artist' | awk '{gsub("tag artist ", "");print}')
#STATUS=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}')
TRACK=$(spotify-now -i "%artist - %title")

i='  '

if pgrep cmus >/dev/null && [ "$TRACK" == "" ]; then
    printf "%s%s%sN/A    \n" "$c9" "$i" "$fg"
else
    printf "%s%s%s%s  \n" "$c9" "$i" "$fg" "${TRACK}"
fi
