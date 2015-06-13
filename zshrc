# ZSH

# set history options
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

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

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
#zstyle :compinstall filename '/home/jason/.zshrc'



setopt appendhistory autocd beep extendedglob notify HIST_IGNORE_DUPS
setopt completealiases


bindkey -v

autoload -Uz compinit promptinit
compinit
promptinit
