#!/bin/bash

if ! command kind 2>&1 >/dev/null; then
    exit
fi

source <(kind completion bash)
