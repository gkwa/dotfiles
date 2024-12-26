#!/bin/bash

alias shfmt1='shfmt -w -s -i 4'

cupsh() {
    path="$*"
    for file in $path; do
        shfmt -i 4 -w $file
        chmod +x $file
    done
}

export -f cupsh
