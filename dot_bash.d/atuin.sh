command -v atuin 2>/dev/null || return

eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"

# https://docs.atuin.sh/configuration/key-binding/#bash
bind -x '"\C-]": "__atuin_history"'
