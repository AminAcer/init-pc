#!/bin/bash

# Install software
sudo yum install -y vim helix htop
sudo yum groupinstall "Development Tools"

# Bashrc
cp .bashrc ~/.bashrc
source ~/.bashrc

# VIM
mkdir -p ~/.vim/colors
cp gruvbox.vim ~/.vim/colors

# Helix
cp helix_config.toml ~/.config/helix/config.toml

echo "Configuration complete"
