# set key variables
export FROM_ZSH=1
[[ -d $HOME/.dotfiles ]] && export DOTFILE=$HOME/.dotfiles/

[[ -f $HOME/.dotfiles/env.sh ]] && source $HOME/.dotfiles/env.sh
