# vim: set ft=sh:

pd() {
    local filename="$(date +%Y-%m-%d_%H:%M:%S)-ipython.log"
	ipython3 --logfile=$filename -i -c "
import pandas as pd
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as sns
import itertools as it
from pydataset import data
%matplotlib qt
mpl.rcParams['figure.figsize'] = [10, 8]
"
}

# custom ll
list-long() {
	local cols='##PERMS### LINKS OWNER GROUP SIZE MONTH DAY HH:MM NAME'
	(echo $cols
	ls -lh | sed 1d | awk "{print \$0}; NR % 10 == 0 {print \"$cols\"}"
	) | column -t
}

# look at all the emoji
emoji() {
	if [[ -n $1 ]] ; then
		grep -i $1 ~/misc/emoji-list.txt
	else
		cat ~/misc/emoji-list.txt
	fi
}

# figure out what is running on a given port
whats-on-port() {
	# stolen from https://github.com/alexch/dotfiles/blob/master/functions.sh
	lsof -i TCP:$1
}

# look something up in the php manual
phpman() {
    open "http://php.net/manual-lookup.php?pattern=$1&scope=quickref"
}

# google (duckduckgo) something
g() {
    ruby -r cgi -e '`open http://duckduckgo.com/?q=#{CGI.escape(ARGV.join(" "))}`' "$@"
}

# interaction with codeup vagrant-lamp box
vl() {
    if [[ $# -eq 0 ]]; then
        cd ~/vagrant-lamp
    else
        ( cd ~/vagrant-lamp && vagrant $* )
    fi
}

# interaction with warpspeed vagrant box
warpspeed() {
    if [[ $# -eq 0 ]]; then
        cd ~/Sites
    else
        ( cd ~/warpspeed-vagrant && vagrant $* )
    fi
}

# interaction w/ vagrant homestead box
homestead() {
    if [[ $# -eq 0 ]]; then
        cd ~/Code
    elif [[ $1 == "cfg" ]]; then
        vim ~/.homestead/Homestead.yaml
    else
        ( cd ~/Homestead && vagrant $* )
    fi
}

# get the status code from a url
get-status() {
    local url=$1
    curl --silent --head $url |\
        head -n 1 |\
        egrep -o '\b\d{3}\b'
}

# create and switch to a directory
mcd() {
    mkdir -p "$@"
    cd "$@"
}

# cowsay with a random cow
randcowsay() {
    NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
    WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
    THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

    cowsay -f $THISCOW $1
}

# sends an email from my mailgun domain - sendEmail <to> <subject> <body> [from='Don't Reply']
sendEmail() {

	if [ "$1" == "help" ]
	then
		echo ""
		echo "description"
		echo "    sends an email from my mailgun domain"
		echo "usage"
		echo "    $ sendEmail <to> <subject> <body> [from='Don't Reply']"
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

# parse_git_branch and parse_git_dirty adapted from http://ezprompt.net/

# get current branch in git repo (for PS1)
function parse_git_branch() {
	local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	local commit_msg=`git log -n1 --pretty='%s' 2>/dev/null`
	if [ ! "${branch}" == "" ] ; then
		local status=`parse_git_dirty`
		echo "<${branch}:${commit_msg}>${status}"
	else
		echo ""
	fi
}

# get current status of git repo (for git PS1)
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

# show first letter of the branch name and the symbols for modification (for PS1)
function minimal_git_status() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | head -c 1`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "${BRANCH}${STAT}"
	else
		echo ""
	fi
}

# recursivley grep all files in this directory, case insensitive, show linenums
rgrep() {
    grep -iRn $1 ./
}

# function g() {
#     g++ $1 && ./a.out
# }

# docker rm any 'Exited' containers
docker-cleanup() {
    for id in $(docker ps -a | grep 'Exited' | awk '{print $1}') ; do
        docker rm $id
    done
}

# docker kill everything that's running (docker ps -q)
docker-kill-all() {
    for id in $(docker ps -q) ; do
        docker kill $id
    done
}

# docker rmi any images that match <none>
docker-image-cleanup() {
    for imgid in $(docker images | grep \<none\> | awk '{print $3}') ; do
        docker rmi $imgid
    done
}

# recursively find all the .git directories in the pwd and show their statuses
git-all-status(){
    current_dir="$(pwd)"
    for dir in $(find . -name '.git')
        do echo -e "\n$dir\n\n"
        cd $dir
        cd ..
        git status
        cd $current_dir
    done
}

# render a .dot file and immediately open it
graphv() {
    dot -Tsvg -O $1; open -a 'Google Chrome' $1.svg
}

# open the documentation web page for various things
docs() {
	local url
	case $1 in
		sb|spring|springboot)
			open https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/
			;;
		ss|spring-security)
			open https://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/
			;;
		bs|bs4|bootstrap)
			open http://getbootstrap.com/docs/4.0/components/alerts/
			;;
		bs3|bootstrap3)
			open https://getbootstrap.com/docs/3.3/
			;;
		thy|thyme|thymeleaf)
			open http://www.thymeleaf.org/documentation.html
			;;
		jq)
			open https://stedolan.github.io/jq/manual/
			;;
		emoji)
			open https://unicode.org/Public/emoji/11.0/emoji-data.txt
			;;
		*)
			cat <<-.
				sb | spring | springboot
				ss | spring-security
				bs | bs4 | bootstrap
				bs3 | bootstrap3
				thy | thyme | thymeleaf
				jq
				emoji
			.
			;;
	esac
}

# log an entry with a timestamp to ~/Dropbox/log.txt
lg() {
	if [[ $# -eq 0 ]] ; then
		cat <<-.
		lg -- log events to ~/Dropbox/log.txt
		.
		return 1
	fi
	echo -e "$(date +%Y-%m-%d\ %H:%M:%S)\t$@" >> ~/Dropbox/log.txt
}

# put my email signature (in markdown) on the clipboard
sig() {
	pbcopy <<-.
	\--
	Zach Gulde
	Curriculum Developer @ [Codeup](https://codeup.com)
	.
}

# show the help for custom functions
chelp() {
	perl -0777 -ne 'while(m/#\s*(.*?)\n([a-zA-Z-_]+)\(\)\s*{\n/g) { print "\033[35m$2\033[0m\t$1\n" }' ~/.bash_functions  | column -c$(tput cols) -ts$'\t' | sort
}

# print only the most recently modified file
ls-latest() {
	ls -1tr $1 | tail -n 1
}

# wait until a url successfully responds to a ping, then run a command
pingthen() {
	local url=$1
	shift
	ping -o $url && eval "$@"
}
