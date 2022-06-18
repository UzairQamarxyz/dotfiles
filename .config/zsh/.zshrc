# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Theme
ZSH_THEME="typewritten"
TYPEWRITTEN_PROMPT_LAYOUT="pure"
TYPEWRITTEN_CURSOR="beam"

# Prevent duplicate History
setopt hist_ignore_all_dups

# Plugins
autoload -U compinit && compinit

for plugin in $(\ls $XDG_CONFIG_HOME/zsh/plugins/)
do
	source $XDG_CONFIG_HOME/zsh/plugins/$plugin/$plugin.plugin.zsh
done

fpath+=$XDG_CONFIG_HOME/zsh/theme/typewritten
autoload -U promptinit; promptinit
prompt typewritten

#   Aliases
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias doom="~/.emacs.d/bin/doom"
#alias emacs="/usr/bin/emacsclient -c"
alias bat="bat --theme=ansi --color=always"
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
