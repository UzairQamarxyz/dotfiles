#!/bin/sh

TRACK=$(cmus-remote -Q | grep -a '^tag title' | awk '{gsub("tag title ", "");print}')

printf "%s  \n" "${TRACK}"
