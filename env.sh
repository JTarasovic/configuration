#!/bin/sh
# set key variables
# called by both ZSH and BASH
# $FROM_ZSH should eq 1 if called from ZSH

# get OS type
[ "$(uname)" = 'Linux' ] && export IS_LINUX=1
[ "$(uname)" = 'Darwin' ] && export IS_OSX=1


# if linux, determine package manager
if [ -n "$IS_LINUX" ]; then
  command -v yum >/dev/null 2>&1 && export HAS_YUM=1
  command -v dnf >/dev/null 2>&1 && export HAS_DNF=1
  command -v apt-get >/dev/null 2>&1 && export HAS_APT=1
  command -v pacman >/dev/null 2>&1 && export HAS_PACMAN=1
fi

# Set my editor
export EDITOR
command -v vim > /dev/null 2>&1 && EDITOR="$(which vim)"

export GOPATH=$HOME/Development/gocode/
export NVM_DIR=~/.nvm
