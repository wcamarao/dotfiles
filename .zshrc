ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random"
ZSH_THEME="simple"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"

# Which plugins? (can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew ruby rails bundler gem)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set default permissions
umask g=rwx,o=rx

# Load dotfiles
for file in ~/Spikes/dotfiles/.{alias,export,functions}.zsh; do
  [ -r "$file" ] && source "$file"
done
unset file
