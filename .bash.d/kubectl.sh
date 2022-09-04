alias k=kubectl
complete -o default -F __start_kubectl k

if command -v kubectl &>/dev/null; then
    source <(
        kubectl completion bash 2> >(grep -v 'no configuration has been provided')
    )
fi
