# grab env variables
source ~/.env

# these two git functions copied from http://ezprompt.net/
#
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "|${BRANCH}|${STAT}"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# sends an email from my mailgun domain
# $1 : to
# $2 : subject
# $3 : message body
# $4 : from (optional)
function sendEmail {

	if [ "$1" == "help" ]
	then
		echo ""
		echo "description"
		echo "    sends an email from my mailgun domain"
		echo "usage"
		echo "    $ sendEmail {to} {subject} {body} [from='Don't Reply']"
		echo ""
		return 
    fi

    TO=$1
    SUBJECT=$2
    BODY=$3
    FROM=$4

    if [ -z FROM ]
	then
		FROM="Don't Reply"
	fi

    curl -s --user "api:$MAILGUN_API_KEY" \
        https://api.mailgun.net/v3/$MAILGUN_DOMAIN/messages \
        -F from="$FROM <postmaster@$MAILGUN_DOMAIN>" \
        -F to="$TO" \
        -F subject="$SUBJECT" \
        -F text="$BODY"
}

PATH=$PATH:/Users/zach/scripts

alias vim='mvim -v'

alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../../..'

alias cls='clear'
alias c='clear'

alias h='cd ~/'

alias egrep='egrep --color=auto'
alias grep='grep --color=auto'

alias pbgrep='pbpaste | grep'
alias pback='pbpaste | ack'

alias subl.='subl .'

alias warpspeed="ssh warpspeed@$MY_SERVER"
alias deploy='git push warpspeed master'

alias ehf='sudo subl /etc/hosts'

alias reload='source ~/.bash_profile'

# use curl to just get the headers of a full response
function curlh {
    curl -s -D - $1 -o /dev/null | sed 's/.*/< &/'
}

alias curlput='curl -X PUT'

#ls stuff
alias ls='ls -G'
alias lf='ls -dG1 */'
alias laf='ls -aG1 -d .*/ */'
alias ll='ls -Gp1h'
alias la='ls -Gplah'
alias lt='echo "------- Most Recent --------" && ll -t'
alias lat='echo "------- Most Recent --------" && la -t'
alias ltr='ll -tr && echo "------- Most Recent --------"'
alias latr='la -tr && echo "------- Most Recent --------"'
alias lsd='ls | lolcat'

#confirmation when manipulating files
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

#open finder in current directory
alias f='open -a Finder ./' 

#git stuff
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias ga='git add'
alias gap='git add --patch'
alias gc='git commit'
alias gb='git branch'
alias gco='git checkout'
alias push='git push origin'
alias pull="git pull origin master"
alias pushme='git push origin zach'

# do a git diff but just show which files are different
function gdf {
    gd $1 | grep ^diff | sed s/diff\ --git\ a//g
}

#vagrant commands
alias vs='vagrant status'
alias vh='vagrant halt'
alias vu='vagrant up'
alias vssh='cd ~/vagrant-lamp && vagrant ssh'
alias vreset='vagrant halt && vagrant up'

function vl {
	if [ -z "$1" ]
	then
		cd ~/vagrant-lamp/sites/
		lt
	else
		cd ~/vagrant-lamp/sites/$1.dev
		git status
	fi
}

function getStatus {
	curl -vs $1 2>&1 | grep '< HTTP/1.1'  | sed -e 's/< HTTP\/1\.1\ //g'
}


alias enterthematrix='cmatrix'

# cowsay with a random cow
function randcowsay {
  NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
  WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
  THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

   cowsay -f $THISCOW $1
}

function echolinebreak {
	numcolumns=$(tput cols)
	linebreak=""
	for (( c=0; c<numcolumns; c++ ))
	do
	   linebreak="=$linebreak"
	done
		echo $linebreak
}

bind '"\t":menu-complete'

cmatrix -C blue -s

echolinebreak
php ~/php/welcome.php
echolinebreak

fortune -a | randcowsay | lolcat

export PS1="\`echolinebreak\`\n\[\e[32m\]\t\[\e[m\] \[\e[34m\]\w/\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\n > "

# going back and forth from a dp detailed prompt to a mp minimal prompt
alias mp='export PS1="\[\e[32m\]>\[\e[m\] "'
alias dp='export PS1="\`echolinebreak\`\n\[\e[32m\]\t\[\e[m\] \[\e[34m\]\w/\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\n > "'

source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
