#!/bin/sh
# sourcing random files

# Load RVM into a shell session *as a function*
# shellcheck source=/dev/null
[ -d "$HOME/.rvm/scripts" ] && source "$HOME/.rvm/scripts/rvm"

# allow perlbrew to set itself up
# shellcheck source=/dev/null
[ -d "$HOME/perl5/perlbrew/etc" ] && source $HOME/perl5/perlbrew/etc/bashrc

# if npm is installed, use npm completion
command -v npm > /dev/null 2>&1 && source /dev/stdin <<EOF
$(npm completion)
EOF

shell=$([ "$FROM_ZSH" = 1 ] && echo "zsh" || echo "bash")
command -v minikube > /dev/null 2>&1 && source /dev/stdin <<EOF
$(minikube completion "$shell")
EOF

# shellcheck source=/dev/null
source $DOTFILE/prompt.sh
# shellcheck source=/dev/null
source $DOTFILE/gitconfig.sh
