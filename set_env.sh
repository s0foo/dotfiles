#!/bin/bash

CURRENT_PATH=$(pwd)

# requirements
sudo apt install -y \
    build-essential \
    cmake \
    curl \
    gettext \
    git \
    ninja-build

# git
cp $CURRENT_PATH/git/gitconfig $HOME/.gitconfig

# neovim
cp -r $CURRENT_PATH/nvim $HOME/.config/.
git clone -b stable --depth 1 https://github.com/neovim/neovim $HOME/neovim
cd $HOME/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd $CURRENT_PATH
rm -rf $HOME/neovim
