cite about-alias
about-alias 'my aliases'

# apt aliases
alias update='sudo apt-get update && sudo apt-get upgrade'
alias install='sudo apt-get install'
alias search='apt-cache search'
alias add='sudo add-apt-repository'

# heroku
alias hdeploy='git push heroku master && sleep 5 && heroku logs && heroku ps'

# misc.
alias speed='speedtest-cli.py'
alias hibernate='sudo pm-hibernate'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert.*$//'\'')"'
alias avd='emulator-x86 -avd avd1 -qemu -m 2047 -enable-kvm'
alias server='python -m SimpleHTTPServer &'
