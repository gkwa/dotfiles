#!/usr/bin/env bash

! command -v direnv &>/dev/null && return

eval "$(direnv hook bash)"
show_virtual_env() {
    if [[ -n $VIRTUAL_ENV && -n $DIRENV_DIR ]]; then
        echo "($(basename $VIRTUAL_ENV))"
    fi
}

export -f show_virtual_env

PS1='$(show_virtual_env)'$PS1
