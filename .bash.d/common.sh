function notec() {
    (
        cd ~/pdev/taylormonacelli/notes
        if ! git diff --no-ext-diff --quiet --exit-code; then
            git add --update
        fi
        git commit -m "Notes backup"
        perl -wi ~/bin/org_clean_whitespace.pl *.txt *.org
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
[[ -d $HOME/bin/streambox ]] && export PATH=$HOME/bin/streambox:$PATH
