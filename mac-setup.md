# MacOS Setup

Start with the "install brew" section, as a lot of the others depend on brew
being installed. The other sections can be followed / omitted in any order.

All code blocks are intended to be copy/paste able.

* [General Software](#general-software)
* [OS Settings](#os-settings)
* [Install Brew](#install-brew)
* [Improve MacOS Userland](#improve-macos-userland)
* [Editor config](#editor-config)
* [iTerm setup](#iterm-setup)
* [MacOS Tweaks](#macos-tweaks)
* [Create SSH Keys](#create-ssh-keys)
* [Global `.gitignore`](#global-gitignore)
* [Dotfiles](#dotfiles)
* [Java](#java)

## General Software

```
read -p 'Press enter to open the Chrome download page'
open https://www.google.com/chrome/browser/desktop/index.html

read -p 'Press enter to open the iterm2 download page'
open https://www.iterm2.com/downloads.html

read -p 'Press enter to open the Spectacle download page'
open https://www.spectacleapp.com/

read -p 'Press enter to open the docker mac download page'
open https://www.docker.com/docker-mac
```

## OS Settings

- Require password immediately on sleep or screen saver -- Settings -> Security + Privacy -> General

- Set the dock to autohide (Settings -> Dock -> checkbox for automatically show/hide dock)

- Remap capslock to control (Settings -> Keyboard -> Modifier Keys)

- Adjust screensaver delay + setup hot corner to start screen saver -- Settings -> Desktop + Screen Saver

- Adjust Sleep Timeout -- Settings -> Energy Saver

- Change the hostname -- Settings -> Sharing -> Computer Name

## Install Brew

1. Install brew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
```

## Improve MacOS Userland

```
# general utility
brew install git tree openssl tmux

brew install pass      # password manager
brew install jq        # command line json processor
brew install ripgrep   # better grep, like ag or ack
brew install coreutils # newer gnu coreutils, not the outdated ones that come with macos
brew install moreutils # vipe, among others

# scripting languages
brew install node ruby python3 pipenv
```

```
# package manager specific stuff
pip3 install virtualenv howdoi

npm i -g lumo-cljs tldr serve
```

```
# use a modern version of bash
brew install bash
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells >/dev/null
chsh -s /usr/local/bin/bash
```

## Editor config

```
brew install neovim
brew install reattach-to-user-namespace
# necessary for python-based plugins
pip3 install neovim
```

Enable italics in iterm + tmux

```
mkdir -p ~/.terminfo

cat <<. > ~/.terminfo/xterm-256color.terminfo
xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
.
tic -x ~/.terminfo/xterm-256color.terminfo
```

The first time neovim runs, you'll need to do a `:PlugInstall`

## iTerm setup

1. Tell iTerm to interpret option as meta

    Settings -> Profiles -> Keys

1. iTerm colors / fonts

    [See the full list of colors here](https://github.com/mbadolato/iTerm2-Color-Schemes)

    Really I just use [this one](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Atom.itermcolors)

    Tweak fonts (14pt monaco) + line spacing (1.3)

1. Send f12 for Ctrl+; (see tmux.config comment for f12)

    Settings -> Keys -> add `ctrl-;`, map to "send escape sequence", use `[24~` for the escape sequence

## MacOS Tweaks

```
# faster key repeat rate than is available through the gui config
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# show hidden files in finder
defaults write com.apple.Finder AppleShowAllFiles true
# be able to quit the finder (can cause the desktop to be weird)
defaults write com.apple.finder QuitMenuItem -bool true
killall Finder
```

## Create SSH Keys

```
if [[ ! -f $HOME/.ssh/id_rsa ]] ; then
    # ssh-keygen -trsa -b2048 -C "$NAME@codeup" -f $HOME/.ssh/id_rsa -N '' # non-interactive
    ssh-keygen
fi

read -p 'Press enter to open the ssh key settings on GitHub'
open https://github.com/settings/keys
```

## Global `.gitignore`

```
# my .gitconfig in my dotfiles already points to this file as the global ignore file
# setup the global gitignore file
if [[ ! -f ~/.gitignore_global ]]; then
    echo 'Setting up global gitignore file...'
    echo '.DS_Store' >> ~/.gitignore_global
    echo '.idea' >> ~/.gitignore_global
    echo '*.iml' >> ~/.gitignore_global
    echo '*.log' >> ~/.gitignore_global
    echo 'todo.md' >> ~/.gitignore_global
fi
```

## Dotfiles

```
# clones my dotfiles repo and puts dotfiles in the right places
curl https://raw.githubusercontent.com/zgulde/dotfiles/master/setup.sh | bash
```

## Java

```
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
```
