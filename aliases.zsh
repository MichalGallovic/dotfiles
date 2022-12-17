# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias brew_bundle="brew bundle --file $DOTFILES/Brewfile"

# Laravel
alias art="php artisan"

# Git
alias git_empty="git commit --allow-empty -m "
# 10 last branches I've committed to 
alias git_last="git branch --sort=-committerdate | head -n 10"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Aws
alias awsp="aws --profile cantrill-iamadmin-production"
alias awsg="aws --profile cantrill-iamadmin-general"

# Tratta
source ~/.dotfiles/tratta-aliases.zsh
