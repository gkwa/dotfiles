#!/bin/bash

if command direnv 2>&1 >/dev/null; then
    eval "$(direnv hook bash)"
fi

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

export -f show_virtual_env

PS1='$(show_virtual_env)'$PS1
