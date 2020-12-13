heroku_remote() {
  heroku git:remote -a $1
}

heroku_config() {
  heroku config:set $1
}

cheat() {
  curl cheat.sh/$1
}

# Javascript
eslint_disable() {
  echo "// eslint-disable-next-line $1" | pbcopy
}

phpv() {
    valet stop
    brew unlink php@7.0 php@7.1 php@7.2 php@7.4
    brew link --force --overwrite $1
    brew services start $1
    composer global update
    rm -f ~/.config/valet/valet.sock
    valet install
}

backup_local() {
  rsync -av --delete --exclude=node_modules --exclude=.git --exclude=vendor $1 $2
}
