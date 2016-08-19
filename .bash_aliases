# +-------------------------------------------------------+
# |              general utility                          |
# +-------------------------------------------------------+

alias blog='cd ~/personal-site/blog/'
alias my-site='cd ~/personal-site/'

alias pyserver='python -m SimpleHTTPServer'

alias todo='vim ~/Dropbox/todo-work.txt'

alias :q='exit'
alias :e='vim'

alias pbbl='pebble build && pebble install --emulator aplite && pebble logs'

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
alias pbjson='pbpaste | python -m json.tool | pbcopy'

# open a finder here
alias f='open -a Finder ./' 

alias curlput='curl -X PUT'
alias curlget='curl -X GET'
alias curlpost='curl -X POST'
alias findr='find . -name '

# +-------------------------------------------------------+
# |              preferable implementation                |
# +-------------------------------------------------------+

alias composer='docker run --rm -itv $(pwd):/app composer/composer'
alias php='/usr/local/php5/bin/php'

alias scheme="rlwrap -r -c -f /Users/zach/scheme.txt scheme"

alias vim='/usr/local/Cellar/macvim/7.4-88/MacVim.app/Contents/MacOS/Vim'

# confirmation and verbosity when manipulating files
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

alias mkdir='mkdir -p'

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
alias gl="git log --graph --pretty='%Cgreen%an%Creset %Cblue(%cr)%Creset <%Cred%H%Creset>%n%s%n%n%b'"
alias gd='git diff'
alias gdp='git diff HEAD^ HEAD' # show the difference with the previous commit
alias ga='git add'
alias gaa='git add -A'
alias gap='git add --patch'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gres='git reset HEAD'
alias push='git push origin'
alias pull="git pull origin master"
alias deploy='git push warpspeed master'
alias checkmeout='git checkout zach'
alias gfi='git commit -am "$(date)"'
alias current-branch="gb | grep '^*' | sed 's/*\ //'"
alias pushme='git push origin "$(current-branch)"'

# +---------------------------------------------------------+
# |                 vagrant commands                        |
# +---------------------------------------------------------+

alias vs='vagrant status'
alias vh='vagrant halt'
alias vu='vagrant up'
alias vssh='vagrant ssh'
alias vreset='vagrant halt && vagrant up'
alias wssh='cd ~/warpspeed-vagrant/ && vagrant ssh || vagrant up && vagrant ssh'
alias vlssh='cd ~/vagrant-lamp/ && vagrant ssh || vagrant up && vagrant ssh'
