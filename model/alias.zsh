alias vim='mvim '
alias sudo='sudo '
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias be='bundle exec '
alias ks='karma start'
