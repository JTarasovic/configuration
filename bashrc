# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Don't check mail when opening terminal.
unset MAILCHECK

export FROM_ZSH=0
[[ -f $DOTFILE/env.sh ]] && source $DOTFILE/env.sh

if [[ $DOTFILE ]]; then
  source $DOTFILE/aliases.sh
  source $DOTFILE/path.sh
fi

if [[ $PLINE ]]; then
  function _update_ps1() {
    export PS1="$($PLINE/powerline-shell.py $? 2> /dev/null)"
  }

  export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Load Bash It
[[ $BASH_IT ]] && source $BASH_IT/bash_it.sh
