#!/usr/bin/env bash

alias ects='emacsclient --create-frame --tty --alternate-editor=""'

export EDITOR='emacsclient --create-frame --tty --alternate-editor=""'
[ -f "$HOME/bin/e" ] && EDITOR=$HOME/bin/e
