export PATH=~/github/shell/bin:$PATH
export EDITOR=vim

. /opt/boxen/env.sh

source ~/.lvv-git-prompt.sh

alias shard='RBENV_VERSION=1.9.3-p231-tcs-github ~/github/github/script/shard $*'
alias gh-each='GH_ENV=production ~/github/shell/bin/gh-each $*'
