DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.cache/.oh-my-zsh"

# Theme
ZSH_THEME="typewritten"
export TYPEWRITTEN_CURSOR="beam"

# Prevent duplicate History
setopt hist_ignore_all_dups

# Plugins
plugins=(git
        zsh-completions
        history-substring-search
        zsh-syntax-highlighting
        fzf
        npm
        yarn
        yarn-autocompletions
        dotbare
        docker
        docker-compose
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source $HOME/.cache/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.cache/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#   Aliases
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias dbu="dotbare add -u"
alias dba="dotbare add"
alias dbm="dotbare commit -m"
alias dbp="dotbare push origin $(current_branch)"
alias dbs="dotbare status"
alias doom="~/.emacs.d/bin/doom"

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
