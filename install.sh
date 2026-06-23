#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Git
git config --global codespaces-theme.hide-status 0

# Copilot
mkdir -p $HOME/.config/github-copilot
cp config/github-copilot/terms.json $HOME/.config/github-copilot/

cat >> ~/.bashrc <<EOF
export EDITOR=vim

# Copilot needs a more recent node than the one in Codespace's /usr/bin
if [ -d "$GITHUB_PATH/vendor/node" ] ; then
  export PATH=$GITHUB_PATH/vendor/node:$PATH
fi
EOF

cat >> ~/.bash_history <<EOF
git diff origin/master...HEAD
git push origin HEAD
git checkout master && git fetch origin master && git rebase origin/master && bin/rails test packages/users/test/models/user/languages_dependency_test.rb
EOF
