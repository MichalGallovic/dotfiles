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
alias add="git add . --all"
alias commit="git commit"
alias checkout="git checkout"
alias pull="git pull"
alias push="git push origin HEAD"
alias merge="git merge"
alias status="git status"
upstream() {
  git branch --set-upstream-to=origin/$1 $1
}
alias git_empty="git commit --allow-empty -m "
alias wip="add && commit -m 'wip' && push"
alias master="checkout master"
# 10 last branches I've committed to 
alias git_last="git branch --sort=-committerdate | head -n 10"
alias git_last_tag="git tag --sort=-committerdate | head -n 10 | sort -Vr | head -n 1"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

