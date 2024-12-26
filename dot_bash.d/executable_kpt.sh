#!/bin/bash

if command -v kpt compltion &>/dev/null; then
    source <(kpt completion bash)
fi
