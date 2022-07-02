export ZSH=~/.config/zsh

autoload -U select-word-style
select-word-style bash

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# If NumLock is off, translate keys to make them appear the same as with NumLock on.
bindkey -s '^[OM' '^M'  # enter
bindkey -s '^[Ok' '+'
bindkey -s '^[Om' '-'
bindkey -s '^[Oj' '*'
bindkey -s '^[Oo' '/'
bindkey -s '^[OX' '='

# If someone switches our terminal to application mode (smkx), translate keys to make
# them appear the same as in raw mode (rmkx).
bindkey -s '^[OH' '^[[H'  # home
bindkey -s '^[OF' '^[[F'  # end
bindkey -s '^[OA' '^[[A'  # up
bindkey -s '^[OB' '^[[B'  # down
bindkey -s '^[OD' '^[[D'  # left
bindkey -s '^[OC' '^[[C'  # right

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^U'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward
bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history
bindkey '^[[B'    down-line-or-beginning-search # down       next command in history


# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH/plugins/fzf/fzf.plugin.zsh
source $ZSH/plugins/aws/aws.plugin.zsh
source $ZSH/plugins/docker/docker.plugin.zsh
source $ZSH/plugins/docker-compose/docker-compose.plugin.zsh
source $ZSH/plugins/python/python.plugin.zsh
source $ZSH/plugins/emacs/emacs.plugin.zsh
source $ZSH/plugins/git/git.plugin.zsh
source $ZSH/plugins/terraform/terraform.plugin.zsh

fpath=($ZSH/plugins/zsh-completions/src $fpath)
fpath=($ZSH/plugins/terraform/ $fpath)
fpath=($ZSH/plugins/docker-compose/ $fpath)

zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)PS1}
zstyle ':completion::complete:*' gain-privileges 1

fpath+=$ZSH/themes/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# Theme
ZSH_THEME="typewritten"
TYPEWRITTEN_PROMPT_LAYOUT="pure"
TYPEWRITTEN_CURSOR="beam"

# History
HISTFILE=~/.local/share/zsh/history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_all_dups

# Aliases
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias doom="~/.emacs.d/bin/doom"
#alias emacs="/usr/bin/emacsclient -c"
alias bat="bat --theme=ansi --color=always"
alias sudo='sudo -v; sudo '

alias ssh="TERM=xterm-256color ssh"

alias ls="exa --icons"
alias ll="exa --icons -l"
alias lsa="exa --icons -a"
alias lsg="exa --icons --git-ignore"
alias lsd="exa --icons -D"
