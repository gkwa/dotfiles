#!/bin/bash
# -*- sh-mode -*-

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

unset USERNAME


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mtm/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
