#!/usr/bin/env bash

! command -v atuin &>/dev/null && return

[[ -f $HOME/.atuin/bin/env ]] && . "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"

# https://docs.atuin.sh/configuration/key-binding/#bash
bind -x '"\C-]": "__atuin_history"'
