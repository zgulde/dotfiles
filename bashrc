source ~/.env
source ~/.aliases
source ~/.bash_functions

PATH="$PATH:/usr/local/bin"
PATH="$PATH:/Users/zach/scripts"
PATH="$PATH:/Users/zach/bin"
PATH="$PATH:node_modules/.bin"

# use modern coreutils, not the outdated ones from macOS
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH
export EDITOR=nvim
export VISUAL=nvim
export GOPATH='/Users/zach/go'
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

# pass tab completion
source /usr/local/Cellar/pass/1.6.5_1/etc/bash_completion.d/password-store
# taskwarrior tab completion
source /usr/local/Cellar/task/2.5.1/etc/bash_completion.d/task.sh
complete -o nospace -F _task t
complete -o nospace -F _task tw

# prompt
export PS2="=> "
export PS1="\[\e[36m\]\u\[\e[m\] at \[\e[32m\]\h\[\e[m\] \[\e[34m\]\w\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\n %\[\e[m\] "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
