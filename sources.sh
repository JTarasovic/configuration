[[ -e $HOME/npm_completion ]] && source $HOME/npm_completion

# allow perlbrew to set itself up
[[ -d $HOME/perl5/perlbrew/etc ]] && source $HOME/perl5/perlbrew/etc/bashrc

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# allow nvm to set up path
[[ -d $NVM_DIR ]] && source $(brew --prefix nvm)/nvm.sh

[[ -e /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#powerline

if [[ $FROM_ZSH -eq 0 ]]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source $POWERLINE_ROOT/powerline/bindings/bash/powerline.sh
else
  source $POWERLINE_ROOT/powerline/bindings/zsh/powerline.zsh
fi
