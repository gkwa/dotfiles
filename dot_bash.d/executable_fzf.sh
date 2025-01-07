#!/usr/bin/env bash

! command -v fzf &>/dev/null && return

eval "$(fzf --bash)"

fzfopen() {
    "$@" | fzf --tac --bind 'enter:execute:nvim {} < /dev/tty'
}
