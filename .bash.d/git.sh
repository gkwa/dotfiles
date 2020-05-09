gg_dasherize() {
    gg_replace $1 $(echo $1 | sed -e 's/_/-/g') $2
}

check_git_dirty() {
    dir=$1
    if test -z "$1"; then
        dir=.
    else
        dir=$1
    fi

    if test ! -d "$dir"; then
        echo "$dir doesn't exist"
        exit
    fi

    d=$(pwd)
    cd "$dir" &&
        git update-index -q --refresh
    if test ! -z "$(git diff-index --name-only HEAD --)"; then
        #		echo dirty
        git status
    else
        cd "$d"
    fi
}

gg_replace() {
    if [[ $# == "0" ]]; then
        echo 'Usage:'
        echo '  gg_replace term replacement file_mask'
        echo
        echo 'Example:'
        echo '  gg_replace cappuchino cappuccino *.html'
        echo
    else
        find=$1
        shift
        replace=$1
        shift

        ORIG_GLOBIGNORE=$GLOBIGNORE
        GLOBIGNORE=*.*

        if [[ $# == "0" ]]; then
            set -- ' ' $@
        fi

        while [[ $# -gt "0" ]]; do
            for file in $(git grep -l $find -- $1); do
                sed -i '' "s/$find/$replace/g" $file
            done
            shift
        done

        GLOBIGNORE=$ORIG_GLOBIGNORE
    fi
}

gg_dasherize() {
    gg_replace $1 $(echo $1 | sed -e 's/_/-/g') $2
}

function parse_git_branch() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo "("${ref#refs/heads/}")"
}

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/
# Now, you'll probably also want to have the Git Autocompletion when
# you're using g as well. Add this to your .bashrc or .zshrc:
# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

[[ -x ~/play/gitster/contrib/git-jump ]] && PATH=$PATH:~/play/gitster/contrib/git-jump

PS1="[\u@\h:\W\$(parse_git_branch)]$ "
export GIT_PAGER='less -RSi'
