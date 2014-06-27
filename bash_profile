#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

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
export EDITOR="/usr/bin/subl -w"
export GIT_EDITOR='/usr/bin/subl -w'

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

# Load Bash It
source $BASH_IT/bash_it.sh

# added by travis gem
[ -f /home/jason/.travis/travis.sh ] && source /home/jason/.travis/travis.sh

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
export PATH="$PATH:/usr/local/heroku/bin"
fi

if [ -d ~/Development/android-studio/bin ]; then
export PATH=$PATH:~/Development/android-studio/bin
fi
if [ -d ~/Development/android-studio/sdk/tools ]; then
export PATH=$PATH:~/Development/android-studio/sdk/tools
fi
if [ -d ~/Development/android-studio/sdk/platform-tools ]; then
export PATH=$PATH:~/Development/android-studio/sdk/platform-tools
fi