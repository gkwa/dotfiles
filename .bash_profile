#!/bin/bash
# -*- sh-mode -*-

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

unset USERNAME

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [ -f /usr/local/share/bash-completion/bash_completion ] . /usr/local/share/bash-completion/bash_completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
