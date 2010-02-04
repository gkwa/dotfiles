#!/bin/bash
# Last modified $Id$
# $HeadURL$
# -*- sh-mode -*-

. ~/.alias
PATH=/usr/local/bin:/opt/local/bin:$PATH

export EDITOR=emacsclient
export GIT_PAGER=

# .bash_profile

# http://www.delorie.com/gnu/docs/emacs/emacs_444.html
PS1="\u@\h \W$ "
PS1="[\d \t \u@\h:\w ]$ "

case "$(uname)" in 
    "Darwin")
	;;
    "Linux")
	ip=$(ip addr show dev eth0 | grep "inet " | cut -d\/ -f1 | awk '{print $2}')
	if test ! -z "$ip"; then
	    PS1="[\d \t \u@${ip}:\w ]$ "
	fi
	;;
esac





# http://www.mail-archive.com/bug-bash@gnu.org/msg01691.html
# stty lnext ^Q stop undef
# stty lnext undef

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
unset USERNAME

# http://mah.everybody.org/docs/ssh#gen-keys
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi


