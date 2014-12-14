#cite about-alias
#about-alias 'my aliases'

# YUM
if [[ $HAS_YUM && -z $HAS_DNF ]]; then
  alias update='sudo yum update'
  alias install='sudo yum install'
  alias search='yum search'
fi

# DNF
if [[ $HAS_DNF ]]; then
  alias update='sudo dnf update'
  alias install='sudo dnf install'
  alias search='dnf search'
  alias yum='dnf'
fi

# APT
if [[ $HAS_APT ]]; then
  alias update='sudo apt-get update && sudo apt-get upgrade'
  alias install='sudo apt-get install'
  alias search='apt-cache search'
  alias add='sudo add-apt-repository'
fi

# PACMAN
if [[ $HAS_PACMAN ]]; then
  alias update='sudo pacman -Syu'
  alias install='sudo pacman -S'
  alias search='pacman -Ss'
fi


command -v speedtest-cli >/dev/null 2>&1 && alias speed='speedtest-cli'
command -v pm-hibernate >/dev/null 2>&1 && alias hibernate='sudo pm-hibernate'

# heroku
alias hdeploy='git push heroku master && sleep 5 && heroku logs && heroku ps'

# misc.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert.*$//'\'')"'
alias server='python -m SimpleHTTPServer &'
alias l='l.'
alias la='ls -la --color=auto'
alias c='clear'
alias gs='git status'


alias avd='emulator-x86 -avd avd1 -qemu -m 2047 -enable-kvm'
