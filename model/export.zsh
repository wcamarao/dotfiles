# Make vim the default editor
export EDITOR="vim"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export PATH="/usr/local/sbin:$PATH"

# -- Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
