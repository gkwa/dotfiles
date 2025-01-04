#!/usr/bin/env bash

! command -v deno &>/dev/null && return

# shellcheck source=/dev/null
[ -f /usr/local/etc/bash_completion.d/deno ] && source /usr/local/etc/bash_completion.d/deno
