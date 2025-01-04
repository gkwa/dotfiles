#!/usr/bin/env bash

! command -v pyenv &>/dev/null && return

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
