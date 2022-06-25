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

backup_local() {
  rsync -aW --progress --exclude=node_modules --exclude=vendor --exclude=bower_components --exclude=venv --exclude=.env $1 $2
}
