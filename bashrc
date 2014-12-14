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

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -e $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-plain'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='jason@www.tarasovic.com'

# Set my editor and git editor
export EDITOR="/usr/bin/atom -w"
export GIT_EDITOR='/usr/bin/atom -w'

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

### Added by the Heroku Toolbelt
[ -d /usr/local/heroku/bin ] && export PATH=$PATH:/usr/local/heroku/bin

# add android stuff to path
[ -d $HOME/android-studio/bin ] && PATH=$PATH:$HOME/android-studio/bin
[ -d $HOME/Android/Sdk/ ] && PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools


# Load Bash It
[ -d $BASH_IT ] && source $BASH_IT/bash_it.sh
