#!/bin/bash

# Install software
sudo yum install -y vim helix docker htop
sudo yum groupinstall -y "Development Tools"

# Bashrc
cp BASHRC ~/.bashrc
source ~/.bashrc

# VIM
mkdir -p ~/.vim/colors
cp gruvbox.vim ~/.vim/colors
cp VIMRC ~/.vimrc

# Helix
mkdir -p ~/.config/helix
cp helix_config.toml ~/.config/helix/config.toml

echo "Configuration complete"
