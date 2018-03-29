function hstat(){
	pushd ~/pdev/tmp/ssh_check_hosts
	cat tysonl*quilt*csv | sort -u |
		perl -ne'
sub inc { my $color=shift; my $var=shift; m{\b($color)\b}i && $$var++; };
BEGIN{ $a=0; $r=0; $y=0; $g=0; $ra=0; $ya=0; $ga=0; $rn=0; $yn=0; $gn=0; $ninq=0;}
if(m{\b(amolmah|juahaley|mjharkin|saryadav|thmpcha|yaxcheng)\b}ix) {
 ( inc("RED",\$r) && print || inc("YELLOW",\$y) || inc("GREEN",\$g) );
 !m{\b(True)\b}i && $ninq++; # not in quilt pipeline
 if(m{\b(addis|hercules)\b}i && $a++ ){ ( inc("RED",\$ra) || inc("YELLOW",\$ya) || inc("GREEN",\$ga) || 1 );}
 if(m{\b(neteng)\b}i && $n++ ){ ( inc("RED",\$rn) || inc("YELLOW",\$yn) || inc("GREEN",\$gn));}
}
END{
    print STDERR qq{red: $r, yellow: $y, green: $g overall\n};
    print STDERR qq{red: $ra, yellow: $ya, green: $ga hercules/addis\n};
    print STDERR qq{red: $rn, yellow: $yn, green: $gn neteng\n};
    print STDERR qq{missing quilt pipeline: $ninq\n};
}
'
	popd
}

function subs {
	perl -le '
		my $host = shift;
		$host =~ s/\.\w+\.ec2\.border\.?$//;
		my ($hostname, $az) = $host =~ m/^(.*)-(\w+\d+-\d+|z-\d+)$/;
		$hostname = $hostname . ".$az.";
		if($az   =~ /^z-/){
		    $hostname .= "aes0.internal"
		}else{
		    $hostname .= "ec2.substrate"
		}
		print $hostname;
    ' $1;
}

function border {
    perl -le 'my $host = shift;if ($host =~ /^(.+)\.(.+)\.aes0\.internal$/){print "$1-$2.iad.ec2.border";}elsif($host =~ /^(.+)\.(.+)\.ec2\.substrate$/){my $hostname   = $1;my $az = $2;my $region = $2; $region =~ s/[^a-z]//g;print "$hostname-$az.$region.ec2.border";}else{print "Not a substrate name";}' $1;
}

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
	(cd ~/pdev/mtm/emacs
	 if ! git diff --no-ext-diff --quiet --exit-code
	 then
		 git add --update
	 fi
	 git commit -m "Notes backup"
	 ls -1 notes.txt notes/* |
		 xargs -I% echo 'perl -w -i.bak ~/bin/org_clean_whitespace.pl % && rm %.bak' |
		 sh -
	 ls -1 notes.txt notes/* |
		 xargs -I% echo 'perl -wi ~/bin/replace_unicode_with_ascii.pl %' |
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

function osxbackup(){ 
	if ! mount | grep /Volumes/Backup >/dev/null; then
		echo Aborting.  /Volumes/Backup is not available
	else
		rsync \
			--delete-excluded \
			--delete \
			--exclude /Users/demo/Library/Caches/ \
			--exclude Library/Logs/ \
			--exclude Library/Containers/com.docker.docker/ \
			--exclude 'Library/Application Support/' \
			-vaz --progress \
			/Users /Volumes/Backup
	fi
}

function cookbook(){ 
	cookbook=$1
	chef generate cookbook --email taylormonacelli@gmail.com $cookbook
	rm -rf $cookbook/.delivery/build_cookbook $cookbook/.delivery/config.json
	echo 'remote_file = "https://raw.githubusercontent.com/chef-cookbooks/community_cookbook_tools/master/delivery/project.toml"' \
		 >$cookbook/.delivery/project.toml
}
