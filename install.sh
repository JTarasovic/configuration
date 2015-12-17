#!/usr/bin/env bash

files=(zshrc zshenv vimrc bashrc bash_profile gitconfig csvignore vim)
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

`git submodule update`

`mkdir -p vim/autoload && ln -s $cwd/vim/bundle/pathogen/autoload/pathogen.vim $cwd/vim/autoload/pathogen.vim`

echo -e `pip install powerline-status hr speedtest-cli`


# `ln -s $HOME/.dotfiles/config.py $HOME/.dotfiles/powerline-shell/config.py`
echo -e "\nDon't forget to run ./install.py in the powerline-shell dir."
echo -e "Also, don't forget to run ./install.sh in the fonts dir"
