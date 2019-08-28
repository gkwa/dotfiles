#!/bin/env bash

set -e

source ~/bin/restic-backup-variables.sh

export RESTIC_REPOSITORY=/Volumes/backup/restic

time restic backup /Users --exclude-file=$RESTIC_BACKUP_EXCLUDE_FROM_FILE_PATH
