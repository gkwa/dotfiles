# https://krew.sigs.k8s.io/docs/user-guide/setup/install/

if [ -d $HOME/.krew/bin ]; then
    export PATH=$HOME/.krew/bin:$PATH
fi

if command -v kubectl krew &>/dev/null; then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
    source <(kubectl krew completion bash)
fi
