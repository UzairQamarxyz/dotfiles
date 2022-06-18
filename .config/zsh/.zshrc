# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Theme
ZSH_THEME="typewritten"
TYPEWRITTEN_PROMPT_LAYOUT="pure"
TYPEWRITTEN_CURSOR="beam"

# History
HISTFILE=~/.local/share/zsh/history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_all_dups

# Plugins

# Load colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' list-colors
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)PS1}
zstyle ':completion::complete:*' gain-privileges 1

for plugin in $(\ls $XDG_CONFIG_HOME/zsh/plugins/)
do
	source $XDG_CONFIG_HOME/zsh/plugins/$plugin/$plugin.plugin.zsh
done

fpath+=$XDG_CONFIG_HOME/zsh/theme/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# Home, End, Del Keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# ALT+Left/Right
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# ALT+Del
bindkey '^[^?' backward-kill-word

# CTRL+Del
bindkey '^[[3;5~' kill-word

# Prefix search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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
