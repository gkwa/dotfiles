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

		export PATH="/c/Program Files/Rust stable GNU 1.13:$PATH"
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

		export GOPATH=$HOME/go
		export GOROOT=/usr/local/opt/go/libexec
		export PATH=$PATH:$GOPATH/bin
		export PATH=$PATH:$GOROOT/bin
		        		        
		[ -f /usr/local/var/rbenv ] && export RBENV_ROOT=/usr/local/var/rbenv
		export INFOPATH=/usr/local/share/info:$INFOPATH

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

		# https://groups.google.com/forum/?fromgroups=#!topic/asciidoc/FC-eOwU8rYg
		# brew install asciidoc; cd ~/play/gitster && make man "make
		# man" relies on knowing where XML_CATALOG_FILES are:
		export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

		#pandoc and haskell cabal defaults to ~/.cabal/bin
		export PATH=~/.cabal/bin:$PATH
		export MANPATH=~/.cabal/share/man:$MANPATH

		[ -d ~/Downloads/mongodb-osx-x86_64-enterprise-4.0.1 ] &&
		export PATH=~/Downloads/mongodb-osx-x86_64-enterprise-4.0.1/bin:$PATH

		if command -v brew >/dev/null 2>&1; then
			export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
		fi

		# gitk complains "Application initialization failed: couldn't connect to
		# display ":0.0"" on osx, commented out
		#	export DISPLAY=:0.0

		#

		# # rbenv: http://robots.thoughtbot.com/using-rbenv-to-manage-rubies-and-gems
		# eval "$(rbenv init -)"

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

		if command -v brew >/dev/null 2>&1; then
			if [ -f $(brew --prefix)/etc/bash_completion ]; then
				. $(brew --prefix)/etc/bash_completion
			fi
		fi

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
    python -c 'import socket; servers=["LiveHK","LiveDB","LiveJP","LiveSG","LiveAU","LiveUS","LiveUSEast","LiveSA","LiveEU","LiveDE","LiveIN","tl1","tcm2","tcm2t","te1"]; print "\n".join(["%s %s" % (server, socket.gethostbyname(server)) for server in servers])' #
}

[ -f .bashrc-extra.sh ] && source .bashrc-extra.sh


# PERL_MB_OPT="--install_base \"/Users/demo/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/demo/perl5"; export PERL_MM_OPT;


export COLUMNS=72 #man pages

export PATH=/usr/local/bin:$PATH
export PATH=.:$PATH

# added by travis gem
[ -f /Users/demo/.travis/travis.sh ] && source /Users/demo/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTFILESIZE=5000
export HISTSIZE=5000

# https://goo.gl/UuCBHy
# I'm a big fan of Ctrl+r, but sometimes eschew it for the limited
# duplicate ups afforded by export HISTCONTROL=erasedups
export HISTCONTROL=erasedups

complete -C /usr/local/bin/vault vault

##############################
# Google cloud SDK
##############################
file=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
[ -f $file ] && source $file
file=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
[ -f $file ] && source $file

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh
