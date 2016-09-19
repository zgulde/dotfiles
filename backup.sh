#!/bin/sh

echo "last back up" >> backup.log
echo $(/bin/date) >> backup.log
cowsay "Backing up..." >> backup.log

# plugin list
echo "-----------Sublime Plugins-------------" > plugins.txt
ls /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages >> plugins.txt
echo "" >> plugins.txt

echo "----------Vim Stuff----------" >> plugins.txt
echo "--- /plugin" >> plugins.txt
ls ~/.vim/plugin >> plugins.txt
echo "--- /autoload" >> plugins.txt
ls ~/.vim/autoload >> plugins.txt
echo "--- /bundle" >> plugins.txt
ls ~/.vim/bundle >> plugins.txt
echo "--- /colors"  >> plugins.txt
ls ~/.vim/colors >> plugins.txt

# backup data

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "copying private.xml..." >> backup.log
cp -v ~/Library/Application\ Support/Karabiner/private.xml . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "copying sublime preferences..." >> backup.log
cp -v ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "copying sublime keyboard shortcuts..." >> backup.log
cp -v ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "copying sublime snippets..." >> backup.log
cp -v -a ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/snippets/. sublime-snippets/ >> backup.log
cowsay "copying vim snippets..." >> backup.log
cp -v -a ~/.vim/UltiSnips/. vim-snippets/ >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up .bash_profile..." >> backup.log
cp -v ~/.bash_profile . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up alias file..." >> backup.log
cp -v ~/.bash_aliases . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up functions file..." >> backup.log
cp -v ~/.bash_functions . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up .vimrc" >> backup.log
cp -v ~/.vimrc . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up vim ftplugins..." >> backup.log
cp -v ~/.vim/after/ftplugin/* ./ftplugin >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up my vim color scheme" >> backup.log
cp -v ~/.vim/colors/mine.vim . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up tmux.conf..." >> backup.log
cp -v ~/.tmux.conf . >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "backing up my scripts..." >> backup.log
cp -v ~/bin/* ./bin/ >> backup.log

echo "\n----------------------------------------------------\n" >> backup.log
cowsay "Done!" >> backup.log

