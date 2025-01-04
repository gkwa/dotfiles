#!/usr/bin/env bash

! command -v aqualove &>/dev/null && return

function aqualovewrapper() {
    local path=$(aqualove)
    local clean=$(echo "$path" | tr -d '\n')
    if [ -z "$clean" ]; then
        return
    fi
    if [ -d "$clean" ]; then
        cd "$clean"
    fi
}
