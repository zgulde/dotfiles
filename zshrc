# # custom completion
fpath=(~/.zsh_completions $fpath)

autoload -Uz compinit && compinit

# tab cycles through highlighted completions
zstyle ':completion:*' menu select

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history extended_history
unsetopt beep

# emacs style keybindings
bindkey -e
# make words behave like bash and emacs words
autoload select-word-style && select-word-style bash

# (by default) zsh does not do word splitting for unquoted parameter expansions.
# see https://stackoverflow.com/questions/6715388/variable-expansion-is-different-in-zsh-from-that-in-bash
setopt sh_word_split

# prompt
_git_prompt() {
	local branch="`git rev-parse --abbrev-ref HEAD 2>/dev/null`"
	local commit_msg="`git log -n1 --pretty='%s' 2>/dev/null`"
	[[ -n $branch ]] && echo "<${branch}:${commit_msg}>`_git_short_status`"
}

_git_short_status() {
	local bits=''
    gstatus="`git status 2>&1`"
    case "${gstatus:l}" in
        *'renamed'*)         bits+=">" ;|
        *'ahead'*)           bits+="*" ;|
        *'to be committed'*) bits+='+' ;|
        *'untracked files'*) bits+="?" ;|
        *'deleted'*)         bits+='x' ;|
        *'not staged'*)      bits+='!' ;|
    esac
    [[ -n $bits ]] && bits=" ${bits}"
    echo "${bits}"
}

setopt prompt_subst
PROMPT=$'%F{green}%~%f %F{yellow}$(_git_prompt)%f\n%(?..%F{red}%?%f) λ '
RPROMPT='%*'

# PATH stuff
PATH=/bin
PATH=/sbin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/opt/bin:$PATH
# [[ -z $GOPATH ]] && PATH=$GOPATH/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/.composer/vendor/bin:$PATH
PATH=/usr/local/anaconda3/bin:$PATH

export EDITOR=nvim
export VISUAL=nvim
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

source ~/.aliases
source ~/.functions

# antigen
source ~/antigen.zsh

# # tab completion for Makefile targets (TODO: from bash, this needs tweaking)
# complete -W "\`test -f Makefile && grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
