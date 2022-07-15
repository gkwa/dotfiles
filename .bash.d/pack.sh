#!/bin/bash

if ! command pack &>/dev/null; then
    exit
fi

. $(pack completion)
