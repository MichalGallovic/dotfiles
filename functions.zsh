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

csv_to_sqlite() {
  sqlite-utils insert $1.db accounts $1 --csv --sniff $2
}

csv_to_datasette() {
  csv_to_sqlite $1 $2 && _datasette $1.db
}

_datasette() {
  datasette $1 --setting sql_time_limit_ms 10000 --setting facet_time_limit_ms 10000 -o
}

llmcommit() {
  # Generate commit message using LLM from staged diff
  local tmpfile
  tmpfile=$(mktemp)

  git --no-pager diff --cached | llm -m gpt-4o "Write a concise Git commit message summarizing these staged changes" > "$tmpfile"
  git commit --edit -F "$tmpfile"

  rm "$tmpfile"
}

json() {
  echo $1 | jq . | pbcopy
}

xml() {
  echo "$1" | xmllint --format - | pbcopy
}
