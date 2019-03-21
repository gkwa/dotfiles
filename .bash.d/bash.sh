export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTTIMEFORMAT=""
export HISTSIZE=5000
export ALTERNATE_EDITOR=""

# for man pages
export COLUMNS=72

hs() {
	if test -z "$1"; then
		history | awk '{$1="";print substr($0,2)}'
	else
		# if first arg is number, then tail -number
		if test $(expr "$1" : "[0-9]*$") -gt 0; then
			history | tail -$1 |
				awk '{$1="";print substr($0,2)}' | grep -v "hs $1"
		else
			history | awk '{$1="";print substr($0,2)}' | grep -i "$1" |
				grep -v "hs $1"
		fi
	fi
}

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Makes directory then moves into it
mkcdr() {
	mkdir -p -v $1
	cd $1
}
