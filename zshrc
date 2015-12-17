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

# https://github.com/zsh-users/zsh-completions
[[ -e $DOTFILE ]] && fpath=($DOTFILE/zsh-completions/src $fpath)

autoload -Uz compinit promptinit
compinit
promptinit



zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -c -o command,pid,%cpu,tty,cputime,cmd'


if [[ -e $DOTFILE ]]; then
  # env.sh is sourced by zshenv
  source $DOTFILE/path.sh
  source $DOTFILE/aliases.sh
  source $DOTFILE/sources.sh
fi
