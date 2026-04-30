#!/bin/zsh

export EDITOR="vim"
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/go/bin

alias m=make
alias t=terraform
alias lsports='lsof -i -n -P |grep --color=never LISTEN'

function server() {
  local port="${1:-3000}"
  open "http://localhost:${port}/" &
  python3 -m http.server ${port}
}
