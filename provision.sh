#!/bin/bash

# TODO 
#   - ssh keygen
#   - make this work for a non-debian linux, i.e. use a package manager other
#     than apt
#   - docker?
#   - vagrant and virtualbox?
#   - do i need stuff from individual package managers, eg npm, pip, gem?

install(){
    if [[ $(uname -s) == 'Linux' ]]; then 
        sudo apt install -y "$@"
    elif [[ "$(uname -s)" == 'Darwin' ]]; then
        brew install "$@"
    else 
        echo 'I have no idea what platform im on!!!'
        exit
    fi
}

# install brew
if [ $(uname -s) == 'Darwin' ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ $(uname -s) == 'Linux' ]; then
    sudo apt-get update
fi

install\
    curl\
    git\
    vim\
    ruby\
    nodejs\
    tree\
    htop\
    ack-grep\
    tmux\
    fortune\
    cowsay

# if we're on linux install
#   - xsel and setup pb alias
#   - capslock stuff

# if we're on mac install
#   - gettext (sp?)
#   - coreutils and fix things
#   - bash
#   - karabiner and seil and copy private.xml

# generate SSH keys
if [ ! -d $HOME/.ssh ]; then
    mkdir -p $HOME/.ssh
    # ssh-keygen
fi

# pull down the dotfiles
git clone https://github.com/zgulde/dotfiles $HOME/dotfiles

# my scripts
mkdir -p $HOME/bin
cp $HOME/dotfiles/bin/* $HOME/bin

# bash things
cp $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
cp $HOME/dotfiles/.bash_functions $HOME/.bash_functions

if [ $(uname -s) == 'Linux' ]; then
    cp $HOME/dotfiles/.bash_profile $HOME/.bashrc
else
    cp $HOME/dotfiles/.bash_profile $HOME/.bash_profile
fi

# tmux
cp $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# Vim Stuff

# rc
cp $HOME/dotfiles/.vimrc $HOME/.vimrc

# copy over snippets
mkdir -p $HOME/.vim/UltiSnips
cp $HOME/dotfiles/vim-snippets/* $HOME/.vim/UltiSnips

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim plugins
mkdir -p $HOME/.vim/bundle
$HOME/dotfiles/get-vim-plugins.sh

# install vim ftplugins
mkdir -p $HOME/.vim/ftplugin/after
cp $HOME/dotfiles/after/* $HOME/.vim/ftplugin/after/

cd $HOME
