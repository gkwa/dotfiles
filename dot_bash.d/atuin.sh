command -v atuin >/dev/null 2>&1 || return

eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"

# https://docs.atuin.sh/configuration/key-binding/#bash
bind -x '"\C-]": "__atuin_history"'
