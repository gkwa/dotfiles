#!/usr/bin/env bash

! command -v flashbiter &>/dev/null && return

function flashbiterwrapper() {
    local path
    path=$(flashbiter "$*")
    local clean
    clean=$(echo "$path" | tr -d '\n')
    if [ -z "$clean" ]; then
        return
    fi
    if [ -d "$clean" ]; then
        cd "$clean" || return
        git log --pretty=tformat:'%Creset%h%C(yellow)%d%Creset %ar %s' --reverse
    fi
    echo "$clean"
}
