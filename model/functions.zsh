# Seek all matching processes by name
function seek() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep $1"
  fi
}

# Kill all matching processes by name
function kall() {
  if [ "$#" -ne 1 ]; then
    echo "usage: $0 [pattern]"
  else
    ps ax |grep $1 |grep -v "grep $1" |awk {'print "kill "$1'} |sh
  fi
}

# List path entries (split by \n)
function listpath () {
  for line in ${PATH//:/$'\n'}; do
    echo $line
  done
}

# Determine size of a file or total size of a directory
function fs() {
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
  local port="${1:-8000}"
  open "http://localhost:${port}/" &
  python -m SimpleHTTPServer ${port}
}
