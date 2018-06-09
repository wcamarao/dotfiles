# nocorrect
# noglob

export EDITOR="vim"
export MANPAGER="less -X"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# zsh
export ZSH_THEME="simple"

# iterm directory pane titles
export DISABLE_AUTO_TITLE=true
precmd() {
  echo -ne "\033];${PWD##*/}\007"
}

# utils
alias g=git
alias json='python -m json.tool'
alias urlen='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias lsports='lsof -i -n -P |head -1 && lsof -i -n -P |grep --color=never LISTEN'

# projects
alias cdc='cd $GOPATH/src/github.com/curated'
alias cdp='cd $HOME/Projects'
alias cdw='cd $GOPATH/src/github.com/wcamarao'
alias pg='docker exec -it $(docker ps -a -f name=postgres --no-trunc -q) bash -c "psql -U postgres"'
alias redis='docker exec -it $(docker ps -a -f name=redis --no-trunc -q) bash -c "redis-cli"'

# dv
export VAULT_ADDR='http://127.0.0.1:8200'
alias cdl='cd $GOPATH/src/gitlab.com/lodg'
eval "$(direnv hook zsh)"

# list matching processes by name
function seek() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep.* $1" |grep $1
  fi
}

# kill matching processes by name
function kall() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep.* $1" |awk {'print "kill "$1'} |sh
  fi
}

# list path entries
function listpath () {
  for line in ${PATH//:/$'\n'}; do
    echo $line
  done
}

# determine size of file or directory
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

# serve directory via http, optionally specifying the port
function server() {
  local port="${1:-3000}"
  open "http://localhost:${port}/" &
  python -m SimpleHTTPServer ${port}
}
