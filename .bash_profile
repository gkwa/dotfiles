#!/bin/bash
# -*- sh-mode -*-

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

unset USERNAME


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
