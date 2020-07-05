#!/bin/bash

cupsh() {
    path="$*"
    for file in $path; do
        shfmt -i 4 -w $file
        chmod +x $file
    done
}

export -f cupsh
