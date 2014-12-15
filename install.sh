#!/usr/bin/env bash

files=(zshrc zshenv bashrc bash_profile gitconfig)
cwd=$(pwd)

for file in ${files[@]}; do
  new_path=$HOME/.$file
  if [[ -h $new_path ]]; then
    `rm $new_path`
  elif [[ -f $new_path ]]; then
    [[ !(-d _backup) ]] && `mkdir _backup`
    `mv $new_path _backup/$file`
  fi
  `ln -s $cwd/$file $HOME/.$file`
done


# install speedtest-cli to ~/.local/bin
[[ !(-d $HOME/.local/bin) ]] && `mkdir $HOME/.local/bin`
if [[ !(-e $HOME/.local/bin/speedtest-cli) ]]; then
  `wget -O $HOME/.local/bin/speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py`
  `chmod +x $HOME/.local/bin/speedtest-cli`
fi

`git submodule init && git submodule update`

`ln -s $HOME/.dotfiles/config.py $HOME/.dotfiles/powerline-shell/config.py`
`./$HOME/.dotfiles/install.sh`
