#!/usr/bin/env bash

! command -v git &>/dev/null && return

function parse_git_branch() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo "("")${ref#refs/heads/}"")"
}

PS1="[\u@\h:\W\$(parse_git_branch)]$ "

export GIT_PAGER=cat
