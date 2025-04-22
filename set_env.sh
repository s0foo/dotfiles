#!/bin/bash

# packages
sudo apt install -y curl git

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
cp -r nvim $HOME/.config/.

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# git
cp git/gitconfig $HOME/.gitconfig
