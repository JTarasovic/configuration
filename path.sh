#!/bin/sh
# called from env.sh
# which is called for both bash and zsh

pathmunge () {
    # exit early if dir doesn't exist
    [ ! -d "$1" ] && return
    # if path isn't already in path
    if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
         PATH=$1:$PATH
    fi
}

# add whatever you want to get added to path here

pathmunge "$HOME"/android-studio/bin
pathmunge "$HOME"/Android/Sdk/tools
pathmunge "$HOME"/.local/bin
pathmunge "$HOME"/.rvm/bin
pathmunge "$HOME"/mongo/current/bin
pathmunge /usr/local/bin
pathmunge /usr/local/heroku/bin

# add go binaries to path
command -v go > /dev/null 2>&1 && pathmunge "$(go env GOPATH)/bin"

export PATH
