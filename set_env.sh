#!/bin/bash

# requirements
sudo apt install -y \
    build-essential \
    cmake \
    curl \
    gettext \
    git \
    ninja-build

# git
cp git/gitconfig $HOME/.gitconfig

# neovim
cp -r nvim $HOME/.config/.
git clone -b stable --depth 1 https://github.com/neovim/neovim $HOME/neovim
cd $HOME/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
