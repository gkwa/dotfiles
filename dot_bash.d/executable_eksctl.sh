#!/usr/bin/env bash

# https://eksctl.io/introduction/#bash

! command -v eksctl &>/dev/null && return

source <(eksctl completion bash)
