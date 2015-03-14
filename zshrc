# ZSH

# aliases
[[ -f $DOTFILE/aliases.sh ]] && source $DOTFILE/aliases.sh

# path
[[ -f $DOTFILE/path.sh ]] && source $DOTFILE/path.sh

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


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install



setopt appendhistory autocd beep extendedglob notify HIST_IGNORE_DUPS
setopt completealiases


bindkey -v

autoload -Uz compinit promptinit
compinit
promptinit
