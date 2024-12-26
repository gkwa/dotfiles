# for man pages
export COLUMNS=72

hs() {
    if test -z "$1"; then
        history | awk '{$1="";print substr($0,2)}'
    else
        # if first arg is number, then tail -number
        if test $(expr "$1" : "[0-9]*$") -gt 0; then
            history | tail -$1 | awk '{$1="";print substr($0,2)}' |
                grep -v "hs $1"
        else
            history | awk '{$1="";print substr($0,2)}' | grep -i "$1" |
                grep -v "hs $1"
        fi
    fi
}

unset ALTERNATE_EDITOR

export HISTSIZE=10000
export HISTCONTROL=ignoredups:erasedups
unset HISTTIMEFORMAT

# check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[[ -d /usr/local/share/info ]] && INFOPATH=/usr/local/share/info:$INFOPATH
[[ -d /Developer/usr/bin ]] && PATH=$PATH:/Developer/usr/bin
[[ -d /usr/local/sbin ]] && PATH=/usr/local/sbin:$PATH
[[ -d /usr/local/bin ]] && PATH=/usr/local/bin:$PATH
[[ -d /usr/libexec ]] && PATH=$PATH:/usr/libexec # for plistbuddy

if [[ $OSTYPE == 'darwin'* ]]; then
    [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
fi

if [[ $OSTYPE =~ ^darwin ]]; then
    book() {
        mdfind -onlyin ~/Documents/books -name "$*"
    }

    # https://apple.stackexchange.com/a/371998
    export BASH_SILENCE_DEPRECATION_WARNING=1

    . ~/bin/keychain
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
