#/bin/sh

# git filter-branch \
#     --force \
#     --index-filter 'git rm --cached --ignore-unmatch notes.txt' \
#     --prune-empty --tag-name-filter cat -- --all

set -o errexit

bfgjar=/Users/demo/Downloads/bfg-1.11.6.jar

rm -rf /tmp/emacs.git
rm -rf /tmp/emacs

if test -d /tmp/emacs.git
then
    echo didn\'t remove /tmp/emacs.git, quitting.
    exit 1
fi

if test -d /tmp/emacs
then
    echo didn\'t remove /tmp/emacs.git, quitting.
    exit 1
fi

git clone --reference /Users/demo --mirror dev:~/proj/emacs.git /tmp/emacs.git
du -sh /tmp/emacs.git
java -jar $bfgjar --delete-files '{notes.txt,kee.kbd,zip_home.sh,unzip.exe}' --delete-folders '{notes,emacs}' /tmp/emacs.git
cd /tmp/emacs.git
git reflog expire --expire=now --all
git gc --prune=now --aggressive
du -sh /tmp/emacs.git
git clone /tmp/emacs.git /tmp/emacs
du -sh /tmp/emacs
