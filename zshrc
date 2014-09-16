# ZSH
if [[ -d $HOME/.dotfiles ]]; then
  ZSH=$HOME/.dotfiles/
  source $ZSH/custom.aliases
fi

# add .local/bin to path
if [[ -d $HOME/.local/bin ]]; then
  export PATH=$PATH:$HOME/.local/bin
fi

# add android studio and adb to path
if [[ -d $HOME/android-studio ]]; then
  export PATH=$PATH:$HOME/android-studio/bin
  export PATH=$PATH:$HOME/android-studio/sdk/platform-tools
  export PATH=$PATH:$HOME/android-studio/sdk/tools
fi


zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/jason/.zshrc'


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install



# powerline
POWERLINE_ROOT="$HOME/.local/lib/python2.7/site-packages/powerline"
if [[ -d $POWERLINE_ROOT ]]; then
  export POWERLINE_ROOT
  powerline-daemon -q
  . $POWERLINE_ROOT/bindings/zsh/powerline.zsh
fi

if [[ -z "$TMUX" ]]; then
  exec tmux
fi
#T="$(date +%s%N)"
if [[ -f $ZSH/antigen/antigen.zsh ]]; then
  source $ZSH/antigen/antigen.zsh

  # antigen
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

  # general plugins
  antigen bundle zsh-users/zsh-completions src/_docker
  antigen bundle zsh-users/zsh-syntax-highlighting
  # antigen bundle command-not-found


  antigen apply
fi
#T="$(($(date +%s%N)-T))"
#T="$((T/1000000))"
echo ${T}
autoload -Uz compinit
compinit
