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

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -c -o command,pid,%cpu,tty,cputime,cmd'
fpath=($DOTFILE/zsh-completions/src $fpath)
source $DOTFILE/exercism_completion.zsh


# source settings common between zsh and other shells 
if [[ -e $DOTFILE ]]; then
  # env.sh is sourced by zshenv
  source $DOTFILE/misc.sh
  source $DOTFILE/aliases.sh
fi

# syntax highlighting
source $DOTFILE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

