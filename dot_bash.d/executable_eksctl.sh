#!/usr/bin/env bash

# https://eksctl.io/introduction/#bash

! command -v eksctl &>/dev/null && return

eval "$(eksctl completion bash)"
