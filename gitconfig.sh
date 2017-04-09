#!/bin/sh

[ -f "$HOME/.gitconfig" ] && return

# shellcheck source=/dev/null
source $DOTFILE/email.sh

cat << EOF > "$HOME/.gitconfig"
[user]
    name = Jason Tarasovic
    email = $EMAIL_ADDRESS
EOF

cat << "EOF" >> "$HOME/.gitconfig"
[credential]
    helper = cache --timeout=3600
[color]
    branch = auto
    diff = auto
    interactive = auto
    status = auto
[push]
    default = simple
[help]
    autocorrect = 1
[ui]
    color = true
[core]
    pager = less -R
    excludesfile=~/.vcsignore
[alias]
    diff-stash = "!f() { git stash show -p stash@{${1:-0}}; }; f"
    lola = log --graph --decorate --pretty=oneline --abbrev-commit --all
    co = checkout
    cob = checkout -b
    ci = commit
    cam = commit -am
    br = branch
    diff = dff --word-diff
    dc = diff --cached
    dlc = diff --cached HEAD^
    lt = describe --tags --abbrev=0
    la = "!git config -l | grep alias | cut -c 7-"
    undo = reset HEAD~1 --mixed
    tagcommit = rev-list -n 1
EOF
