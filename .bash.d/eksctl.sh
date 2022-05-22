# https://eksctl.io/introduction/#bash

if type eksctl >/dev/null
then
    source <(eksctl completion bash)
fi
