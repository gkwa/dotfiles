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
