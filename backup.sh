#!/bin/bash

[[ $(uname -s) == Darwin ]] && cp -v ~/Library/Application\ Support/Karabiner/private.xml ./

cp -v ~/.bashrc ./
cp -v ~/.bash_profile ./
cp -v ~/.bash_aliases ./
cp -v ~/.bash_functions ./

cp -v ~/.vimrc ./
cp -v ~/.vim/after/ftplugin/* ./ftplugin/
cp -v -a ~/.vim/UltiSnips/. ./vim-snippets/

cp -v ~/.tmux.conf ./

cp -v ~/bin/* ./bin/

cp -rv ~/.config/fish/* ./fish/

cp -v ~/.emacs ./.emacs

cp -v ~/.config/i3/config ./i3/
cp -v ~/.i3status.conf ./i3/

# grab all the remote urls of my vim plugins
dotfiles_dir="$(pwd)"
for dir in $(ls ~/.vim/bundle/); do
    cd "$HOME/.vim/bundle/$dir"
    git config --get remote.origin.url
done > "$dotfiles_dir/vim-plugin-urls.txt"
