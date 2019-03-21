function notec() {
	(
		cd ~/pdev/mtm/emacs
		if ! git diff --no-ext-diff --quiet --exit-code; then
			git add --update
		fi
		git commit -m "Notes backup"
		ls -1 notes.txt notes/* |
			xargs -I% echo 'perl -w -i.bak ~/bin/org_clean_whitespace.pl % && rm %.bak' |
			sh -
		ls -1 notes.txt notes/* |
			xargs -I% echo 'perl -wi ~/bin/replace_unicode_with_ascii.pl %' |
			sh -
		if ! git diff --no-ext-diff --quiet --exit-code; then
			git add --update
		fi
		git commit -m "Cleanup whitespace"
	)
}

genpasswd() {
	# from here: http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html
	local l=$1
	[ "$l" == "" ] && l=20
	tr -dc A-Za-z0-9_ </dev/urandom | head -c ${l} | xargs
}

[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH
