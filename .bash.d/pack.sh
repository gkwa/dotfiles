#!/bin/bash

if ! command pack 2>&1 >/dev/null; then
    exit
fi

. $(pack completion)
