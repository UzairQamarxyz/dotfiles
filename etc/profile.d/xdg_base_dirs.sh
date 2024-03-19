#!/usr/bin/env sh

# Adds `$HOME/.local/.bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERMINAL_PROG="alacritty"
export BROWSER="floorp"

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
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export HISTFILE="$XDG_DATA_HOME/history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.

export DOOMDIR="$XDG_CONFIG_HOME/doom"
