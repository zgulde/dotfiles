# goes to ~/vagrant-lamp/sites if no arguments are passed, otherwise
# goes to $1.dev
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

# get the HTTP status code from a site eg getStatus google.com
function getStatus {
	curl -vs $1 2>&1 | grep '< HTTP/1.1'  | sed -e 's/< HTTP\/1\.1\ //g'
}

function mkdircd {
    mkdir $1; cd $1;
}

# use curl to just get the reponse headers instead of a full response
function curlh {
    curl -s -D - $1 -o /dev/null | sed 's/.*/< &/'
}

# cowsay with a random cow
function randcowsay {
    NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
    WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
    THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

    cowsay -f $THISCOW $1
}

# echos enough '=' to fill one line 
function echolinebreak {
	numcolumns=$(tput cols)
	linebreak=""
	for (( c=0; c<numcolumns; c++ ))
	do
	   linebreak="=$linebreak"
	done
		echo $linebreak
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

# converts a string to escaped ascii codes
function toAsciiCodes {
    echo $1 | hexdump | sed -e 's/.\{7\}//' -e 's/ /\\x/g' | tr -d '\n' | sed -e 's/\(\\x\)*$//g' -e 's/\\x0a$//' | tr -d '\n'
}

function emoji {
    grep -i $1 ~/.emojis | sed 's/\(.*\)=\(.*\)#\(.*\)/\3 \1 \2/'
}

# do a git diff but just show which files are different
function gdf {
    gd $1 | grep ^diff | sed s/diff\ --git\ a/-\>\ \ /g
}

# parse_git_branch and parse_git_dirty copied from http://ezprompt.net/
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
