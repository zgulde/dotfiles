#!/usr/bin/env bash

PLAYBOOK_URL=https://github.com/zgulde/dotfiles/tree/master/macos.yml

xcode-select --install

echo '- Installing Homebrew'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo '- Installing Ansible'
brew install ansible

ansible-playbook <(curl $PLAYBOOK_URL)
