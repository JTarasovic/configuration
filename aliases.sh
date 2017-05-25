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

recursive_git_pull() {
    initial=$(pwd -P)
    cd "${1:-.}" || exit 1
    start=$(pwd -P)
    desired_branch=${2:-develop}

    echo Starting in "$start"
    for dir in "$start"/*/
    do
        cd "$dir" || break
        branch=$(git rev-parse --abbrev-ref HEAD)
        if [ "$branch" = "$desired_branch" ]; then
            if [ -z "$(git status --porcelain)" ]; then
                echo "$dir" is clean. Pulling.
                git pull
            else
                echo "$dir" is unclean. Skipping.
            fi
        else
            echo "$dir" not on "$desired_branch". Skipping.
        fi
        cd "$start" || break
    done
    cd "$initial" || exit 1
}

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

# helpers for managing ebooks and such
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`" # courtesy @igrigorik; open current gh repo in browser
alias move_books="cd ~/staging/NZBin\ Complete && \
ex_rename -e 'epub|mobi|pdf|pdb|azw|azw3|lit|rtf|doc|docx|chm' ~/staging/NZBin\ Complete ~/staging/staging && \
rmdir *(/)"
alias move_nzbs="cd ~/Downloads && \
unzip '*.zip' && \
ex_rename -e nzb ~/Downloads ~/staging/nzbs && \
rm *.zip && \
open ~/staging/nzbs/*"
alias sync_books="rsync -vurW --delete ~/Calibre\ Library/ freenas:/mnt/tank/media/Books"

alias kubeprod="kubectl --kubeconfig=/Users/j_tarasovic/Development/inf/ansible_scripts/kubernetes/prod/prodconfig.conf"
alias kubestage="kubectl --kubeconfig=/Users/j_tarasovic/Development/inf/ansible_scripts/kubernetes/staging/staging-config"
alias kubewatchpodsprod="watch -n 5 'kubectl --kubeconfig ~/Development/inf/ansible_scripts/kubernetes/prod/prodconfig.conf get pods'"
alias kubewatchpodsstage="watch -n 5 'kubectl --kubeconfig ~/Development/inf/ansible_scripts/kubernetes/staging/staging-config get pods'"
