#!/bin/bash
# Last modified $Id$
# $HeadURL$
# -*- sh-mode -*-

. ~/.alias
export EDITOR='emacsclient --server=emacs1000'

# .bash_profile

# http://www.mail-archive.com/bug-bash@gnu.org/msg01691.html
# stty lnext ^Q stop undef
# stty lnext undef

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

unset USERNAME

# http://mah.everybody.org/docs/ssh#gen-keys
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

SSH_ENV=$HOME/.ssh/environment

function start_agent {
	echo "Initialising new SSH agent..."
	mkdir -p $(dirname ${SSH_ENV})
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
	echo succeeded
	chmod 600 ${SSH_ENV}
	. ${SSH_ENV} > /dev/null
	/usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
	. ${SSH_ENV} > /dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi

# To use bash_completion, add the following lines at the end of your .bash_profile:
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
    # required?
    # . /opt/local/etc/bash_completion.d/git-completion
fi

# http://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html
case $(uname) in
    "FreeBSD"|"Linux")
	unset MANPATH
	;;
    "Dwarwin")
	export \
	    MANPATH=$MANPATH:/usr/share
	;;
esac

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
