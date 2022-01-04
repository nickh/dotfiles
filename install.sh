#!/bin/sh

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install curl, tar, git, other dependencies if missing
PACKAGES_NEEDED="\
    silversearcher-ag \
    bat \
    fuse \
    libfuse2"

if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        sudo apt-get update
    fi
    sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

# install latest neovim
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
# wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
wget https://github.com/github/copilot.vim/releases/download/neovim-nightlies/appimage.zip
unzip appimage.zip
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
nvim +'PlugInstall --sync' +qa

# VIM/plugin setup
cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cat >> ~/.bashrc <<EOF

export EDITOR=vim
EOF
