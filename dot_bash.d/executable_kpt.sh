#!/usr/bin/env bash

! command -v kpt compltion &>/dev/null && return

eval "$(kpt completion bash)"
