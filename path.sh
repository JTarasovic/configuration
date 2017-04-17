#!/bin/sh
# called from env.sh
# which is called for both bash and zsh

pathmunge () {
    if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
        [ -d "$1" ] && PATH=$1:$PATH
    fi
}

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
