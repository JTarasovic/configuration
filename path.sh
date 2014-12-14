# PATH ADDITIONS

# add .local/bin to path
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin

# add android studio and adb to path
[ -d $HOME/android-studio/bin ] && PATH=$PATH:$HOME/android-studio/bin
[ -d $HOME/Android/Sdk ] && PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools
