#!/usr/bin/env bash

# Load RVM, if you are using it
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
# export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='jason@www.tarasovic.com'

# Set my editor and git editor
export EDITOR="/usr/bin/atom -w"
export GIT_EDITOR='/usr/bin/atom -w'

# Set the path nginx
# export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# added by travis gem
[ -f /home/jason/.travis/travis.sh ] && source /home/jason/.travis/travis.sh

### Added by the Heroku Toolbelt
[ -d /usr/local/heroku/bin ] && export PATH=$PATH:/usr/local/heroku/bin

# add android stuff to path
[ -d ~/Development/android-studio/bin ] && export PATH=\
$PATH:~/Development/android-studio/bin\
:~/Development/android-studio/sdk/tools\
:~/Development/android-studio/sdk/platform-tools

# Load Bash It
source $BASH_IT/bash_it.sh