#!/usr/bin/env bash

! command -v flux &>/dev/null && return

eval "$(flux completion bash)"
