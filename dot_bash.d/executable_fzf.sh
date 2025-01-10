#!/usr/bin/env bash

! command -v fzf &>/dev/null && return

# Only bind key if shell is interactive
if [[ $- == *i* ]]; then
    fzfopen() {
        "$@" | fzf --tac --bind 'enter:execute:nvim {} </dev/tty'
    }
fi
