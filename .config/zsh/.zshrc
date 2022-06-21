#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Theme
ZSH_THEME="typewritten"
TYPEWRITTEN_PROMPT_LAYOUT="pure"
TYPEWRITTEN_CURSOR="beam"

# History
HISTFILE=~/.local/share/zsh/history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_all_dups

#   Aliases
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias doom="~/.emacs.d/bin/doom"
#alias emacs="/usr/bin/emacsclient -c"
alias bat="bat --theme=ansi --color=always"
alias cat="bat"
alias sudo='sudo -v; sudo '

#   Directory Shortcuts
alias cm="cd ~/Music/"
alias cg="cd ~/Documents/git/"
alias cu="cd ~/Documents/Uni/"
alias cw="cd ~/Pictures/wallpapers/"
alias cls="cd ~/.local/share/"
alias clb="cd ~/.local/bin/"
alias cdw="cd ~/Downloads/"
alias ccn="cd ~/.config/"
alias cch="cd ~/.cache/"

alias ssh="TERM=xterm-256color ssh"

alias ls="exa --icons"
alias ll="exa --icons -l"
alias lsa="exa --icons -a"
alias lsg="exa --icons --git-ignore"
alias lsd="exa --icons -D"
