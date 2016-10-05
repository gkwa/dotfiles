source ~/.alias

##############################
# http://nuclearsquid.com/writings/git-tricks-tips-workflows/
# Now, you'll probably also want to have the Git Autocompletion when
# you're using g as well. Add this to your .bashrc or .zshrc:

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

	export PATH="/usr/sbin:$PATH"
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

	[ -f /usr/local/var/rbenv ] && export RBENV_ROOT=/usr/local/var/rbenv
	export INFOPATH=/usr/local/share/info:$INFOPATH
	export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

	#homebrew uses this if its defined, otherwise homebrew will
	#install its own which is fine, but I'm often more uptodate on
	#git than brew is.
	[ -f /usr/local/bin/git ] && export GIT=/usr/local/bin/git

	export EDITOR=$HOME/bin/e
	export PATH=~/play/gitster/contrib/git-jump:$PATH
	export PATH=/Applications/p4merge.app/Contents/MacOS:$PATH
	# for plistbuddy:
	export PATH=$PATH:/usr/libexec
	# for Apple /Developer/usr/bin/make since macports is broken now
	export PATH=$PATH:/Developer/usr/bin
	export PATH=$PATH:/usr/local/sbin
	# for emacsclient when emacs is in daemon mode
	export EMACS_SERVER_FILE=~/.emacs.d/server/emacs1000

	# https://groups.google.com/forum/?fromgroups=#!topic/asciidoc/FC-eOwU8rYg
	# brew install asciidoc; cd ~/play/gitster && make man "make
	# man" relies on knowing where XML_CATALOG_FILES are:
	export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

	#pandoc and haskell cabal defaults to ~/.cabal/bin
	export PATH=~/.cabal/bin:$PATH
	export MANPATH=~/.cabal/share/man:$MANPATH

	# gitk complains "Application initialization failed: couldn't connect to
	# display ":0.0"" on osx, commented out
	#	export DISPLAY=:0.0

	#

	# # rbenv: http://robots.thoughtbot.com/using-rbenv-to-manage-rubies-and-gems
	# eval "$(rbenv init -)"

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

    Linux|FreeBSD)

	;;

esac

export HISTTIMEFORMAT=""
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
PS1="[\u@\h:\W\$(parse_git_branch)]$ "

# http://www.saltycrane.com/blog/2008/05/how-to-paste-in-cygwin-bash-using-ctrl/
# Add the following line to your ~/.bashrc:
# stty lnext ^q stop undef start undef
# And add the following line to your ~/.inputrc:
# "\C-v": paste-from-clipboard
# stty lnext ^q stop undef start undef

export ALTERNATE_EDITOR=""

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# ------------------------------

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/
# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

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

function restart()
{
    for server in "$@"
    do
	cygrunsrv -E "$server"
	cygrunsrv -S "$server"
    done
}

# liveip
function lip()
{
    python -c 'import socket; servers=["LiveChicago","LiveHK","LiveDB","LiveJP","LiveSG","LiveAU","LiveUS","LiveUSEast","LiveSA","LiveEU","LiveDE","LiveIN","LiveNI","tl1","te1","tl2","tl3","tl4"]; print "\n".join(["%s %s" % (server, socket.gethostbyname(server)) for server in servers])' #
}

[ -f .bashrc-extra.sh ] && source .bashrc-extra.sh


# PERL_MB_OPT="--install_base \"/Users/demo/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/demo/perl5"; export PERL_MM_OPT;


export PAGER=cat
export COLUMNS=72 #man pages

export PATH=/usr/local/bin:$PATH
export PATH=.:$PATH
