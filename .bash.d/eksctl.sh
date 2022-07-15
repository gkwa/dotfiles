# https://eksctl.io/introduction/#bash

if command -v eksctl &>/dev/null; then
    source <(eksctl completion bash)
fi
