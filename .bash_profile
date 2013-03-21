# aliases

alias vim='mvim '
alias sudo='sudo '
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# default permissions

umask g=rwx,o=rx

# path

function list_path () {
  for line in ${PATH//:/$'\n'}; do
    echo $line
  done
}

# prompt

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
YELLOW="\[\033[0;33m\]"
NO_COLOR="\[\033[0m\]"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion"

PS1="$BLUE\u$NO_COLOR:$GREEN\w:$YELLOW\$(~/.rvm/bin/rvm-prompt i v g)$NO_COLOR:$RED\$(parse_git_branch)$NO_COLOR\$ "
