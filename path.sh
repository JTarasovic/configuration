#!/bin/sh
# called from env.sh
# which is called for both bash and zsh

# add android studio and adb to path
# [[ -d $HOME/android-studio/bin ]] && PATH=$HOME/android-studio/bin:$PATH
# [[ -d $HOME/Android/Sdk ]] && PATH=$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$PATH

# add local/bin to path
[ -d "$HOME/.local/bin" ] && PATH=$PATH:$HOME/.local/bin
[ -d /usr/local/bin ] && PATH=$PATH:/usr/local/bin

# add go binaries to path
command -v go > /dev/null 2>&1 && PATH="$PATH:$(go env GOPATH)/bin"

# Add RVM to PATH for scripting
[ -d "$HOME/.rvm/bin/" ] && PATH=$PATH:$HOME/.rvm/bin

# Heroku Toolbelt
[ -d /usr/local/heroku/bin ] && PATH=$PATH:"/usr/local/heroku/bin"

export PATH
