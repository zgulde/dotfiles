source ~/.env
source ~/.aliases
source ~/.bash_functions

PATH=/bin
PATH=/sbin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=$HOME/scripts:$PATH
PATH=$HOME/bin:$PATH
PATH=node_modules/.bin:$PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=$HOME/go
export FZF_DEFAULT_OPTS='--reverse'

# unlimited history
export HISTSIZE=
export HISTFILESIZE=

# readline
shopt -s autocd
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set blink-matching-paren on"
bind "set colored-completion-prefix on"
bind "set colored-stats on"
bind "set completion-query-items 50"

# if we're on macos...
if [[ $(uname -s) == "Darwin" ]]; then
    # pass tab completion
    source /usr/local/Cellar/pass/1.6.5_1/etc/bash_completion.d/password-store
    # taskwarrior tab completion
    source /usr/local/Cellar/task/2.5.1/etc/bash_completion.d/task.sh
    complete -o nospace -F _task t
    complete -o nospace -F _task tw
fi

reset='\[\e[0m\]'
red='\[\e[0;31m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
blue='\[\e[0;34m\]'
purple='\[\e[0;35m\]'
cyan='\[\e[0;36m\]'

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local last_exit_code=$?
    pwd > $HOME/.cwd
    PS1=

    # # small prompt
    # PS1="${blue}\W${reset}"
    # if [[ $last_exit_code -ne 0 ]]; then
    #     PS1="$PS1 ${red}${last_exit_code}"
    # fi
    # PS1="$PS1 > ${reset}"

    # for some reason virtualenv doesn't like my prompt
    if [[ -n $VIRTUAL_ENV ]]; then
        PS1="$PS1($(basename $VIRTUAL_ENV)) "
    fi
    PS1="$PS1${cyan}\u${reset} at ${green}\h"
    PS1="$PS1 ${blue}\w"
    PS1="$PS1 ${yellow}\`parse_git_branch\`"
    PS1="$PS1${reset}\n"
    if [[ $last_exit_code -ne 0 ]]; then
        PS1="$PS1 ${red}$last_exit_code"
    fi
    PS1="$PS1${reset} > "
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# pick up where we left off
[[ -f $HOME/.cwd ]] && cd "$(< $HOME/.cwd)"
