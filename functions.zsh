heroku_remote() {
  heroku git:remote -a $1
}

cheat() {
  curl cheat.sh/$1
}
