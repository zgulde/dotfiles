#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles"

echo '- Minimal Vimrc'
curl https://zgul.de/vimrc > ~/.vimrc
echo '- Installing Homebrew'
if [[ $(uname -s) == Darwin ]] ; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi
echo '- Installing Ansible, Git, Vim'
brew install ansible git vim

git clone https://github.com/zgulde/dotfiles.git $DOTFILES

cd $DOTFILES

ansible-playbook setup-dev-box.yml
