#!/bin/sh
# -*- mode: sh -*-

script=$(basename $0)
in=$(mktemp /tmp/${script}_in_XXXXXX.txt)
pbpaste >$in

out=$(mktemp /tmp/${script}_out_XXXXXX.txt)
out2=$(mktemp /tmp/${script}_out_XXXXXX.txt)
cat $in | perl -ne'
while(<>)
{
    my($host, $status) = ($_ =~ m{^(.*?.com)\s+\[(Active|Activating|Terminating|FinalProvisioning|Staydown|Standby|Shutdown|Processing)\]}i );
    if($host){
        print(qq{$host $status\n})
    }
}
' >$out

if test $(stat -c '%s' $out) -eq 0
then
	cat $in | perl -ne'
if(m{Name.*Essential}...m{Fleetwide})
{
    if(m{:?\.(:?border|com)|border|active|standby|processing|provisioning|staydown|FinalProvisioning|Shutdown}i)
    {
        chomp if m{\.(border|com)}i;
        print;
    }
}
' >$out
	cat $out | perl -ne'
my($host,$status,$infra)=($_=~m{^(\S+)\s*\[(.*?)\]\s*(\w+)?});
print qq/$host\t$status\n/;
' >$out2
fi

out3=$(mktemp /tmp/${script}_out_XXXXXX.txt)
if test $(stat -c '%s' $out2) -gt 0
then
	cat $out2 >$out3
else
	cat $out >$out3
fi

if test $(stat -c '%s' $out3) -gt 0
then
	{
		cat $out3 | awk '{print $1}'
		echo
		cat $out3 | column -t
	} | pbcopy
	pbpaste
fi
