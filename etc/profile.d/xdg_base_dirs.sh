#!/usr/bin/env sh

# Adds `$HOME/.local/.bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERMINAL_PROG="alacritty"
export BROWSER="librewolf"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
# Add GOPATH to PATH
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export HISTFILE="$XDG_DATA_HOME/history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.

export DOOMDIR="$XDG_CONFIG_HOME/doom"

# Android
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

# AWS
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
