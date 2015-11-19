# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
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

alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'
alias c='clear'
alias h='cd ~/'
alias grep='grep --color=auto'

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

#confirmation when manipulating files
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

#open finder in current directory
alias f='open -a Finder ./' 

#git stuff
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias push='git push origin master'

#vagrant commands
alias vs='vagrant status'
alias vh='vagrant halt'
alias vu='vagrant up'
alias vssh='vagrant ssh'

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


alias enterthematrix='cmatrix'

# cowsay with a random cow
function randcowsay {
  NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
  WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
  THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

   #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
   cowsay -f $THISCOW $1
}

cmatrix -C blue -s

echo "-------------------------------------------------------------"
php ~/php/welcome.php
echo "-------------------------------------------------------------"

fortune -a | randcowsay | lolcat

export PS1="======================================================================\n\[\e[32m\]\t\[\e[m\] \[\e[34m\]\w/\[\e[m\] \`parse_git_branch\`\n > "
