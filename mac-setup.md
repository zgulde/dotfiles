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
read -p 'Google Chrome'
open https://www.google.com/chrome/browser/desktop/index.html

read -p 'Docker'
open https://www.docker.com/docker-mac

read -p 'iTerm2 -- Better terminal emulator'
open https://www.iterm2.com/downloads.html

read -p 'Spectable -- Window manager'
open https://www.spectacleapp.com/

read -p 'Touch Switcher -- switch applications from touchbar'
open https://hazeover.com/touchswitcher.html

read -p 'Total Spaces 2 -- to get rid of fullscreen transition animations'
open https://totalspaces.binaryage.com/

read -p 'Contexts -- better window/application switcher'
open https://contexts.co/

read -p 'Fluid App -- Turn web apps into native ones'
open http://fluidapp.com/
```

- [Touch Switcher -- switch applications from touchbar](https://hazeover.com/touchswitcher.html)

**Chrome Extensions**

- [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
- [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa)
- [Live Reload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)

```
read -p 'uBlock Origin'
open https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
read -p 'Vimium'
open https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb
read -p 'Markdown Here'
open https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa
read -p 'Live Reload'
open https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
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
brew install ansible git tree openssl tmux htop
brew install pass jq ripgrep coreutils netcat
brew install moreutils --no-parallel
brew install parallel cowsay
brew install node ruby python3 pipenv leiningen clojure
brew install ansible
brew cask install vagrant virtualbox
brew cask install firefox

pip3 install virtualenv howdoi
npm i -g lumo-cljs tldr serve yarn
```

```
pass      # password manager
jq        # command line json processor
ripgrep   # better grep, like ag or ack
coreutils # newer gnu coreutils, not the outdated ones that come with macos
moreutils # vipe, among others

node ruby python3 pipenv # scripting languages

brew casks -- vagrant virtualbox # vagrant w/ ansible for php development
```

use a modern version of bash, not the one that comes w/ MacOS (which is a major
version behind)

```
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

1. `cmd + ctrl + f` to full screen (Preferences -> Keys)

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
