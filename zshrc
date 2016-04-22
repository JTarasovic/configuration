# ZSH

# set history options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile
bindkey -v


# behavioral options
setopt autocd extendedglob completealiases
# history options
setopt appendhistory histignorealldups sharehistory
# do these even do anything???
setopt beep notify

autoload -Uz compinit promptinit
compinit
promptinit


if [[ -e $DOTFILE ]]; then
  # env.sh is sourced by zshenv
  source $DOTFILE/misc.sh
  source $DOTFILE/aliases.sh
fi
