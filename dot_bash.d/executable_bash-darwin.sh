if [[ $OSTYPE =~ ^darwin ]]; then
    book() {
        mdfind -onlyin ~/Documents/books -name "$*"
    }

    # https://apple.stackexchange.com/a/371998
    export BASH_SILENCE_DEPRECATION_WARNING=1

    . ~/bin/keychain
fi
