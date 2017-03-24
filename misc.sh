#!/bin/sh
# sourcing random files

# allow nvm to set up path
# shellcheck source=/dev/null
[ -d "$NVM_DIR" ] && source "$(brew --prefix nvm)/nvm.sh"

# Load RVM into a shell session *as a function*
# shellcheck source=/dev/null
[ -d "$HOME/.rvm/scripts" ] && source "$HOME/.rvm/scripts/rvm"

# allow perlbrew to set itself up
# shellcheck source=/dev/null
[ -d "$HOME/perl5/perlbrew/etc" ] && source $HOME/perl5/perlbrew/etc/bashrc


# shellcheck source=/dev/null
source $DOTFILE/npm_completion
# shellcheck source=/dev/null
source $DOTFILE/prompt.sh
# shellcheck source=/dev/null
source $DOTFILE/gitconfig.sh
