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
promptinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -c -o command,pid,%cpu,tty,cputime,cmd'
fpath=($DOTFILE/zsh-completions/src $fpath)
compinit


# source settings common between zsh and other shells
if [[ -e $DOTFILE ]]; then
  # env.sh is sourced by zshenv
  source $DOTFILE/misc.sh
  source $DOTFILE/aliases.sh
fi

# syntax highlighting
source $DOTFILE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# stoopid
[ -f /Users/j_tarasovic/Development/inf/environment/environment_vars ] && source /Users/j_tarasovic/Development/inf/environment/environment_vars

# if we make it this far return cleanly /shrug
return 0
