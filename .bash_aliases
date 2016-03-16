# +-------------------------------------------------------+
# |              general utility                          |
# +-------------------------------------------------------+

alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../../..'

alias subl.='subl .'

alias warpspeed="ssh warpspeed@$MY_SERVER"

alias ehf='sudo vim /etc/hosts'

# I edit this stuff way too much
alias reload='source ~/.bash_profile; source ~/.bash_aliases; source ~/.bash_functions'

alias cls='clear'

alias pbgrep='pbpaste | grep'
alias pback='pbpaste | ack'
alias pbvim='pbpaste | vim -'

# open a finder here
alias f='open -a Finder ./' 

alias curlput='curl -X PUT'
alias curlget='curl -X GET'
alias curlpost='curl -X POST'

# +-------------------------------------------------------+
# |              preferable implementation                |
# +-------------------------------------------------------+

alias vim='mvim -v'

# confirmation and verbosity when manipulating files
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

alias egrep='egrep --color=auto'
alias grep='grep --color=auto'

# +-------------------------------------------------------+
# |                   ls stuff                            |
# +-------------------------------------------------------+

alias l='ls -Gp1h'
alias ls='ls -G'
alias lf='ls -dG1 */'
alias laf='ls -aG1 -d .*/ */'
alias ll='ls -Gplh'
alias la='ls -Gplah'
alias lt='echo "------- Most Recent --------" && ll -t'
alias lat='echo "------- Most Recent --------" && la -t'
alias ltr='ll -tr && echo "------- Most Recent --------"'
alias latr='la -tr && echo "------- Most Recent --------"'
alias lsd='la | lolcat'

# +---------------------------------------------------------+
# |                     git stuff                           |
# +---------------------------------------------------------+

alias gs='git status -s' 
alias gl="git log --graph --pretty='<%Cred%H%Creset> %Cgreen%an%Creset %Cblue(%cr)%Creset%n%s%n%n%b'"
alias gd='git diff'
alias gdp='git diff HEAD^ HEAD' # show the difference with the previous commit
alias ga='git add'
alias gap='git add --patch'
alias gc='git commit' -v
alias gcm='git commit -m'
alias gb='git branch'
alias gco='git checkout'
alias gcob='git checkout -b'
alias push='git push origin'
alias pull="git pull origin master"
alias pushme='git push origin zach'
alias deploy='git push warpspeed master'

# +---------------------------------------------------------+
# |                 vagrant commands                        |
# +---------------------------------------------------------+

alias vs='vagrant status'
alias vh='vagrant halt'
alias vu='vagrant up'
alias vssh='cd ~/vagrant-lamp && vagrant ssh'
alias vreset='vagrant halt && vagrant up'
