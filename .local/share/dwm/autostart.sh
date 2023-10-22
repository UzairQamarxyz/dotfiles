#! /usr/bin/env sh

xsetroot -cursor_name left_ptr
feh --no-fehbg --bg-fill '/home/uzair/Pictures/wallpaper.png'
/nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
dwmblocks
