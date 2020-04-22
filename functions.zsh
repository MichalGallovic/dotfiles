heroku_remote() {
  heroku git:remote -a $1
}

cheat() {
  curl cheat.sh/$1
}

# Javascript
eslint_disable() {
  echo "// eslint-disable-next-line $1" | pbcopy
}

