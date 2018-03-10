# vim: set ft=sh:

function emoji {
	if [[ -z $1 ]] ; then
		cut -f1 < ~/misc/emoji-list.txt
	fi
}

# stolen from https://github.com/alexch/dotfiles/blob/master/functions.sh
function whats-on-port {
  lsof -i TCP:$1
}

function note {
    echo "[$(date +%Y-%m-%d\ %H:%M:%S)] $@" >> ~/codeup/notes.md
}

function phpman {
    open "http://php.net/manual-lookup.php?pattern=$1&scope=quickref"
}

# google (duckduckgo) something
function g {
    ruby -r cgi -e '`open http://duckduckgo.com/?q=#{CGI.escape(ARGV.join(" "))}`' "$@"
}

function vl {
    if [[ $# -eq 0 ]]; then
        cd ~/vagrant-lamp
    else
        ( cd ~/vagrant-lamp && vagrant $* )
    fi
}

function warpspeed() {
    if [[ $# -eq 0 ]]; then
        cd ~/Sites
    else
        ( cd ~/warpspeed-vagrant && vagrant $* )
    fi
}

function homestead() {
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

function mcd {
    mkdir -p "$@"
    cd "$@"
}

# cowsay with a random cow
function randcowsay {
    NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
    WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
    THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

    cowsay -f $THISCOW $1
}

# sends an email from my mailgun domain
#   $ sendEmail <to> <subject> <body> [from='Don't Reply']
function sendEmail {

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
# get current branch in git repo
function parse_git_branch() {
	local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${branch}" == "" ] ; then
		local status=`parse_git_dirty`
		echo "<${branch}>${status}"
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

# just show first letter of the branch name and the symbols for modification
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

function rgrep() {
    grep -iRn $1 ./
}
alias grepr='rgrep'

# function g() {
#     g++ $1 && ./a.out
# }

function docker-cleanup() {
    for id in $(docker ps -a | grep 'Exited' | awk '{print $1}') ; do
        docker rm $id
    done
}

function docker-kill-all() {
    for id in $(docker ps -q) ; do
        docker kill $id
    done
}

function docker-image-cleanup() {
    for imgid in $(docker images | grep \<none\> | awk '{print $3}') ; do
        docker rmi $imgid
    done
}

push-all(){
    for remote in $(git remote -v | awk '{print $1}' | uniq) ; do
        git push $remote "$@"
    done
}

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

# render a .dot file and open it
graphv() {
    dot -Tpng -O $1; open $1.png
}

vagrant-run() {
	vagrant up
	read -p "$(pwd): Vagrant box running..."
	vagrant halt
}

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
		*)
			cat <<-.
				sb | spring | springboot
				ss | spring-security
				bs | bs4 | bootstrap
				bs3 | bootstrap3
				thy | thyme | thymeleaf
				jq
			.
			;;
	esac
}

lg() {
	if [[ $# -eq 0 ]] ; then
		cat <<-.
		lg -- log events to ~/Dropbox/log.txt
		.
		return 1
	fi
	echo -e "$(date +%Y-%m-%d\ %H:%M:%S)\t$@" >> ~/Dropbox/log.txt
}
