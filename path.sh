# PATH ADDITIONS

# add .local/bin to path
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin

# add android studio and adb to path
[[ -d $HOME/android-studio/bin ]] && PATH=$PATH:$HOME/android-studio/bin
[[ -d $HOME/Android/Sdk ]] && PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools


# add go binaries to path
[[ -d $HOME/Development/gocode/bin ]] && PATH=$PATH:$HOME/Development/gocode/bin

# allow perlbrew to set itself up
[[ -d $HOME/perl5/perlbrew/etc/bashrc ]] && source ~/perl5/perlbrew/etc/bashrc

# allow nvm to set up path
[[ -d $NVM_DIR ]] && source $(brew --prefix nvm)/nvm.sh


export PATH
