#!/bin/env bash

B2_ACCOUNT_ID="$(security find-generic-password -a ${USER} -s B2_ACCOUNT_ID -w)"
export B2_ACCOUNT_ID

B2_ACCOUNT_KEY="$(security find-generic-password -a ${USER} -s B2_ACCOUNT_KEY -w)"
export B2_ACCOUNT_KEY

macos_laptop_restic_pass="$(security find-generic-password -a ${USER} -s macos_laptop_restic_pass -w)"
export macos_laptop_restic_pass

export RESTIC_PASSWORD_FILE=/tmp/restic-pw.txt
touch $RESTIC_PASSWORD_FILE
chmod go-rwx $RESTIC_PASSWORD_FILE
echo "$macos_laptop_restic_pass" >$RESTIC_PASSWORD_FILE

export RESTIC_BACKUP_EXCLUDE_FROM_FILE_PATH=~/bin/restic-backup-excludes.txt
