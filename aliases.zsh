# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias tbe="z tratta-backend && phpstorm ."
alias tfe="z revport-frontend && code ."

# Laravel
alias artisan="php artisan"

# Git
alias git_empty="git commit --allow-empty -m "

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Aws
alias awsp="aws --profile cantrill-iamadmin-production"
alias awsg="aws --profile cantrill-iamadmin-general"
