#!/usr/bin/env bash

! command -v acorn &>/dev/null && return

eval "$(acorn completion bash)"
