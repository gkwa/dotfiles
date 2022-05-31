# https://eksctl.io/introduction/#bash

if ! type eksctl >/dev/null; then
    exit 0
fi

source <(eksctl completion bash)
