#!/usr/bin/env bash

! command -v fzf &>/dev/null && return

fzfopen() {
    "$@" | fzf --tac --bind 'enter:execute:nvim {} < /dev/tty'
}
