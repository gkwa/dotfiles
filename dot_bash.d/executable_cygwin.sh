if [[ $OSTYPE =~ ^cygwin ]]; then

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

fi
