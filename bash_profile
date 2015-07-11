#!/usr/bin/env bash

# set dotfiles directory
[[ -d $HOME/.dotfiles ]] && export DOTFILE=$HOME/.dotfiles/

[ -f ~/.bashrc ] && source ~/.bashrc
