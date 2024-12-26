#!/bin/env bash

set -e

source ~/bin/restic-backup-variables.sh

export RESTIC_REPOSITORY="b2:macos-laptop"

time restic init
