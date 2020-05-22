# ZSH

# set history options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile
bindkey -v

# man 1 zshoptions
setopt incappendhistory histignorealldups sharehistory extendedhistory
setopt autocd extendedglob no_complete_aliases correct autopushd
setopt notify

unsetopt nomatch

autoload -Uz promptinit
promptinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -c -o command,pid,%cpu,tty,cputime,cmd'
fpath=($DOTFILE/zsh-completions/src $fpath)
autoload -Uz compinit
compinit


# source settings common between zsh and other shells
if [[ -e $DOTFILE ]]; then
  # env.sh is sourced by zshenv
  source $DOTFILE/misc.sh
  source $DOTFILE/functions.sh
  source $DOTFILE/aliases.sh
fi

# syntax highlighting
source $DOTFILE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# if we make it this far return cleanly /shrug
return 0
