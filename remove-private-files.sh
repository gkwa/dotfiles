#/bin/sh

# git filter-branch \
#     --force \
#     --index-filter 'git rm --cached --ignore-unmatch notes.txt' \
#     --prune-empty --tag-name-filter cat -- --all

set -o errexit

bfgjar=/Users/demo/Downloads/bfg-1.11.6.jar

cd /tmp
rm -rf /tmp/demo.git
rm -rf /tmp/demo

if test -d /tmp/demo.git
then
    echo didn\'t remove /tmp/demo.git, quitting.
    exit 1
fi

if test -d /tmp/demo
then
    echo didn\'t remove /tmp/demo.git, quitting.
    exit 1
fi

git clone --mirror /Users/demo /tmp/demo.git
du -sh /tmp/demo.git
# java -jar $bfgjar --delete-files notes.txt /tmp/demo.git
java -jar $bfgjar --delete-files kee.kbd /tmp/demo.git
cd /tmp/demo.git
git reflog expire --expire=now --all
git gc --prune=now --aggressive
du -sh /tmp/demo.git
git clone /tmp/demo.git /tmp/demo
cd /tmp/demo
