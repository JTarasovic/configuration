# PATH ADDITIONS

# add .local/bin to path
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH

# add android studio and adb to path
[[ -d $HOME/android-studio/bin ]] && PATH=$HOME/android-studio/bin:$PATH
[[ -d $HOME/Android/Sdk ]] && PATH=$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$PATH


# add go binaries to path
[[ -d $HOME/Development/gocode/bin ]] && PATH=$HOME/Development/gocode/bin:$PATH

# Add RVM to PATH for scripting
[[ -d $HOME/.rvm/bin ]] && PATH=$HOME/.rvm/bin:$PATH

# Heroku Toolbelt
[[ -d /usr/local/heroku/bin ]] && PATH="/usr/local/heroku/bin:$PATH"

export PATH
