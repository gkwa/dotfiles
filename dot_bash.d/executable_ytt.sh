#!/usr/bin/env bash

[ -f /usr/local/etc/bash_completion.d/ytt ] && source /usr/local/etc/bash_completion.d/ytt

cupyml() {
    all="$*"
    for path in $all; do
        file=$(basename "$path")
        #        echo ytt -f "$path" --file-mark "${file}:type=yaml-plain" \| sponge "$path"
        ytt -f "$path" --file-mark "${file}:type=yaml-plain" | sponge "$path"
    done
}

export -f cupyml
