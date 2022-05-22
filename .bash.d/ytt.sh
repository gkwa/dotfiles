#!/bin/bash

cupyml() {
    all="$*"
    for path in $all; do
        file=$(basename "$path")
        #        echo ytt -f "$path" --file-mark "${file}:type=yaml-plain" \| sponge "$path"
        ytt -f "$path" --file-mark "${file}:type=yaml-plain" | sponge "$path"
    done
}

export -f cupyml
