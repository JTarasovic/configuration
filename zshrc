# ZSH
if [[ -d $HOME/.dotfiles ]]; then
  ZSH=$HOME/.dotfiles/
  source $ZSH/custom.aliases
fi

# add .local/bin to path
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin

# add android studio and adb to path
[ -d $HOME/android-studio/bin ] && PATH=$PATH:$HOME/android-studio/bin
[ -d $HOME/Android/Sdk ] && PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools



zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/jason/.zshrc'


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob notify HIST_IGNORE_DUPS
bindkey -v
# End of lines configured by zsh-newuser-install

[ -d $ZSH/powerline-shell ] && PLINE=$ZSH/powerline-shell/
[ -e $HOME/powerline-shell.py ] && PLINE=$HOME

function powerline_precmd() {
  export PS1="$($PLINE/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd


autoload -Uz compinit
compinit
