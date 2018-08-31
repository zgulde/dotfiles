#!/usr/bin/env bash

#######################################################################
# Clones the dotfiles repo (if not present) and links up config files #
#######################################################################

if [[ _DEBUG -eq 1 ]] ; then
	echo >&2 "Starting debugging"
	export PS4='[${BASH_SOURCE}:$LINENO:${FUNCNAME[0]}] '
	exec 99>$0.dbg
	BASH_XTRACEFD=99
	set -x
fi

DOTFILES="$HOME/dotfiles"

if [[ -d $DOTFILES ]]; then
	echo "$DOTFILES directory already present, ensuring it is up to date..."
	git -C $DOTFILES pull origin master
else
	echo 'Cloning Dotfiles...'
	git clone https://github.com/zgulde/dotfiles.git $DOTFILES
fi

ln -fns $DOTFILES/bashrc $HOME/.bashrc
ln -fns $DOTFILES/bash_profile $HOME/.bash_profile
ln -fns $DOTFILES/aliases $HOME/.aliases
ln -fns $DOTFILES/bash_functions $HOME/.bash_functions

ln -fns $DOTFILES/gitconfig $HOME/.gitconfig
ln -fns $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -fns $DOTFILES/editorconfig $HOME/.editorconfig

# my minimal vimrc in case we need to work with vim (not neovim)
curl -LSso $HOME/.vimrc https://zgul.de/vimrc
# neovim
mkdir -p $HOME/.config/nvim
ln -fns $DOTFILES/vimrc $HOME/.config/nvim/init.vim
ln -fns $DOTFILES/snippets/vim $HOME/.config/nvim/UltiSnips # snippets
ln -fns $DOTFILES/after $HOME/.config/nvim/after # filetype config
# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install plugins
nvim -c PlugInstall -cqa

# emacs
mkdir -p $HOME/.emacs.d
ln -fns $DOTFILES/snippets/emacs $HOME/.emacs.d/snippets
ln -fns $DOTFILES/emacs $HOME/.emacs

