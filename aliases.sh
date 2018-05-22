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
alias gr='git reset --hard @'
alias push='git push'

# short version of longer commands
alias speed='speedtest-cli'

alias server='python -m SimpleHTTPServer &'

# long chains of things that i don't want to commit to long term memmory.
alias flatten='find ./ -type f -exec mv '{}' . \;'
alias hdeploy='git push heroku master && sleep 5 && heroku logs && heroku ps'

# helpers for managing ebooks and such
alias move_books="cd ~/staging/NZBin\ Complete && \
ex_rename -e 'epub|mobi|pdf|pdb|azw|azw3|lit|rtf|doc|docx|chm' ~/staging/NZBin\ Complete ~/staging/staging && \
rmdir *(/)"
alias move_nzbs="cd ~/Downloads && \
unzip '*.zip' && \
ex_rename -e nzb ~/Downloads ~/staging/nzbs && \
rm *.zip && \
open ~/staging/nzbs/*"
alias sync_books="rsync -vurW --delete ~/Calibre\ Library/ freenas:/mnt/tank/media/Books"

alias kubedev="kubectl --kubeconfig=$HOME/Development/inf/core_infra/dev/dev-config"
alias kubestage="kubectl --kubeconfig=$HOME/Development/inf/core_infra/staging/staging-config"
alias kubeprod="kubectl --kubeconfig=$HOME/Development/inf/core_infra/prod/prod-config"

# shellcheck disable=SC2142
alias watch_url='function _doIt(){ while :; do curl -s -o /dev/null -w "%{http_code} - %{size_download}\n" -k "$1"; sleep ${2:-"5"}; done };_doIt'

alias dirty_dirs='for dir in *; do pushd "$dir" > /dev/null; $(git -c diff.autorefreshindex=true diff --quiet) || echo "$dir is dirty"; popd > /dev/null; done'
alias donotuse1='for dir in *; do pushd "$dir" > /dev/null; [[ $(git rev-parse --abbrev-ref HEAD) = "develop" ]] || echo "$dir not on develop"; popd > /dev/null; done'
alias donotuse2='for dir in *; do pushd "$dir" > /dev/null; git pull; popd > /dev/null; done'
alias donotuse3='for dir in *; do pushd "$dir" > /dev/null; git remote prune origin; popd > /dev/null; done'
