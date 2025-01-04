#!/usr/bin/env bash

if [[ $OSTYPE == 'darwin'* ]]; then
    if [ -d "$HOME/Library/Application Support/edgedb" ]; then
        export PATH="$HOME/Library/Application Support/edgedb/bin:$PATH"
    fi
fi
