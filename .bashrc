# base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file


# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #


# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }


source ~/.alias

hs()
{
    if test ! -z "$1"; then
	# if first arg is number, then tail -number
	if test $(expr "$1" : "[0-9]*$") -gt 0; then
	    history | tail -$1 | \
		sed -e 's,^[[:blank:]]*[0-9]*[[:blank:]]*,,' | \
		grep -v "hs $1";
	else
	    history | \
		sed -e 's,^[[:blank:]]*[0-9]*[[:blank:]]*,,' | \
		grep -i "$1" | grep -v "hs $1";
	fi;
    else
	history | sed -e 's,^[[:blank:]]*[0-9]*[[:blank:]]*,,'
    fi;
}

gitOrderBranchByDate()
{
    git status 2>&1 | grep "fatal" && return 1
    for k in `git branch -a|grep -v "no branch"|sed -e 's,^..,,;s,.* ->.*,,';`; do
	echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;
    done|sort -r
}

locatesuffix() { test ! -z "$1" && { locate "$1" | grep -E "$1\$"; } }

installerv()
{
    if test 0 -eq $(git status --porcelain | grep -cE "^(A|M) "); then
	echo export installerv=$(git rev-list HEAD -1 --abbrev-commit)
    else
	echo export installerv=test-dont-use
    fi
}



case "$(uname)" in
    "CYGWIN")
	export PATH="/cygdrive/c/cygwin/bin:$PATH"
	;;
    "Darwin")
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home

	export PATH=/Applications/MacPorts/Emacs.app/Contents/MacOS/bin:$PATH # for emacsclient
	export PATH=/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH
	export PATH=/Applications/p4merge.app/Contents/MacOS:$PATH
	export PATH=/usr/local/bin:$PATH
	export PATH=/opt/local/sbin:$PATH
	export PATH=/opt/local/bin:$PATH
	export PATH=$PATH:/Developer/usr/bin
	# for plistbuddy:
	export PATH=$PATH:/usr/libexec
# gitk complains "Application initialization failed: couldn't connect to
# display ":0.0"" on osx, commented out
#	export DISPLAY=:0.0

	#

	function locate()
	{
	    /opt/local/libexec/gnubin/locate \
		--database=$HOME/Documents/locate.updatedb.readynas \
		"$@" | sed -e 's,^/c,/Volumes,'

	    remote=/Volumes/Development/locate.updatedb.readynas
	    local=$HOME/Documents/locate.updatedb.readynas

	    if [ -f $remote ]
	    then
		if [ $local -ot $remote ]
		then
		    echo updating $local
		    cp $remote $local &
		fi
	    fi
	}

	function gn()
	{
	    grep -i "$1" ~/notes.txt
	}

	function bitgrepupdate()
	{
	    cd ~/pdev/production-find-ls && git pull
	    test -f /Volumes/Production/Streambox/find-ls.txt && \
		cp /Volumes/Production/Streambox/find-ls.txt \
		~/pdev/production-find-ls && \
		dos2unix find-ls.txt && \
		cd ~/pdev/production-find-ls && git commit -am bitgrepupdate && \
		git push && git show
	}

	function rdp() { find ~/Documents/RDC\ Connections -iname "*rdp*" | grep -i "$1" | sed -e 's,^,open ",;s,$,",'; }

	# installer functions
	imgmountpoint() {
	    # echo disktuil eject \
	    # 	$(hdid -plist $1 | grep dev-entry -A1 | \
	    # 	grep string | cut -d\> -f2 | cut -d\< -f1 | \
	    # 	sed -e 's,/dev/,,')

	    hdid -plist $1 | grep mount-point -A1 | \
		grep string | cut -d\> -f2 | cut -d\< -f1;
	}
	myumount2() {
	    diskutil eject "$(imgmountpoint $1)";

	}
	myinstall() {
#	    set -x;
	    hdid $1;
	    pushd "$(imgmountpoint $1)";
	    sudo installer -pkg "$(ls -1 | grep -i pkg | head -1)" -target /;
	    popd;
	    echo sleeping for 4 secs to allow stuff to catchup
	    sleep 4;
	    myumount2 "$1";
	}

	# http://www.saltycrane.com/blog/2008/05/how-to-paste-in-cygwin-bash-using-ctrl/
	# Add the following line to your ~/.bashrc:
	stty lnext ^q stop undef start undef
	# And add the following line to your ~/.inputrc:
	# "\C-v": paste-from-clipboard
	# stty lnext ^q stop undef start undef

	;;
    "Linux")
	ip=$(/sbin/ip addr show dev eth0 | grep "inet " | cut -d\/ -f1 | awk '{print $2}')
	if test ! -z "$ip"; then
	    PS1="[\d \t \u@${ip}:\w ]$ "
	fi
	;;
esac

export PATH=$HOME/bin:$PATH

function parse_git_branch
{
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}


function bitgrep()
{
    searchPattern="$1"
    sed -e 's,.*/Production/Streambox/,/Volumes/Production/Streambox/,' \
	~/pdev/production-find-ls/find-ls.txt | grep -iE "$searchPattern"

}



genpasswd()
{
    # from here: http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html
    local l=$1
    [ "$l" == "" ] && l=20
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}






pack(){ find . -iname "*.packproj"; }
packo() { pack | sed -e 's,^,open ,'; }
dmg(){ find . -iname "*.dmg"; }

# http://www.delorie.com/gnu/docs/emacs/emacs_444.html
PS1="\u@\h \W$ "
PS1="[\d \t \u@\h:\w ]$ "
PS1="[\u@\h:\w\$(parse_git_branch)]$ "



# http://www.saltycrane.com/blog/2008/05/how-to-paste-in-cygwin-bash-using-ctrl/
# Add the following line to your ~/.bashrc:
# stty lnext ^q stop undef start undef
# And add the following line to your ~/.inputrc:
# "\C-v": paste-from-clipboard
# stty lnext ^q stop undef start undef



export ALTERNATE_EDITOR=””




function drop()
{
    if test ! -z "$1"; then
	find ~/Dropbox/Public | \
	    grep -iE "$1" | \
	    sed -e \
	    's,.*/Public,http://dl.dropbox.com/u/9140609,;s, ,%20,g'
    else
	find ~/Dropbox/Public | \
	    sed -e \
	    's,.*/Public,http://dl.dropbox.com/u/9140609,;s, ,%20,g'
    fi;
}
