#!/usr/bin/env bash

! command -v helm &>/dev/null && return

eval "$(helm completion bash)"
