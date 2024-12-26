function notec() {
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
}

[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH
[[ -d $HOME/bin/streambox ]] && export PATH=$HOME/bin/streambox:$PATH
