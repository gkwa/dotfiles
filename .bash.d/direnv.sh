#!/bin/bash

if command direnv 2>&1 >/dev/null; then
    eval "$(direnv hook bash)"
fi
