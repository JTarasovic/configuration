# set key variables
# called by both ZSH and BASH
# $FROM_ZSH should eq 1 if called from ZSH

# get OS type
[[ $(uname) = 'Linux' ]] && export IS_LINUX=1
[[ $(uname) = 'Darwin' ]] && export IS_OSX=1


# if linux, determine package manager
if [[ $IS_LINUX -eq 1 ]]; then
  command -v yum >/dev/null 2>&1 && export HAS_YUM=1
  command -v dnf >/dev/null 2>&1 && export HAS_DNF=1
  command -v apt-get >/dev/null 2>&1 && export HAS_APT=1
  command -v pacman >/dev/null 2>&1 && export HAS_PACMAN=1
fi

# [[ $FROM_ZSH -eq 1 ]] && ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)


# Set my editor and git editor
command -v atom > /dev/null 2>&1 && export EDITOR="$(which atom) -w"
#; export GIT_EDITOR="$(which atom) -w"

pip=`command -v pip || echo "/usr/local/bin/pip"`
export POWERLINE_ROOT=`$pip show powerline-status | grep Location | awk '{print $2}'`
export GOPATH=$HOME/Development/gocode/
export NVM_DIR=~/.nvm
