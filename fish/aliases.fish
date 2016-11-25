alias pb 'xsel --clipboard'

alias emc 'emacsclient'
alias ehf 'sudo vim /etc/hosts'

alias rm 'rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

alias mkdir='mkdir -p'

# git stuff
alias gs 'git status'
alias gco 'git checkout'
alias gcob 'git checkout -b'
alias ga 'git add'
alias gap 'git add --patch'
alias gaa 'git add -A'
alias gc 'git commit'
alias gb 'git branch'
alias gfo 'git fetch origin'
alias gl "git log --graph --pretty='%Cgreen%an%Creset %Cblue(%cr)%Creset <%Cred%h%Creset>%n%s%n%n%b'"
alias current_branch 'git branch | sed -n \'/\* /s//p\''
alias edit 'emacsclient -nw'
