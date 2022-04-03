#!/bin/bash
dunst &                                # dunst for notifications
xset r rate 200 80 &                   # Speed xrate up
unclutter &                            # Remove mouse when idle
xss-lock ~/.local/bin/i3lock/lock.sh & # Run xss-lock
dwmblocks &                            # Run the statusbar
/usr/bin/emacs --daemon &              # Run the emacs server
pulseaudio --start                     # Start pulseaudio
numlockx on

/usr/lib/kdeconnectd &
setxkbmap -option caps:escape               # Set Capslock to Escape
xgamma -rgamma 0.85 -ggamma 0.85 -bgamma 1  # Set gamma
feh --bg-fill ~/Pictures/wallpaper.png      # Set wallpaper
picom -cb --shadow-exclude "x = 0 && y = 0 && override_redirect = true" --focus-exclude "x = 0 && y = 0 && override_redirect = true"
