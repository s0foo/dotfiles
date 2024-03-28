#!/bin/bash

# Dotfiles
cp .aliases $HOME/.
cp .vimrc $HOME/.

# Git configuration
cp config/.gitconfig $HOME/.
git config --global user.name "s0foo"
git config --global user.email "s0foo@domain.com"

# Welcome message
echo "Welcome home. Take the time for a vervain."
