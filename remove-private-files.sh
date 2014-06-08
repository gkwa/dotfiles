#/bin/sh

# git filter-branch \
#     --force \
#     --index-filter 'git rm --cached --ignore-unmatch notes.txt' \
#     --prune-empty --tag-name-filter cat -- --all

set -o errexit

bfgjar=/Users/demo/Downloads/bfg-1.11.6.jar

rm -rf /tmp/dotfiles.git
rm -rf /tmp/dotfiles

if test -d /tmp/dotfiles.git
then
    echo didn\'t remove /tmp/dotfiles.git, quitting.
    exit 1
fi

if test -d /tmp/dotfiles
then
    echo didn\'t remove /tmp/dotfiles.git, quitting.
    exit 1
fi

git clone --mirror --reference /Users/demo dev:~/proj/emacs.git /tmp/dotfiles.git
du -sh /tmp/dotfiles.git
java -jar $bfgjar --delete-files '{notes.txt,kee.kbd,.alias,unzip.exe}' --delete-folders '{emacs,notes}' /tmp/dotfiles.git
cd /tmp/dotfiles.git
git reflog expire --expire=now --all
git gc --prune=now --aggressive
du -sh /tmp/dotfiles.git
git clone /tmp/dotfiles.git /tmp/dotfiles
du -sh /tmp/dotfiles


cd /tmp/dotfiles
git log --name-status >/tmp/dotfiles.history
