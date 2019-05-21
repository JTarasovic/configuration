#!/bin/sh
# set key variables
# called by both ZSH and BASH

# get OS type
[ "$(uname)" = 'Linux' ] && export IS_LINUX=1
[ "$(uname)" = 'Darwin' ] && export IS_OSX=1


# if linux, determine package manager
if [ -n "$IS_LINUX" ]; then
  command -v yum >/dev/null 2>&1 && export HAS_YUM=1
  command -v dnf >/dev/null 2>&1 && export HAS_DNF=1
  command -v apt-get >/dev/null 2>&1 && export HAS_APT=1
  command -v pacman >/dev/null 2>&1 && export HAS_PACMAN=1
fi

SPEC_DIR="$HOME/Development/int/yardstick/specs"
if [ -d  "$SPEC_DIR" ]; then
    export OFLPMTR="$SPEC_DIR"/OFLPMTR.json
    export WEBMSTR="$SPEC_DIR"/WEBMSTR.json
    export WEBBILL="$SPEC_DIR"/WEBBILL.json
    export WEBVEH="$SPEC_DIR"/WEBVEH.json
    export ACTBAL="$SPEC_DIR"/actbal.json
    export FEDWIRE="$SPEC_DIR"/fedwire.json
    export GR_MORTCOMP="$SPEC_DIR"/gr-mortcomp.json
fi

KUBE_INFRA_DIR="$HOME/Development/inf/core_infra"
if [ -d  "$KUBE_INFRA_DIR" ]; then
    export KUBE_MGMT_CONFIG="$KUBE_INFRA_DIR/mgmt/mgmt-config"
    export KUBE_PROD_CONFIG="$KUBE_INFRA_DIR/prod/prod-config"
fi


# set up path
# shellcheck source=/dev/null
. "$DOTFILE/path.sh"

# Set my editor
# sh doesn't support arrays or i would use one here
# last command that exists wins, so order based on preference
command -v vim > /dev/null 2>&1 && EDITOR="$(command -v vim)"
command -v nvim > /dev/null 2>&1 && EDITOR="$(command -v nvim)"


command -v bat > /dev/null 2>&1 && export BAT_THEME="TwoDark"

export EDITOR

export NVM_DIR=~/.nvm
