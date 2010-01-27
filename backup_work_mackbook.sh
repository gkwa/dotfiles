#!/bin/bash
# Last modified $Id$
# $HeadURL$
# -*- sh-mode -*-

#     --dry-run \

rsync -vaz \
    --ignore-errors \
    --exclude-from backup_work_mackbook.exclude \
    --delete-excluded \
    --delete \
    --progress \
    -e 'ssh -l boxstream' \
    / 10.0.2.201:/home/boxstream/macbook_bkp2
