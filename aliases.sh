if [[ $IS_LINUX -eq 1 ]]; then
  # YUM
  if [[ $HAS_YUM -eq 1 ]]; then
    # DNF
    if [[ $HAS_DNF -eq 1 ]]; then
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
  if [[ $HAS_APT -eq 1 ]]; then
    alias update='sudo apt-get update && sudo apt-get upgrade'
    alias install='sudo apt-get install'
    alias search='apt-cache search'
    alias add='sudo add-apt-repository'
  fi

  # PACMAN
  if [[ $HAS_PACMAN -eq 1 ]]; then
    alias update='sudo pacman -Syu'
    alias install='sudo pacman -S'
    alias search='pacman -Ss'
  fi

  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert.*$//'\'')"'
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

  #brew aliases
  alias update='brew update && brew upgrade'
  alias install='brew install'
  alias search='brew search'
fi

alias gs='git status'
alias push='git push'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias speed='speedtest-cli'
alias avd='emulator-x86 -avd avd1 -qemu -m 2047 -enable-kvm'
# misc.
alias hdeploy='git push heroku master && sleep 5 && heroku logs && heroku ps'
alias server='python -m SimpleHTTPServer &'
alias pb='perlbrew'
alias flatten='find ./ -type f -exec mv '{}' . \;'

# courtesy @igrigorik; open current gh repo in browser
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"
