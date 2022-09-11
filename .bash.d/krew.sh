# https://krew.sigs.k8s.io/docs/user-guide/setup/install/

if command -v kubectl krew &>/dev/null; then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
    source <(kubectl krew completion bash)
fi
