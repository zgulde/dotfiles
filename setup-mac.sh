#!/bin/bash

heading() {
	echo
	echo '#########################################'
	echo '# > ' $@
	echo '#########################################'
	echo
}

log() {
	echo "-->| $@ |<--"
}

heading 'General Software'
read -p 'Press enter to open the Chrome download page'
open https://www.google.com/chrome/browser/desktop/index.html
read -p 'Press enter to open the iterm2 download page'
open https://www.iterm2.com/downloads.html
read -p 'Press enter to open the Spectacle download page'
open https://www.spectacleapp.com/
read -p 'Press enter to open the docker mac download page'
open https://www.docker.com/docker-mac
read -p 'Touch Switcher -- switch applications from touchbar'
open https://hazeover.com/touchswitcher.html

heading 'Chrome Extensions'
read -p 'uBlock Origin'
open https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
read -p 'Vimium'
open https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb
read -p 'Markdown Here'
open https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa

heading 'Installing Brew'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

heading 'Improving MacOS Userland'
log 'brew install git tree openssl tmux'
brew install git tree openssl tmux
log 'brew install pass jq ripgrep coreutils moreutils'
brew install pass jq ripgrep coreutils moreutils
log 'brew install node ruby python3 pipenv'
brew install node ruby python3 pipenv
log 'brew cask install vagrant virtualbox'
brew cask install vagrant virtualbox
log 'brew install ansible'
brew install ansible
log 'pip3 install virtualenv howdoi'
pip3 install virtualenv howdoi
log 'npm i -g lumo-cljs tldr serve'
npm i -g lumo-cljs tldr serve

heading 'iTerm Config'
log 'Keybindings'
echo 'Use "option" as "meta"'
read -p 'Settings -> Profiles -> Keys'
echo 'Cmd + Ctrl + f to fullscreen'
read -p 'Preferences -> Keys'
echo 'Map Ctrl+; to f12'
echo 'Settings -> Keys'
read -p 'Map ctrl-; to "send escape sequence", "[24~"'
log 'Installing "Atom" color scheme'
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Atom.itermcolors ~/Atom.itermcolors
open -a iTerm ~/Atom.itermcolors

heading 'MacOS Tweaks'
log 'increase key repeat rate'
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
log 'show hidden files in Finder'
defaults write com.apple.Finder AppleShowAllFiles true
log 'be able to quit Finder'
defaults write com.apple.finder QuitMenuItem -bool true
killall Finder

heading 'SSH Keys'
if [[ ! -f $HOME/.ssh/id_rsa ]] ; then
    # ssh-keygen -trsa -b2048 -C "$NAME@codeup" -f $HOME/.ssh/id_rsa -N '' # non-interactive
    ssh-keygen
	read -p 'Press enter to open the ssh key settings on GitHub'
	open https://github.com/settings/keys
else
	log 'Found ~/.ssh/id_rsa! Doing nothing'
fi

heading 'Setup global .gitignore'
if [[ ! -f ~/.gitignore_global ]]; then
    echo '.DS_Store' >> ~/.gitignore_global
    echo '.idea' >> ~/.gitignore_global
    echo '*.iml' >> ~/.gitignore_global
    echo '*.log' >> ~/.gitignore_global
    echo 'todo.md' >> ~/.gitignore_global
else
	log '~/.gitignore_global found! Doing nothing'
fi

heading 'Setting up dotfiles'
curl https://raw.githubusercontent.com/zgulde/dotfiles/master/setup-dotfiles.sh | bash

heading 'Editor Config'
log 'brew install neovim reattach-to-user-namespace'
brew install neovim reattach-to-user-namespace
log 'pip3 install neovim'
pip3 install neovim
log 'Enabling italics for tmux + iterm'
mkdir -p ~/.terminfo
cat <<. > ~/.terminfo/xterm-256color.terminfo
xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
.
tic -x ~/.terminfo/xterm-256color.terminfo
log 'Installing NeoVim Plugins'
vim -c PlugInstall -c q -c q

heading 'Java'
brew cask install java
brew tap caskroom/versions
brew cask install java8
brew install maven tomcat
# if we can, automatically tell maven to use the java 8 jdk, otherwise display a
# message
java8_install=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
if [[ -d $java8_install ]] ; then
    echo "JAVA_HOME=$java8_install" >> ~/.mavenrc
else
    echo 'you should add a line that looks like the following to ~/.mavenrc'
    echo 'in order for maven to play nice with spring boot'
    echo
    echo 'You will need to cd into /Library/Java/JavaVirtualMachines to find the'
    echo 'specific directory for your mac, but it will look similiar to below:'
    echo
    echo "JAVA_HOME=$java8_install"
    echo
fi

read -p 'Press enter to open the IntelliJ download page'
open https://www.jetbrains.com/idea/download/#section=mac

heading 'OS Settings'
echo 'Require password immediately on sleep or screen saver'
read -p 'Settings -> Security + Privacy -> General'
echo 'Set the dock to autohide'
read -p 'Settings -> Dock -> check the checkbox'
echo 'Remap capslock to control'
read -p 'Settings -> Keyboard -> Modifier Keys'
echo 'Adjust screensaver delay + setup hot corner'
read -p 'Settings -> Desktop + Screen Saver'
echo 'Adjust sleep timeout'
read -p 'Settings -> Energy Saver'
echo 'Change the hostname'
read -p 'Settings -> Sharing -> Computer Name'

heading 'All Done!'


