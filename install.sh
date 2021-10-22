#!/bin/sh

cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cat >> ~/.bashrc <<EOF

export EDITOR=vim
EOF
