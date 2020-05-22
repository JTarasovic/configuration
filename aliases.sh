#!/bin/sh

if [ -n "$IS_LINUX" ]; then
  # YUM
  if [ -n "$HAS_YUM" ]; then
    # DNF
    if [ -n "$HAS_DNF" ]; then
      alias update='sudo dnf update'
      alias install='sudo dnf install'
      alias search='dnf search'
      alias yum='dnf'
    else
      alias update='sudo yum update'
      alias install='sudo yum install'
      alias search='yum search'
    fi
  fi

  # APT
  if [ -n "$HAS_APT" ]; then
    alias update='sudo apt-get update && sudo apt-get upgrade'
    alias install='sudo apt-get install'
    alias search='apt-cache search'
    alias add='sudo add-apt-repository'
  fi

  # PACMAN
  if [ -n "$HAS_PACMAN" ]; then
    alias update='sudo pacman -Syu'
    alias install='sudo pacman -S'
    alias search='pacman -Ss'
  fi

  # alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert.*$//'\'')"'
  alias l='ls --color=auto'
  alias l.='ls -d .* --color=auto'
  alias la='ls -lah --color=auto'
  alias ll='ls -lh --color=auto'
  alias ls='ls --color=auto'
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
else
  #for *BSD/darwin
  export CLICOLOR=1
  alias l='ls'
  alias l.='ls -d .*'
  alias la='ls -lah'
  alias ll='ls -lh'
  alias dtls='apropos dtrace'

  # TODO: seperate out BSD (pkg) vs OSX (brew)
  #brew aliases
  alias update='brew update && brew upgrade && brew cask upgrade'
  alias install='brew install'
  alias search='brew search'
fi

# terminal manipulation
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cat='bat'

# git quick actions
alias gs='git status'
alias gr='git reset --hard @'
alias push='git push'
alias gprp='git pull && git remote prune origin && git gc'

# long chains of things that i don't want to commit to long term memmory.
alias flatten='find ./ -type f -exec mv '{}' . \;'

alias k='kubectl '

alias dirty_dirs='for dir in *; do pushd "$dir" > /dev/null; $(git -c diff.autorefreshindex=true diff --quiet) || echo "$dir is dirty"; popd > /dev/null; done'

alias yml2yaml='for f in *.yml; do mv -- "$f" "${f%.yml}.yaml"; done'

build_kube_aliases ""
