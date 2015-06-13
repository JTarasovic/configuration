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
[[ !(-d $HOME/.local/bin) ]] && `mkdir -p $HOME/.local/bin`
if [[ !(-e $HOME/.local/bin/speedtest-cli) ]]; then
  `wget -O $HOME/.local/bin/speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py`
  `chmod +x $HOME/.local/bin/speedtest-cli`
fi
if [[ !(-e $HOME/.local/bin/hr) ]]; then
 `wget -O curl https://raw.githubusercontent.com/LuRsT/hr/master/hr > $HOME/.local/bin/hr`
 `chmod +x $HOME/.local/bin/hr`
fi

git submodule update --init

`ln -s $HOME/.dotfiles/config.py $HOME/.dotfiles/powerline-shell/config.py`
echo -e "\nDon't forget to run ./install.py in the powerline-shell dir."
echo -e "Also, don't forget to run ./install.sh in the fonts dir"
