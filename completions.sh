#!/usr/bin/env sh

source $HOME/npm_completion


if [[ $FROM_ZSH -eq 1 ]]; then
	fpath=($DOTFILE/zsh-completions/src $fpath)

	zstyle ':completion:*' auto-description 'specify: %d'
	zstyle ':completion:*' completer _expand _complete _ignored _approximate
	zstyle ':completion:*' max-errors 2
	zstyle ':completion:*' menu select
	zstyle ':completion:*' verbose true
	
	zstyle ':completion:*:kill:*' command 'ps -u $USER -c -o command,pid,%cpu,tty,cputime,cmd'
else
	# not ZSH specific stuff here	
	:
fi
