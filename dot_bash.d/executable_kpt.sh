#!/usr/bin/env bash

! command -v kpt &>/dev/null && return

eval "$(kpt completion bash)"
