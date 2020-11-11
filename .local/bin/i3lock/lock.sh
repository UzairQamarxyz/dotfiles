#!/bin/sh

/usr/bin/i3lock \
    --image=$HOME/.cache/i3lock/blur.png	\
    --no-unlock-indicator	    \
    --clock	\
    --timestr="%I:%M %p"    \
    --datestr="%A, %m %Y"   \
    --date-align 0	\
    --time-align 0	\
    --date-font='Noto Sans'   \
    --time-font='Noto Sans Medium'   \
    --timesize=54   \
    --datesize=18  \
    --datecolor=#ffffffff	\
    --timecolor=#ffffffff   \
    --ignore-empty-password	\
    --pass-media-keys   \
    --pass-screen-keys  \
    --pass-power-keys 
