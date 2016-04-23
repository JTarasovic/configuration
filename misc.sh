# miscellaneous path additions and sourcing random files

# add .local/bin to path
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

# add android studio and adb to path
# [[ -d $HOME/android-studio/bin ]] && PATH=$HOME/android-studio/bin:$PATH
# [[ -d $HOME/Android/Sdk ]] && PATH=$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$PATH

# allow nvm to set up path
[[ -d $NVM_DIR ]] && source $(brew --prefix nvm)/nvm.sh

# add go binaries to path
[[ -d $HOME/Development/gocode/bin/ ]] && PATH=$HOME/Development/gocode/bin:$PATH

# Add RVM to PATH for scripting
[[ -d $HOME/.rvm/bin/ ]] && PATH=$HOME/.rvm/bin:$PATH
# Load RVM into a shell session *as a function*
[[ -d $HOME/.rvm/scripts ]] && source "$HOME/.rvm/scripts/rvm"

# Heroku Toolbelt
[[ -d /usr/local/heroku/bin ]] && PATH="/usr/local/heroku/bin:$PATH"

# allow perlbrew to set itself up
[[ -d $HOME/perl5/perlbrew/etc ]] && source $HOME/perl5/perlbrew/etc/bashrc

source $DOTFILE/npm_completion
source $DOTFILE/prompt.sh

export PATH
