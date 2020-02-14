# DEBUG=1
if [[ $DEBUG -eq 1 ]] ; then dbg=echo; else dbg=: ; fi

$dbg Sourcing .env
source ~/.env
$dbg Sourcing aliases
source ~/.aliases
$dbg Sourcing bash_functions
source ~/.bash_functions

$dbg Setting environment variables
export ANSIBLE_NOCOWS=1
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=$HOME/go
export FZF_DEFAULT_OPTS='--reverse'
export HISTSIZE=
export HISTFILESIZE=
export HISTIGNORE='ls:clear:ll:la:ltr:latr:exit'
export DOKKU_HOST=zachs.site

# Seems this is necessary for java9, specifically running spring applications.
# This module used to be included by default, but no longer is. See
# https://stackoverflow.com/questions/12525288/is-there-a-way-to-pass-jvm-args-via-command-line-to-maven
# and http://maven.apache.org/configure.html
# basically this is an extra option maven passes to `java`
# export MAVEN_OPTS='--add-modules java.xml.bind'

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# export JAVA_HOME=$(/usr/libexec/java_home)

$dbg Setting up PATH
PATH=/bin
PATH=/sbin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/bin:$PATH # put homebrew before the mac stuff
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=$HOME/scripts:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/opt/bin:$PATH
PATH=node_modules/.bin:$PATH
PATH=$GOPATH/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/.composer/vendor/bin:$PATH
PATH=/usr/local/anaconda3/bin:$PATH
# PATH=$HOME/anaconda3/bin:$PATH
# PATH=$HOME/.opam/system/bin:$PATH
# PATH=$JAVA_HOME/bin:$PATH

export PATH

# we want the `pandoc` from /usr/local/bin, not the one from anaconda, but we do
# want everything else from anaconda
alias pandoc=/usr/local/bin/pandoc

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/share/man:$MANPATH"

shopt -s autocd
shopt -s dirspell
shopt -s direxpand
shopt -s histappend
# shopt -o notify

# if we're on macos...
if [[ $(uname -s) == "Darwin" ]]; then
    # pass tab completion
    source /usr/local/etc/bash_completion.d/pass
    source /usr/local/etc/bash_completion.d/git-completion.bash

    # complete -C /Users/zach/go/src/github.com/posener/complete/gocomplete/gocomplete go

    # taskwarrior tab completion
    # source /usr/local/Cellar/task/2.5.1/etc/bash_completion.d/task.sh
    # complete -o nospace -F _task t
    # complete -o nospace -F _task tw
fi

$dbg Pandoc bash-completion
eval "$(pandoc --bash-completion)"
$dbg cods myserver bash-completion
eval "$(myserver bash-completion)"

# eval "$(conda shell.bash hook)"

$dbg PROMPT_COMMAND setup

reset='\[\e[0m\]'
red='\[\e[0;31m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
blue='\[\e[0;34m\]'
purple='\[\e[0;35m\]'
cyan='\[\e[0;36m\]'

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    history -a
    local last_exit_code=$?
    PS1=

    # # small prompt
    # PS1="${blue}\W${reset}"
    # # PS1="$PS1 ${yellow}\`minimal_git_status\`${reset}"
    # if [[ $last_exit_code -ne 0 ]]; then
    #     PS1="$PS1 ${red}${last_exit_code}${reset}"
    # fi
    # PS1="$PS1 $ ${reset}"

    # for some reason virtualenv doesn't like my prompt
    if [[ -n $VIRTUAL_ENV ]]; then
        PS1="$PS1($(basename $VIRTUAL_ENV)) "
    fi
    PS1="$PS1[${cyan}\u${reset}@${green}\h${reset}]"
    PS1="$PS1(${blue}\w${reset})"
    PS1="$PS1${yellow}\`parse_git_branch\`"
    PS1="$PS1${reset}\n"
    if [[ $last_exit_code -ne 0 ]]; then
        PS1="$PS1 ${red}$last_exit_code"
    fi
    PS1="$PS1${reset} λ "

}

__minimal_prompt_command() {
    local last_exit_code=$?
    PS1=

    PS1="[${blue}\u${reset}@${green}\h${reset}:${yellow}\W${reset}] $ "
    if [[ $last_exit_code -ne 0 ]]; then
        PS1="${red}${last_exit_code}${reset} $PS1"
    fi

}
alias mp='PROMPT_COMMAND=__minimal_prompt_command'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

$dbg Readline bindings
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set blink-matching-paren on"
bind "set colored-completion-prefix on"
bind "set colored-stats on"
bind "set completion-query-items 50"
bind "set completion-ignore-case on"

bind '"\C-xp": print-last-kbd-macro'
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
bind '"\ea": "\C-e >/dev/null 2>&1 &"'

# Conda env setup -- this makes starting a new terminal take too long, so we'll
# wrap it in a function
function conda-env() {
    eval "$(conda shell.bash hook)"
}

# tab completion for Makefile targets
complete -W "\`test -f Makefile && grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
