# PATH ADDITIONS

# add .local/bin to path
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin

# add android studio and adb to path
[[ -d $HOME/android-studio/bin ]] && PATH=$PATH:$HOME/android-studio/bin
[[ -d $HOME/Android/Sdk ]] && PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools


# add go binaries to path
[[ -d $HOME/Development/gocode/bin ]] && PATH=$PATH:$HOME/Development/gocode/bin

# Add RVM to PATH for scripting
[[ -d $HOME/.rvm/bin ]] && PATH=$PATH:$HOME/.rvm/bin


# allow perlbrew to set itself up
[[ -d $HOME/perl5/perlbrew/etc ]] && source $HOME/perl5/perlbrew/etc/bashrc

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# allow nvm to set up path
[[ -d $NVM_DIR ]] && source $(brew --prefix nvm)/nvm.sh

export PATH
