# ZSH

# set history options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

if [[ -e $DOTFILE ]]; then
  # env.sh is sourced by zshenv
  source $DOTFILE/aliases.sh
  source $DOTFILE/path.sh
fi

# powerline-shell
if [[ -e $PLINE ]]; then
  function powerline_precmd() {
    export PS1="$($PLINE/powerline-shell.py $? --shell zsh 2> /dev/null)"
  }
  function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
      if [ "$s" = "powerline_precmd" ]; then
        return
      fi
    done
    precmd_functions+=(powerline_precmd)
  }
  install_powerline_precmd
fi

# behavioral options
setopt autocd extendedglob completealiases
# history options
setopt appendhistory histignorealldups sharehistory
# do these even do anything???
setopt beep notify

# EMACS!!!
bindkey -e

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -c -o command,pid,%cpu,tty,cputime,cmd'

[[ -e $HOME/npm_completion ]] && source $HOME/npm_completion

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
