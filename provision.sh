#!/bin/bash

# TODO
#   - ssh keygen
#   - make this work for a non-debian linux, i.e. use a package manager other
#     than apt
#   - docker?
#   - vagrant and virtualbox?
#   - do i need stuff from individual package managers, eg npm, pip, gem?
#     - lolcat gem filewatch gem
#   - fzf - on mac it's just `brew install...`

echo 'We are going to get this machine all set up!'
echo
echo 'Note that we *will* be overriding the following:'
echo '  .bashrc or .bash_profile'
echo '  .bash_aliases and .bash_functions'
echo '  .vimrc'
echo '  .vim/after/ftplugins/*'
echo '  possible others ive forgotten about'
echo
echo 'Press <enter> to continue, or C-c to quit.'
echo
read

heading(){
    echo '---------------------------------------------------------------------'
    echo "-> $@"
    echo '---------------------------------------------------------------------'
}

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
    heading 'Installing Brew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ $(uname -s) == 'Linux' ]; then
    heading 'Update apt'
    sudo apt-get update
fi

heading 'Installing Various programs'
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
    clisp\
    cowsay\
    python3-pip

pip3 install --upgrade pip
pip3 install jedi virtualenv

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

heading 'Cloning my dotfiles repo'
git clone https://github.com/zgulde/dotfiles $HOME/dotfiles

heading 'Copying over my scripts to ~/bin'
mkdir -p $HOME/bin
cp -v $HOME/dotfiles/bin/* $HOME/bin

heading 'Copy over .bash_aliases and .bash_functions'
cp -v $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
cp -v $HOME/dotfiles/.bash_functions $HOME/.bash_functions

if [ $(uname -s) == 'Linux' ]; then
    heading '.bashrc'
    cp -v $HOME/dotfiles/.bash_profile $HOME/.bashrc
else
    heading '.bash_profile'
    cp -v $HOME/dotfiles/.bash_profile $HOME/.bash_profile
fi

heading 'tmux config'
# tmux
cp -v $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# Vim Stuff

mkdir -p $HOME/.vim/swp

heading '.vimrc'
cp -v $HOME/dotfiles/.vimrc $HOME/.vimrc

heading 'vim snippets'
mkdir -p $HOME/.vim/UltiSnips
cp -v $HOME/dotfiles/vim-snippets/* $HOME/.vim/UltiSnips

heading 'install pathogen'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

heading 'install vim plugins'
mkdir -p $HOME/.vim/bundle
$HOME/dotfiles/get-vim-plugins.sh

heading 'vim ftplugins'
mkdir -p $HOME/.vim/after/ftplugin
cp -v $HOME/dotfiles/ftplugin/* $HOME/.vim/after/ftplugin/

heading 'All Done!'
cd $HOME

if [[ $(uname -s) == 'Linux' ]]; then
    sed -i 's/alias vim.*//' ~/.bash_aliases
fi
