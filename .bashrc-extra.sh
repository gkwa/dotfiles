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

function connect_to_local_encoder()
{
	IFS='
' find_local_encoder |
		while read mstsc_cmd
		do
			echo $mstsc_cmd | sh -x -
		done
}

function find_local_encoder()
{
	filter="T:80-81,443,1770-1771,3389,22,U:1770-1771,2051,2060,5926"
	log=/tmp/nmap_filter.log
	(
		cd /tmp #just in case we dont rm useful stuff
		[ -f $log ] &&
			find ${log-/tmp} -mmin +$((25*60)) -exec rm {} \;
	)
	[ ! -f $log ] &&
		nmap --open -oG - -sU -sT -p $filter 10.0.2.0/23 | tee $log
	grep -E "3389" $log | awk '{print $2}' | grep -F 10.0.2 |
		xargs -r -I% -n1 echo mstsc -v:% | sort -ut. -k4n
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
