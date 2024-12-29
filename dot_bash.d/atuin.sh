command -v atuin 2>/dev/null || return

eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"
bind -x '"\C-]": "__atuin_history"'
