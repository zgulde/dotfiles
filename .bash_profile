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
PATH="$PATH:/usr/local/go/bin" # go-lang
PATH="$PATH:/usr/local/php5/bin"
PATH="$PATH:~/anaconda2/bin"
PATH="$PATH:~/bin"

export EDITOR=vim
export GOPATH='/Users/zach/go'

# unlimeted history
export HISTSIZE=
export HISTFILESIZE=

shopt -s autocd
bind TAB:menu-complete
shopt -s autocd

# prompt
export PS2="=> "
export PS1="\[\e[34m\]\w/\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\n $ "
# stuff that happens on new session
# fortune -a | randcowsay | lolcat
