alias k=kubectl
complete -o default -F __start_kubectl k

if [ -f ~/.kube/config ] && [ "$(wc -c <~/.kube/config)" -ge 1000 ] && command -v kubectl &>/dev/null; then
    source <(kubectl completion bash)
fi
