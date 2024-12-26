#!/bin/bash

if command -v acorn &>/dev/null; then
    source <(acorn completion bash)
fi
