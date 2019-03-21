# http://mah.everybody.org/docs/ssh#gen-keys
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval $($SSHAGENT $SSHAGENTARGS)
	trap "kill $SSH_AGENT_PID" 0
fi

SSH_ENV=$HOME/.ssh/environment

function start_agent() {
	echo "Initialising new SSH agent..."
	mkdir -p $(dirname ${SSH_ENV})
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >${SSH_ENV}
	echo succeeded
	chmod 600 ${SSH_ENV}
	. ${SSH_ENV} >/dev/null
	/usr/bin/ssh-add
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
	. ${SSH_ENV} >/dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ >/dev/null || {
		start_agent
	}
else
	start_agent
fi
