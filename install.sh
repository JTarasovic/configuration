#!/bin/bash

files=(zshrc zshenv vimrc bashrc bash_profile vcsignore vim ctags)
cwd=$(pwd)

# link version controled files to correct dotfile in ~
for file in "${files[@]}"; do
  new_path=$HOME/.$file
  if [[ -h $new_path ]]; then
    rm "$new_path"
  elif [[ -f $new_path ]]; then
    [[ ! (-d _backup) ]] && mkdir _backup
    mv "$new_path" "_backup/$file"
  fi
  ln -s "$cwd/$file" "$HOME/.$file"
done

git submodule update --init --recursive

ln -s "$DOTFILE/vimrc" "$HOME/.vim/init.vim"

echo -e "Be sure to install:
(pip) hr
(pip) speedtest-cli
(brew/apt/dnf/pac) go
(brew/apt/dnf/pac) elixir
(brew/apt/dnf/pac) node
(brew/apt/dnf/pac) perl
(brew/apt/dnf/pac) nvm
(brew/apt/dnf/pac) rvm
(brew/apt/dnf/pac) perlbrew
(brew/apt/dnf/pac) vim/macvim/neovim
(github) ryanoasis/nerd-fonts
"
