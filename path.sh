#!/bin/sh
# called from env.sh
# which is called for both bash and zsh

pathmunge () {
    if ! echo "$PATH" | egrep -q "(^|:)$1($|:)" ; then
        PATH=$1:$PATH
    fi
}

# add android studio and adb to path
# [[ -d $HOME/android-studio/bin ]] && PATH=$HOME/android-studio/bin:$PATH
# [[ -d $HOME/Android/Sdk ]] && PATH=$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$PATH

# add local/bin to path
[ -d "$HOME/.local/bin" ] && pathmunge "$HOME/.local/bin"
[ -d /usr/local/bin ] && pathmunge "/usr/local/bin"

# add go binaries to path
command -v go > /dev/null 2>&1 && pathmunge "$(go env GOPATH)/bin"

# Add RVM to PATH for scripting
[ -d "$HOME/.rvm/bin/" ] && pathmunge "$HOME/.rvm/bin"

# Heroku Toolbelt
[ -d /usr/local/heroku/bin ] && pathmunge "/usr/local/heroku/bin"

export PATH
