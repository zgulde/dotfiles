#!/usr/bin/env bash

#################################
# Ubuntu + XFCE on a chromebook #
#################################

# ~/.xmodmap

# Setup a minimal vimrc and install minimal necessary tools
curl -Ss https://zgul.de/vimrc > ~/.vimrc
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install -y git vim

sudo apt-get install software-properties-common # to enable apt-add-repository

# add ansible repository
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# add neovim repo and install
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
# python integration
sudo apt-get install python-dev python-pip python3-dev python3-pip

# dotfiles
touch ~/.env

# window-manager, set window management keyboard shortcuts
# - ctrl + alt + l | tile right
# - ctrl + alt + h | tile left
# - ctrl + alt + f | toggle maximize
# keyboard - shortcuts
# install gnome-terminal and set it as the default (launched when pressing
# ctrl+alt + t)
# - tweak gnome-terminal settings
# super     | xfce4-popup-whiskermenu
# super + l | xflock4

