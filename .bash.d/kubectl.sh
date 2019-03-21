# bash completion for kubectl
# https://github.com/kubernetes/kubectl/issues/37#issuecomment-458857274

alias kb=kubectl

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)


