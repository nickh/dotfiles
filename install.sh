#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo apt-get install -y fzf

mkdir -p $HOME/.config
rm -f $HOME/.config/nvim
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"
ln -s $(pwd)/vim $HOME/.vim

nvim --headless +PlugInstall +qall

# Git
git config --global codespaces-theme.hide-status 0

# Copilot
mkdir -p $HOME/.config/github-copilot
cp config/github-copilot/terms.json $HOME/.config/github-copilot/

# tmux setup
cp .tmux.conf ~/

# VIM/plugin setup
cp .vimrc ~/
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall
vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

cat >> ~/.bashrc <<EOF

export EDITOR=vim

# Copilot needs a more recent node than the one in Codespace's /usr/bin
if [ -d "$GITHUB_PATH/vendor/node" ] ; then
  export PATH=$GITHUB_PATH/vendor/node:$PATH
fi
EOF

cat >> ~/.bash_profile <<EOF

source ~/.bashrc

alias brt='bin/rails test '
alias emt='TEST_WITH_ALL_EMUS=1 brt'
alias mtt='MULTI_TENANT_ENTERPRISE=1 brt'

if ! tmux ls ; then
  tmux
else
  tmux attach
fi
EOF

cat >> ~/.bash_history <<EOF
tmux
tmux attach
git diff origin/master...HEAD
git push origin HEAD
git checkout master && git fetch origin master && git rebase origin/master && brt packages/users/test/models/user/languages_dependency_test.rb
EOF
