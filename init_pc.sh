#!/bin/bash

# Install Software
sudo yum install -y vim helix docker htop ncdu cmake ninja clang clangd go cargo rust-analyzer
sudo yum group install -y development-tools c-development
sudo yum clean all
sudo usermod -aG docker $(whoami)

# Bashrc
cp BASHRC ~/.bashrc
cp git-prompt.sh ~/.git-prompt.sh
source ~/.bashrc

# VIM
mkdir -p ~/.vim/colors
cp gruvbox.vim ~/.vim/colors
cp VIMRC ~/.vimrc

# Helix
mkdir -p ~/.config/helix
cp helix_config.toml ~/.config/helix/config.toml

echo "Configuration complete"
