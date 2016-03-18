source ~/.env
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bashrc
source ~/.emojis
source ~/.profile
source ~/.rvm/scripts/rvm # Load RVM into a shell session *as a function*

PATH="$PATH:/Users/zach/scripts"
PATH="$PATH:." # add current directory to PATH
PATH="$PATH:/usr/local/share/scala/bin" # scala

# prompt
export PS2="=> "
alias mp='export PS1="\[\e[33m\]\`minimal_git_status\`\[\e[m\]\[\e[32m\]>\[\e[m\] "'
alias dp='export PS1="\`echolinebreak\`\n\[\e[32m\]\t\[\e[m\] \[\e[34m\]\w/\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\n\`echo -e \"$HOT_BEVERAGE\"\`  "'
dp

# stuff that happens on new session
cmatrix -C blue -s

echolinebreak
php ~/php/welcome.php
echolinebreak

fortune -a | randcowsay | lolcat
