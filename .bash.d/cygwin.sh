# http://www.saltycrane.com/blog/2008/05/how-to-paste-in-cygwin-bash-using-ctrl/
# Add the following line to your ~/.bashrc:

# this next stty line causes bash to report: stty: standard input:
# Inappropriate ioctl for device, so I'm disabling it.
#	stty lnext ^q stop undef start undef

# And add the following line to your ~/.inputrc:
# "\C-v": paste-from-clipboard
# stty lnext ^q stop undef start undef

# http://www.saltycrane.com/blog/2008/05/how-to-paste-in-cygwin-bash-using-ctrl/
# Add the following line to your ~/.bashrc:
# stty lnext ^q stop undef start undef
# And add the following line to your ~/.inputrc:
# "\C-v": paste-from-clipboard
# stty lnext ^q stop undef start undef

# http://www.mail-archive.com/bug-bash@gnu.org/msg01691.html
# stty lnext ^Q stop undef
# stty lnext undef

pbcopy() { putclip; }
pbpaste() { getclip; }

function restart() {
	for server in "$@"; do
		cygrunsrv -E "$server"
		cygrunsrv -S "$server"
	done
}

export PATH="/usr/sbin:$PATH"
export PATH="/c/cygwin/bin:$PATH"
export PATH="/c/cygwin64/bin:$PATH"
export PATH="/c/cygwin/usr/local/bin:$PATH"
export PATH="/c/cygwin64/usr/local/bin:$PATH"
export PATH=".:$PATH"
