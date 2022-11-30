if [[ $OSTYPE =~ ^darwin ]]; then
    book() {
        mdfind -onlyin ~/Documents/books -name "$*"
    }
    . ~/bin/keychain
fi

