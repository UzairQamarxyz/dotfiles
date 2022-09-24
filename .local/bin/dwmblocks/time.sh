#!/bin/bash

icon_color="^C4^"
fg_color="^C15^"

i='  '

time="$(date "+%I:%M%p")"
echo -n "${icon_color}${i}${fg_color}${time}    "
