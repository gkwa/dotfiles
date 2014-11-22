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

##############################
# http://nuclearsquid.com/writings/git-tricks-tips-workflows/
# Now, you’ll probably also want to have the Git Autocompletion when
# you’re using g as well. Add this to your .bashrc or .zshrc:

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
##############################

hs()
{
    if test ! -z "$1"; then
	# if first arg is number, then tail -number
	if test $(expr "$1" : "[0-9]*$") -gt 0; then
	    history | tail -$1 |
	    sed -e 's,^[[:blank:]]*[0-9]*[[:blank:]]*,,' |
	    grep -v "hs $1";
	else
	    history |
	    sed -e 's,^[[:blank:]]*[0-9]*[[:blank:]]*,,' |
	    grep -i "$1" | grep -v "hs $1";
	fi;
    else
	history | sed -e 's,^[[:blank:]]*[0-9]*[[:blank:]]*,,'
    fi;
}

echo_remote()
{
    project="$1"
    cat <<EOF
git remote add -f ${project}_local ~/pdev/$project
git remote add -f ${project}_remote dev:~/proj/$project.git
git remote rm ${project}_local
git checkout -b ${project}_branch ${project}_remote/master
git checkout -
git read-tree -u ${project}_branch --prefix=$project/
#
git remote rm ${project}_remote
git branch -D ${project}_branch
EOF

}

gitOrderBranchByDate()
{
    git status 2>&1 | grep "fatal" && return 1
    for k in `git branch -a|grep -v "no branch"|sed -e 's,^..,,;s,.* ->.*,,';`; do
	echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;
    done|sort -r
}

locatesuffix() { test ! -z "$1" && { locate "$1" | grep -E "$1\$"; } }

makerules()
{
    if test -f Makefile; then
	# http://stackoverflow.com/questions/3063507/list-goals-targets-in-gnu-make/3632592#3632592
	make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
    fi
}

case "$(uname)" in

    CYGWIN_NT*)

	export PATH="/c/cygwin/bin:$PATH"
	export PATH="/c/cygwin64/bin:$PATH"

	export PATH="/c/cygwin/usr/local/bin:$PATH"
	export PATH="/c/cygwin64/usr/local/bin:$PATH"

	export PATH=".:$PATH"
	# http://www.saltycrane.com/blog/2008/05/how-to-paste-in-cygwin-bash-using-ctrl/
	# Add the following line to your ~/.bashrc:

# this next stty line causes bash to report: stty: standard input:
# Inappropriate ioctl for device, so I'm disabling it.
#	stty lnext ^q stop undef start undef

	# And add the following line to your ~/.inputrc:
	# "\C-v": paste-from-clipboard
	# stty lnext ^q stop undef start undef
	pbcopy(){ putclip; }
	pbpaste(){ getclip; }
	;;

    Darwin)

	export PAGER=cat
	export COLUMNS=72 #man pages
	[ -f /usr/local/var/rbenv ] && export RBENV_ROOT=/usr/local/var/rbenv
	export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
	export INFOPATH=/usr/local/share/info:$INFOPATH
	export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

	#homebrew uses this if its defined, otherwise homebrew will
	#install its own which is fine, but I'm often more uptodate on
	#git than brew is.
	[ -f /usr/local/bin/git ] && export GIT=/usr/local/bin/git

	export EDITOR=$HOME/bin/e
	export PATH=~/play/gitster/contrib/git-jump:$PATH
	export PATH=/Applications/p4merge.app/Contents/MacOS:$PATH
	export PATH=/usr/local/bin:$PATH
	# for plistbuddy:
	export PATH=$PATH:/usr/libexec
	# for Apple /Developer/usr/bin/make since macports is broken now
	export PATH=$PATH:/Developer/usr/bin
	export PATH=$PATH:/usr/local/sbin
	# for emacsclient when emacs is in daemon mode
	export EMACS_SERVER_FILE=~/.emacs.d/server/emacs1000
	export PATH=/usr/local/bin:$PATH

	# https://groups.google.com/forum/?fromgroups=#!topic/asciidoc/FC-eOwU8rYg
	# brew install asciidoc; cd ~/play/gitster && make man "make
	# man" relies on knowing where XML_CATALOG_FILES are:
	export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

	#pandoc and haskell cabal defaults to ~/.cabal/bin
	export PATH=~/.cabal/bin:$PATH
	export MANPATH=~/.cabal/share/man:$MANPATH
	export PATH=.:$PATH

	# gitk complains "Application initialization failed: couldn't connect to
	# display ":0.0"" on osx, commented out
	#	export DISPLAY=:0.0

	#

	# # rbenv: http://robots.thoughtbot.com/using-rbenv-to-manage-rubies-and-gems
	# eval "$(rbenv init -)"

	encoder_decoder_cleanup()
	{
	    set +x

	    while [ $# -gt 0 ]; do
		case "$1" in
		    -d|--debug)
			# "-d" or "--debug" parameter?
			DEBUG=1
			set -x
			;;
		    -c|--clean)
			rm -f /tmp/ed.updatedb
			shift
			;;
		    -s|--search)
			SEARCH_ARGS="$2"
			shift
			;;

		esac
		shift # Check next set of parameters.
	    done

	    if test ! -f /tmp/ed.updatedb; then
		cat >/tmp/encoder_decoder_cleanup_step1.sh<<EOF
		cd /tmp
		updatedb --output=ed.updatedb --localpaths='\
/Production/!Latest \
/Production/Streambox/Beta/Encoder \
/Production/Streambox/Beta/Decoder'
		zip -9 ed.updatedb.zip ed.updatedb
		du -sh ed.updatedb.zip
EOF
		scp /tmp/encoder_decoder_cleanup_step1.sh rn:/tmp
		ssh rn sh /tmp/encoder_decoder_cleanup_step1.sh

		# now rn:/tmp/encoder_decoder_cleanup_step1.zip exists
		# lets retrieve it
		scp rn:/tmp/ed.updatedb.zip /tmp
		(cd /tmp && 7z x -y ed.updatedb.zip >/dev/null)
	    fi;

	    if test ! -z "$SEARCH_ARGS"; then
		glocate \
		    --database=/tmp/ed.updatedb \
		    -r \
		    "$SEARCH_ARGS" | \
		    sed -e 's,^/c,/Volumes,'
	    fi

	    # scp rn:/tmp/encoder_decoder_cleanup_step1.txt /tmp
	    # grep 8274a15 /tmp/encoder_decoder_cleanup_step1.txt \
	    #	| sed -e 's,^,rm -f ,' | tee /tmp/encoder_decoder_cleanup_step2.txt
	    #	    scp /tmp/encoder_decoder_cleanup_step2.txt rn:/tmp
	    #	    ssh rn sh -x /tmp/encoder_decoder_cleanup_step2.txt
	}

	function gitblock()
	{
	    url="$1"
	    project=$(echo $url | awk -F / '{print $(NF)}')
	    echo <<EOF "
$project \\

$project:
	-git clone $url \$@
	(cd \$@ && git pull)
.PHONY: $project
"
EOF
	}

	function locatern()
	{
	    glocate \
		--database=$HOME/Documents/locate.updatedb.readynas \
		"$@" | sed -e 's,^/c,/Volumes,'

	    remote=/Volumes/Development/locate.updatedb.readynas
	    local=$HOME/Documents/locate.updatedb.readynas

	    if [ -f $remote ]
	    then
		if [ $local -ot $remote ]
		then
		    echo updating $local
		    chmod u+rw $local
		    cp $remote $local &
		fi
	    fi
	}

	function repo_setup()
	{
	    project=$(basename `pwd`)

	    echo -n 'git init && '
	    echo -n "git remote add origin dev:~/proj/$project.git && "
	    echo ssh dev '"cd /var/www/html/proj; sh setupproj.sh '$project'"'
	    echo
	    echo git push --set-upstream origin master
	    echo
	    echo git clone --reference ~/pdev/nsis-streambox2 \
		--no-hardlinks \
		dev:~/proj/nsis-streambox2.git
	    echo
	    echo cp ~/pdev/nsis-baseline/{template.nsi,VERSION.mk,Makefile} .
	    echo '# git add . && git commit -am blah'
	    echo
	    echo '(cd ~/pdev/manifest && git commit -am "Adds project '$project'" && git push)'
	    echo '<project name="'$project'" path="'$project'" />'
	    echo ~/pdev/manifest/default.xml
	}
	function psearch()
	{
	    mdfind "$1" -onlyin ~/pdev
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

	function rdp()
	{
	    octet="$1"
	    if test ! -z "$octet"; then
		(cd ~/pdev/rdp-connect
		    python main.py $octet
		    sh ${octet}_main.sh)
	    fi
	}

	function r2()
	{
	    find ~/Documents/RDC\ Connections ~/pdev/rdp-connect | \
		grep -iE "$1" | \
		sed 's, ,\\ ,g' | \
		sed 's,^,open ,'

	}

	# installer functions
	imgmountpoint() {
	    # echo disktuil eject \
	    #	$(hdid -plist $1 | grep dev-entry -A1 | \
	    #	grep string | cut -d\> -f2 | cut -d\< -f1 | \
	    #	sed -e 's,/dev/,,')

	    hdid -plist $1 | grep mount-point -A1 | \
		grep string | cut -d\> -f2 | cut -d\< -f1;
	}
	myumount2() {
	    diskutil eject "$(imgmountpoint $1)";

	}
	nasumount(){
	    mount | grep 10.0.2.10 | awk '{print $1}' | xargs -n1 umount
	}
	myinstall() {
	    #			set -x;
	    hdid $1;
	    pushd "$(imgmountpoint $1)";
	    sudo installer -pkg "$(ls -1 | grep -i pkg | head -1)" -target /;
	    popd;
	    echo sleeping for 4 secs to allow stuff to catchup
	    sleep 4;
	    myumount2 "$1";
	}

	check_git_dirty()
	{
	    dir=$1
	    if test -z "$1"
	    then
		dir=.
	    else
		dir=$1
	    fi

	    if test ! -d "$dir"
	    then
		echo "$dir doesn't exist"
		exit
	    fi

	    d=$(pwd)
	    cd "$dir" && \
		git update-index -q --refresh
	    if test ! -z "$(git diff-index --name-only HEAD --)"
	    then
		#		echo dirty
		git status
	    else
		cd "$d"
	    fi
	}

	mfs()
	{
	    mdfind -onlyin ~/pdev "$1"
	}

	gg_replace() {
	    if [[ "$#" == "0" ]]; then
		echo 'Usage:'
		echo '  gg_replace term replacement file_mask'
		echo
		echo 'Example:'
		echo '  gg_replace cappuchino cappuccino *.html'
		echo
	    else
		find=$1; shift
		replace=$1; shift

		ORIG_GLOBIGNORE=$GLOBIGNORE
		GLOBIGNORE=*.*

		if [[ "$#" = "0" ]]; then
		    set -- ' ' $@
		fi

		while [[ "$#" -gt "0" ]]; do
		    for file in `git grep -l $find -- $1`; do
			sed -i '' "s/$find/$replace/g" $file
		    done
		    shift
		done

		GLOBIGNORE=$ORIG_GLOBIGNORE
	    fi
	}
	gg_dasherize() {
	    gg_replace $1 `echo $1 | sed -e 's/_/-/g'` $2
	}

        [ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
	;;

    "Linux|FreeBSD")

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

drop()
{
    if test ! -z "$1"; then
	find ~/Dropbox/Public | \
	    grep -iE "$1" | \
	    sed -e \
	    's,.*/Public,http://dl.dropbox.com/u/9140609,;s, ,%20,g'
    else

	find ~/Dropbox/Public | \
	    sed -e \
	    's,.*/Public,http://dl.dropbox.com/u/9140609,;s, ,%20,g'| \
	    xargs ls -t
    fi;
}

code_enscript()
{
    infile="$1"
    outfilePS="$infile.ps"
    outfilePDF="$infile.pdf"
    enscript --columns=2 --fancy-header --pretty-print --landscape -q -B -C -Esh -G --color --word-wrap -f Courier6 -MA4 -T4 --header='$n %W Page $% of $=' -p - "$infile" >"$outfilePS"
    pstopdf "$outfilePS" -o "$outfilePDF"
}

##############################
# Git bash completion
##############################
# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWSTASHSTATE=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_SHOWUPSTREAM="auto"
# # source ~/.git-completion.bash # this might cause bash to be really slow
# source ~/play/git/contrib/completion/git-completion.bash
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

f1()
{
    pushd /Users/demo/Documents/git_clone_svn_ls >/dev/null 2>&1
    g dc --name-only bc9c183.. | sed 's,^,\(cd /Users/demo/Documents/git_clone_svn_ls \&\& git dc bc9c183.. ,;s,$,\),'
    popd  >/dev/null 2>&1
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# ------------------------------

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/
# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

# ------------------------------
# Docker shortcuts
# ------------------------------
function denter()
{
    printf 'PID=$(sudo docker inspect --format "{{ .State.Pid }}" %s)\n' $(sudo docker ps -q)
    printf 'sudo nsenter --target $PID --mount --uts --ipc --net --pid\n'
}

function drmi()
{
    imageid=$1
    if test -z "$imageid"
    then
	echo usage drmi {image id}
    else
	sudo docker ps -a | grep $imageid | \
	    perl -ane 'print qq/sudo docker rm $F[0]# \Q@F\E\n/';
	echo sudo docker rmi $imageid
    fi
}

# Live deploy
function livedep()
{
    # A POSIX variable
    OPTIND=1         # Reset in case getopts has been used previously in the shell.

    # Initialize our own variables:
    dryrun=0
    verbose=0

    while getopts "h?vnf:" opt; do
	case "$opt" in
	    h|\?)
		# show_help
		exit 0
		;;
	    n)  dryrun=1
		;;
	    v)  verbose=1
		;;
	esac
    done

    shift $((OPTIND-1))

    [ "$1" = "--" ] && shift

    [ $verbose -eq 1 ] && echo "verbose=$verbose, dryrun=$dryrun, Leftovers: $@"

    # End of file

    set -o errexit #I don't want to push the wrong branch

    GIT='git'
    if test 'Darwin' != $(uname)
    then
	# Ubuntu
	cd /home/ubuntu/repos-mirror/git_clone_svn_ls
    else
	# OSX
	# GIT=/opt/boxen/homebrew/Cellar/git/2.1.3/bin/git
	cd ~/Documents/git_clone_svn_ls
    fi

    head=$(git symbolic-ref --short HEAD)
    if test 'LS_Stable_v3.0' != "$head"
    then
	git checkout 'LS_Stable_v3.0'
    fi

    head=$(git symbolic-ref --short HEAD)
    if test 'LS_Stable_v3.0' != "$head"
    then
	echo "I couldn't checkout LS_Stable_v3.0, quitting prematurely..."
	exit 1
    fi

    git_svn_arg="--quiet"
    [ $verbose -eq 1 ] && git_svn_arg=""
    $GIT svn $git_svn_arg fetch
    $GIT svn $git_svn_arg rebase

    cd /Users/demo/pdev/livemaint

    head=$(git symbolic-ref --short HEAD)
    [ 'master' != "$head" ] && {
	echo "I couldn't checkout 'master', quitting prematurely..."
	exit 1
    }

    if test $dryrun -ne 1
    then

	make clean
	./gens --production
	./gens --createPHPDeploymentScript
	sh create_deployment_script_autogen.sh
	sh deploy_autogen_all.sh
    fi
}

function restart(){
    for server in "$@"
    do
	cygrunsrv -E "$server"
	cygrunsrv -S "$server"
    done
}
