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

	net start mysql

    fi
}
