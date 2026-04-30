#!/bin/zsh

export EDITOR="vim"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH

alias m=make
alias t=terraform
alias lsports='lsof -i -n -P |grep --color=never LISTEN'

function server() {
  local port="${1:-3000}"
  open "http://localhost:${port}/" &
  python3 -m http.server ${port}
}
