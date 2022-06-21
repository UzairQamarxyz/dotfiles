# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

xrdb ~/.config/X11/.Xresources
# Default programs:
export TERMINAL="alacritty"
export BROWSER="chromium"
export READER="zathura"
export LANG='en_US.UTF-8'

# dotbare
export DOTBARE_DIR="$HOME/Documents/git/.cfg/"
export DOTBARE_PREVIEW="bat --theme=ansi-dark --color=always {}"

# XDG_BASE_DIRECTORY

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export PATH=$PATH:$HOME/.local/bin

#EMACS
export DOOMDIR="$XDG_CONFIG_HOME"/doom

# Neovim
export VISUAL=nvim
export EDITOR="$VISUAL"
export UNCRUSTIFY_CONFIG="$XDG_CONFIG_HOME"/uncrustify/uncrustify.cfg

# Cleanup
#XAUTHORIY
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#WINE
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
#DOCKER
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
#ZSH HISTORY FILE
export HISTFILE="$XDG_DATA_HOME"/zsh/history
#GTKRC FILES
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK_USE_PORTAL=1
#X
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
#GNUPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#GPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#WGET
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
#XINIT
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

#RUN STARTX
#if [[ "$(tty)" == "/dev/tty1" ]]; then
#	if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#          pgrep dwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
#	fi
#fi
