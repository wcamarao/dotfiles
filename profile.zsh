# nocorrect
# noglob

export EDITOR="vim"
export MANPAGER="less -X"
export ZSH_THEME="simple"

alias json='python -m json.tool'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias lsports='lsof -i -n -P |head -1 && lsof -i -n -P |grep --color=never LISTEN'
alias pg='docker exec -it $(docker ps -a -f name=postgres --no-trunc -q) bash -c "psql -U postgres"'
alias redis='docker exec -it $(docker ps -a -f name=redis --no-trunc -q) bash -c "redis-cli"'

# List all matching processes by name
function seek() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep.* $1" |grep $1
  fi
}

# Kill all matching processes by name
function kall() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep.* $1" |awk {'print "kill "$1'} |sh
  fi
}

# List all path entries
function listpath () {
  for line in ${PATH//:/$'\n'}; do
    echo $line
  done
}

# Determine size of a file or total size of a directory
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

# Serve a directory via http, optionally specifying the port
function server() {
  local port="${1:-3000}"
  open "http://localhost:${port}/" &
  python -m SimpleHTTPServer ${port}
}
