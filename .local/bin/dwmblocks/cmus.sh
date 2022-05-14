#!/bin/bash

icon_color="^C4^"
fg_color="^C15^"

ARTIST=$(cmus-remote -Q | grep -a '^tag artist' | awk '{gsub("tag artist ", "");print}')
#STATUS=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}')
TRACK=$(cmus-remote -Q | grep -a '^tag title' | awk '{gsub("tag title ", "");print}')

i='ﱘ  '

if pgrep cmus >/dev/null && [ "$TRACK" == "" ]; then
    echo -n "${icon_color}${i}${fg_color}N/A"
else
    echo -n "${icon_color}${i}${fg_color}${ARTIST} - ${TRACK}"
fi
