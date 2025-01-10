#!/usr/bin/env bash

[[ ! -f "$HOME/.atuin/bin/env" ]] && return

# shellcheck source=/dev/null
. "$HOME/.atuin/bin/env"

! command -v atuin &>/dev/null && return

# shellcheck source=/dev/null
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"

# Only bind key if shell is interactive
if [[ $- == *i* ]]; then
    bind -x '"\C-]": "__atuin_history"'
fi

eval "$(atuin gen-completions --shell=bash)"
