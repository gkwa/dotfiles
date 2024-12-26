fzfopen() {
    "$@" | fzf --tac --bind 'enter:execute:nvim {} < /dev/tty'
}
