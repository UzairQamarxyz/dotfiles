#!/bin/bash

icon_color="^C4^"
fg_color="^C15^"

i='  '

date="$(date "+%A, %d %B")"
echo -n "${icon_color}${i}${fg_color}${date}"
