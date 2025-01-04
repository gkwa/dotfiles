#!/usr/bin/env bash

! command -v just &>/dev/null && return

eval "$(just --completions bash 2>/dev/null)"
