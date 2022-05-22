alias k=kubectl
complete -F __start_kubectl k

if type kubectl >/dev/null
then
    source <(kubectl completion bash)
fi
