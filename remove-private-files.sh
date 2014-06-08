#/bin/sh

git filter-branch \
    --force \
    --index-filter 'git rm --cached --ignore-unmatch notes.txt' \
    --prune-empty --tag-name-filter cat -- --all
