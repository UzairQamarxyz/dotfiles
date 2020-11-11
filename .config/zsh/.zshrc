# Path to your oh-my-zsh installation.
export ZSH="$HOME/.cache/.oh-my-zsh"

# Theme
ZSH_THEME="typewritten"
export TYPEWRITTEN_CURSOR="block"


# Prevent duplicate History
setopt hist_ignore_all_dups

# Plugins
plugins=(git 
    history-substring-search 
    zsh-syntax-highlighting
    fzf
    npm
    yarn
    yarn-autocompletions
    dotbare
)

source $ZSH/oh-my-zsh.sh
source $HOME/.cache/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.cache/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#   Aliases
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias dbf="dotbare fadd -f"
alias dbd="dotbare fadd -d"
alias dbm="dotbare commit -m"
alias dbom="dotbare push -u origin master"

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
