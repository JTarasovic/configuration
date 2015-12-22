#!/usr/bin/env sh

files=(zshrc zshenv vimrc bashrc bash_profile gitconfig csvignore vim)
cwd=$(pwd)

# link version controled files to correct dotfile in ~
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

`mkdir -p $cwd/vim/autoload && ln -s $cwd/vim/bundle/pathogen/autoload/pathogen.vim $cwd/vim/autoload/pathogen.vim`

temp=`pip install powerline-status hr speedtest-cli`
