if [[ $OSTYPE =~ ^darwin ]]; then
    book() {
        mdfind -onlyin ~/Documents/books -name "$*"
    }
fi

export BASH_SILENCE_DEPRECATION_WARNING=1 # https://apple.stackexchange.com/a/371998
