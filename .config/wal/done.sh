#!/bin/sh

# Source the colors from wal
. "${HOME}/.cache/wal/colors.sh"

# =================================================
# Symlink config files so programs can be started
# without referencing the cache directly
# =================================================

mkdir -p  "${HOME}/.config/zathura"
mkdir -p  "${HOME}/.config/alacritty"
mkdir -p  "${HOME}/.config/termite"
mkdir -p  "${HOME}/.config/dunst"

ln -sf "${HOME}/.cache/wal/zathurarc" "${HOME}/.config/zathura/zathurarc"
ln -sf "${HOME}/.cache/wal/colors.yml" "${HOME}/.config/alacritty/alacritty.yml"
ln -sf "${HOME}/.cache/wal/termite" "${HOME}/.config/termite/config"
ln -sf "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"
ln -sf "${HOME}/.cache/wal/colors.Xresources" "${HOME}/.Xresources"
