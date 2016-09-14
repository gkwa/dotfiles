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


# liveip
function lip()
{
    python -c 'import socket; servers=["LiveChicago.streambox.com","LiveHK.streambox.com","LiveDB.streambox.com","LiveJP.streambox.com","LiveSG.streambox.com","LiveAU.streambox.com","LiveUS.streambox.com","LiveUSEast.streambox.com","LiveSA.streambox.com","LiveEU.streambox.com","LiveDE.streambox.com","LiveIN.streambox.com","LiveNI.streambox.com","tl1.streambox.com","te1.streambox.com","tl2.streambox.com","tl3.streambox.com","tl4.streambox.com"]; print "\n".join(["%s %s" % (server, socket.gethostbyname(server)) for server in servers])' #
}
