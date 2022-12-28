#!/bin/sh
set -x

run() {
	[ -z "$(pidof "$*")" ] && "$@" &
}
run /usr/lib/xfce4/notifyd/xfce4-notifyd
run unclutter
run dwmblocks
run emacs --daemon
run xfce4-power-manager
run /usr/lib/kdeconnectd
run /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
run picom -cb --shadow-exclude "x = 0 && y = 0 && override_redirect = true" --focus-exclude "x = 0 && y = 0 && override_redirect = true"

xset r rate 200 80 &                        # Speed xrate up
pulseaudio --start                          # Start pulseaudio
setxkbmap -option caps:escape               # Set Capslock to Escape
xgamma -rgamma 0.85 -ggamma 0.85 -bgamma 1  # Set gamma
feh --bg-fill ~/Pictures/wallpaper.png      # Set wallpaper
numlockx on
