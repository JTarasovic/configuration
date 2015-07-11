# set key variables
# called by both ZSH and BASH
# $FROM_ZSH should eq 1 if called from ZSH

# check if linux
[[ $(uname) = 'Linux' ]] && export IS_LINUX=1


# if linux, determine package manager
if [[ $IS_LINUX -eq 1 ]]; then
  command -v yum >/dev/null 2>&1 && export HAS_YUM=1
  command -v dnf >/dev/null 2>&1 && export HAS_DNF=1
  command -v apt-get >/dev/null 2>&1 && export HAS_APT=1
  command -v pacman >/dev/null 2>&1 && export HAS_PACMAN=1
fi

# check where powerline-shell is installed
[[ -d $DOTFILE/powerline-shell ]] && export PLINE=$DOTFILE/powerline-shell/
[[ -e $HOME/powerline-shell.py ]] && export PLINE=$HOME


# Set my editor and git editor
command -v atom > /dev/null 2>&1 && export EDITOR="$(which atom) -w"; export GIT_EDITOR="$(which atom) -w"


export GOPATH=$HOME/Development/gocode/
export NVM_DIR=~/.nvm
