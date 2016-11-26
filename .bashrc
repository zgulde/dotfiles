source ~/.env
source ~/.aliases
source ~/.bash_functions

export PATH="$PATH:/home/zach/bin"
export PATH="$PATH:/usr/local/go/bin" # go-lang
export PATH="$PATH:/home/zach/rkt-v1.0.0" # rkt

export FZF_DEFAULT_OPTS='--reverse'
export EDITOR=vim
export GOPATH='/Users/zach/go'
export TERM=screen-256color
# unlimeted history
export HISTSIZE=
export HISTFILESIZE=

shopt -s autocd
bind TAB:menu-complete
shopt -s autocd

# prompt
export PS2="=> "
export PS1="\u@\h \[\e[34m\]\w/\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\n $ "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
