#!/bin/bash

#######################################################################
# Clones the dotfiles repo (if not present) and links up config files #
#######################################################################

DOTFILES="$HOME/dotfiles"

if [[ ! -d $HOME/dotfiles ]]; then
    git clone https://github.com/zgulde/dotfiles.git $DOTFILES
fi

ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/emacs $HOME/.emacs

ln -s $DOTFILES/bashrc $HOME/.bashrc
ln -s $DOTFILES/bash_profile $HOME/.bash_profile
ln -s $DOTFILES/aliases $HOME/.aliases
ln -s $DOTFILES/bash_functions $HOME/.bash_functions

ln -s $DOTFILES/gitconfig $HOME/.gitconfig

ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

# neovim
mkdir -p $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# snippets
ln -s $DOTFILES/snippets/vim $HOME/.config/nvim/UltiSnips

mkdir -p $HOME/.emacs.d
ln -s $DOTFILES/snippets/emacs $HOME/.emacs.d/snippets
