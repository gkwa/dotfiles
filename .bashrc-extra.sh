squidcheck()
{
	case "$(uname)" in
		CYGWIN_NT*)
			~/pdev/TaylorMonacelli/squid_proxy/tmux-test-squid-cygwin.sh
			;;
		Darwin)
			~/pdev/TaylorMonacelli/squid_proxy/tmux-test-squid-osx.sh
			;;
	esac
}

# notes cleanup
function notec()
{
	(cd ~/pdev/emacs
	 if ! git diff --no-ext-diff --quiet --exit-code
	 then
		 git add --update
	 fi
	 git commit -m "Notes backup"
	 ls -1 notes.txt notes/* |
		 xargs -I% echo 'perl -w -i.bak ~/bin/org_clean_whitespace.pl % && rm %.bak' |
		 sh -
	if ! git diff --no-ext-diff --quiet --exit-code
	then
		git add --update
	fi
	git commit -m "Cleanup whitespace"
	)
}

# apache restart
function apr()
{
    d=$(date +%Y-%m-%d-%s)

    if test ! -z "$(env | grep WINDIR)"
    then
		# Windows

		net stop apache2.4
		p=/c/Apache/logs/error
		[ -f $p.log ] && mv $p.log $p-$d.log

		p=/c/Apache/logs/access
		[ -f $p.log ] && mv $p.log $p-$d.log

		net start apache2.4

    fi
}

# mysql restart
function myr()
{
    d=$(date +%Y-%m-%d-%s)

    if test ! -z "$(env | grep WINDIR)"
    then
		# Windows

		net stop mysql
		p=/d/MySQLData/mysql
		[ -f $p.err ] && mv $p.err $p-$d.err

		p=/d/MySQLData/mysql
		[ -f $p.log ] && mv $p.log $p-$d.log

		p=/d/MySQLData/mysql-slow
		[ -f $p.log ] && mv $p.log $p-$d.log

		net start mysql

    fi
}


function dst()
{
    rsync /d/pdev/ds/web/ /c/Apache/htdocs/DS
}

function dsb()
{
    rsync /c/Apache/htdocs/DS/ /d/pdev/ds/web
    cd /d/pdev/ds/web
}
