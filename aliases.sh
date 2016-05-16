#!/bin/sh

if [ "$IS_LINUX" -eq 1 ]; then
  # YUM
  if [ "$HAS_YUM" -eq 1 ]; then
    # DNF
    if [ "$HAS_DNF" -eq 1 ]; then
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
  if [ "$HAS_APT" -eq 1 ]; then
    alias update='sudo apt-get update && sudo apt-get upgrade'
    alias install='sudo apt-get install'
    alias search='apt-cache search'
    alias add='sudo add-apt-repository'
  fi

  # PACMAN
  if [ "$HAS_PACMAN" -eq 1 ]; then
    alias update='sudo pacman -Syu'
    alias install='sudo pacman -S'
    alias search='pacman -Ss'
  fi

  # alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert.*$//'\'')"'
  alias l='ls --color=auto'
  alias l.='ls -d .* --color=auto'
  alias la='ls -la --color=auto'
  alias ll='ls -l --color=auto'
  alias ls='ls --color=auto'
else
  #for *BSD/darwin
  export CLICOLOR=1
  alias l='ls'
  alias l.='ls -d .*'
  alias la='ls -la'
  alias ll='ls -l'
  alias dtls='apropos dtrace'

  # TODO: seperate out BSD (pkg) vs OSX (brew)
  #brew aliases
  alias update='brew update && brew upgrade'
  alias install='brew install'
  alias search='brew search'
fi

# terminal manipulation
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# git quick actions
alias gs='git status'
alias push='git push'

# short version of longer commands
alias speed='speedtest-cli'
alias pb='perlbrew'

# long chains of things that i don't want to commit to long term memmory.
alias flatten='find ./ -type f -exec mv '{}' . \;'
alias hdeploy='git push heroku master && sleep 5 && heroku logs && heroku ps'
alias server='python -m SimpleHTTPServer &'
# courtesy @igrigorik; open current gh repo in browser
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"


# helpers for managing ebooks and such
alias move_books="cd ~/staging/NZBin\ Complete && \
ex_rename -e 'epub|mobi|pdf|pdb|azw|azw3|lit|rtf|doc|docx|chm' ~/staging/NZBin\ Complete ~/staging && \
rmdir *(/)"
alias move_nzbs="cd ~/Downloads && \
unzip '*.zip' && \
ex_rename -e nzb ~/Downloads ~/staging/nzbs && \
rm *.zip && \
open ~/staging/nzbs/*"
alias sync_books="rsync -vurW --delete ~/Calibre\ Library/ freenas:/mnt/tank/media/Books"

