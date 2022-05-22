# https://github.com/junegunn/fzf

if [[ 1 == 0 ]]
then

    # Setup fzf
    # ---------
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
        export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
    fi

    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

    # Key bindings
    # ------------
    [ -s /usr/local/opt/fzf/shell/key-bindings.bash ] && source /usr/local/opt/fzf/shell/key-bindings.bash


fi