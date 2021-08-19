# Default programs:
export TERMINAL="alacritty"
export BROWSER="iridium-browser"
export READER="zathura"

# dotbare
export DOTBARE_DIR="$HOME/Documents/git/.cfg/"
export DOTBARE_PREVIEW="bat --theme=ansi-dark --color=always {}"

# XDG_BASE_DIRECTORY

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

#EMACS
export DOOMDIR="$XDG_CONFIG_HOME"/doom

#ANDROID
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Neovim
export VISUAL=nvim
export EDITOR="$VISUAL"
export UNCRUSTIFY_CONFIG="$XDG_CONFIG_HOME"/uncrustify/uncrustify.cfg

# Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Cleanup
#XAUTHORIY
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#WINE
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
#DOCKER
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
#ZSH HISTORY FILE
export HISTFILE="$XDG_DATA_HOME"/zsh/history
#GTKRC FILES
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
#JAVA
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#X
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
#GO
export GOPATH="$XDG_DATA_HOME"/go
#CARGO
export CARGO_HOME="$XDG_DATA_HOME"/cargo
#GNUPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#GRADLE
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
#NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#GPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#WGET
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
#XINIT
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

# RUN STARTX
if [[ "$(tty)" == "/dev/tty1" ]]; then
        pgrep dwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
