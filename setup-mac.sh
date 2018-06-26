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

logdo() {
	log "$@"
	eval "$@"
}

general_software() {
	heading 'General Software'

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
}

chrome_extensions() {
	heading 'Chrome Extensions'
	read -p 'uBlock Origin'
	open https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
	read -p 'Vimium'
	open https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb
	read -p 'Markdown Here'
	open https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa
	read -p 'Live Reload'
	open https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
}

firefox_extensions() {
	echo https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
	echo https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
	echo https://addons.mozilla.org/en-US/firefox/addon/markdown-here/
	echo https://addons.mozilla.org/en-US/firefox/addon/livereload/
}

install_brew() {
	heading 'Installing Brew'
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
}

userland() {
	logdo brew install git tree openssl tmux htop bash
	logdo brew install pass jq ripgrep coreutils netcat
	logdo brew install moreutils --no-parallel
	logdo brew install parallel cowsay
	logdo brew install node ruby python3 pipenv leiningen clojure
	logdo brew install ansible
	logdo brew cask install vagrant virtualbox
	logdo brew cask install firefox

	logdo pip3 install virtualenv howdoi
	logdo npm i -g lumo-cljs tldr serve yarn
}

iterm_config() {
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
}

macos_tweaks() {
	heading 'MacOS Tweaks'
	log 'increase key repeat rate'
	defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
	log 'show hidden files in Finder'
	defaults write com.apple.Finder AppleShowAllFiles true
	log 'be able to quit Finder'
	defaults write com.apple.finder QuitMenuItem -bool true
	killall Finder
}

ssh_keys() {
	heading 'SSH Keys'
	if [[ ! -f $HOME/.ssh/id_rsa ]] ; then
		# ssh-keygen -trsa -b2048 -C "$NAME@codeup" -f $HOME/.ssh/id_rsa -N '' # non-interactive
		ssh-keygen
		read -p 'Press enter to open the ssh key settings on GitHub'
		open https://github.com/settings/keys
	else
		log 'Found ~/.ssh/id_rsa! Doing nothing'
	fi
}

global_gitignore() {
	heading 'Setup global .gitignore'
	if [[ ! -f ~/.gitignore_global ]] ; then
		echo '.DS_Store' >> ~/.gitignore_global
		echo '.idea' >> ~/.gitignore_global
		echo '*.iml' >> ~/.gitignore_global
		echo '*.log' >> ~/.gitignore_global
		echo 'todo.md' >> ~/.gitignore_global
	else
		log '~/.gitignore_global found! Doing nothing'
	fi
}

dotfiles() {
	heading 'Setting up dotfiles'
	curl https://raw.githubusercontent.com/zgulde/dotfiles/master/setup-dotfiles.sh | bash
}

nvim_setup() {
	heading 'Editor Config'
	logdo brew install neovim reattach-to-user-namespace
	logdo pip3 install neovim
	log 'Enabling italics for tmux + iterm'
	mkdir -p ~/.terminfo
	cat <<-. > ~/.terminfo/xterm-256color.terminfo
		xterm-256color|xterm with 256 colors and italic,
		sitm=\E[3m, ritm=\E[23m,
		use=xterm-256color,
	.
	tic -x ~/.terminfo/xterm-256color.terminfo
	log 'Installing NeoVim Plugins'
	nvim -c PlugInstall -c q -c q
}

java() {
	heading 'Java'
	logdo brew cask install java
	logdo brew tap caskroom/versions
	logdo brew cask install java8
	logdo brew install maven tomcat
	# if we can, automatically tell maven to use the java 8 jdk, otherwise
	# display a message
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
}

os_settings() {
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
}

run_all() {
	general_software ; chrome_extensions ; install_brew ; userland
	iterm_config ; macos_tweaks ; ssh_keys ; global_gitignore ; dotfiles
	nvim_setup ; java ; os_settings
}

if [[ $# -eq 0 ]] ; then
	echo 'You can pass the following options:'
	echo
	echo '- all'
	echo '- general_software - chrome_extensions - install_brew - userland'
	echo '- iterm_config - macos_tweaks - ssh_keys - global_gitignore - dotfiles'
	echo '- nvim_setup - java - os_settings'
	echo
	echo 'For example:'
	echo
	echo "    bash $0 general_software chrome_extensions"
	echo "    bash $0 iterm_config install_brew nvim_setup java userland"
	echo "    bash $0 all"
else
	for arg in $@ ; do
		if [[ $arg == all ]] ; then
			echo 'Running everything...'
		else
			echo $arg
		fi
	done
	heading 'All Done!'
fi

