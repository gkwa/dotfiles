# bash completion for kubectl
# https://github.com/kubernetes/kubectl/issues/37#issuecomment-458857274

! type kubectl &>/dev/null && exit 0

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
alias kb=kubectl
source <(kubectl completion bash)
