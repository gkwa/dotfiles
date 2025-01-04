#!/usr/bin/env bash

[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
# shellcheck source=/dev/null
[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
