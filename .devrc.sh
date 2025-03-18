#!/bin/zsh

export EDITOR="vim"
export PATH=$PATH:$HOME/go/bin
export ZSH_THEME="simple"
export DISABLE_AUTO_TITLE=true

precmd() {
  echo -ne "\033];${PWD##*/}\007"
}

alias g=git
alias m=make
alias t=terraform
alias ya=yarn
alias json='python -m json.tool'
alias urlen='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias lsports='lsof -i -n -P |head -1 && lsof -i -n -P |grep --color=never LISTEN'

alias pg='docker exec -it $(docker ps -a -f name=postgres --no-trunc -q) bash -c "psql -U postgres"'
alias redis='docker exec -it $(docker ps -a -f name=redis --no-trunc -q) bash -c "redis-cli"'

function seek() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep.* $1" |grep $1
  fi
}

function kall() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep.* $1" |awk {'print "kill "$1'} |sh
  fi
}

function listpath () {
  for line in ${PATH//:/$'\n'}; do
    echo $line
  done
}

function sizeof() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

function server() {
  local port="${1:-3000}"
  open "http://localhost:${port}/" &
  python3 -m http.server ${port}
}
