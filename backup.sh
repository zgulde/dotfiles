#!/bin/bash

cp -v $HOME/.bashrc ./bashrc
cp -v $HOME/.bash_profile ./bash_profile
cp -v $HOME/.aliases ./aliases
cp -v $HOME/.bash_functions ./bash_functions

cp -v $HOME/.gitconfig ./gitconfig

cp -v $HOME/.config/nvim/init.vim ./vimrc
cp -v $HOME/.config/nvim/UltiSnips/* ./snippets/vim

cp -v $HOME/.tmux.conf ./tmux.conf

cp -v $HOME/.emacs ./emacs
cp -v -r $HOME/.emacs.d/snippets/* ./snippets/emacs
