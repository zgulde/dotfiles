#!/bin/sh

echo "last back up" > backup.log
echo $(/bin/date) >> backup.log
echo "Backing up..." >> backup.log
echo "\n----------------------------------------------------" >> backup.log
echo "\ncopying private.xml...\n" >> backup.log
cp -v ~/Library/Application\ Support/Karabiner/private.xml . >> backup.log
echo "\n----------------------------------------------------" >> backup.log
echo "\ncopying sublime preferences...\n" >> backup.log
cp -v ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings . >> backup.log
echo "\n----------------------------------------------------" >> backup.log
echo "\ncopying sublime keyboard shortcuts...\n" >> backup.log
cp -v ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap . >> backup.log
echo "\n----------------------------------------------------" >> backup.log
echo "\ncopying sublime snippets...\n" >> backup.log
cp -v -a ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/snippets/. snippets/ >> backup.log
echo "\n----------------------------------------------------" >> backup.log
echo "\nbacking up .bash_profile..." >> backup.log
cp -v ~/.bash_profile . >> backup.log
echo "\nDone!\n" >> backup.log

git status
less backup.log
