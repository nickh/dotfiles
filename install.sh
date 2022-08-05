#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

mkdir -p $HOME/.config
rm -f $HOME/.config/nvim
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"
ln -s $(pwd)/vim $HOME/.vim

nvim +'PlugInstall --sync' +qa

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
EOF

cat >> ~/.bash_profile <<EOF

source ~/.bashrc
EOF

