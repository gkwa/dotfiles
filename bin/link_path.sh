#!/bin/bash

# usage: $0 {path}

# http://serverfault.com/questions/40144/how-can-i-retrieve-the-absolute-filename-in-a-shell-script-on-mac-os-x

# # example:
# [demo@Taylors-MacBook-Pro:/tmp]$ ls -la /usr/local/bin/emacs
# lrwxr-xr-x  1 demo  admin  37 Sep 10 19:02 /usr/local/bin/emacs -> ../stow/emacs-24.2.50.0dcd9/bin/emacs
# [demo@Taylors-MacBook-Pro:/tmp]$ link_path.sh /usr/local/bin/emacs
# /usr/local/stow/emacs-24.2.50.0dcd9/bin/emacs-24.2.50
# [demo@Taylors-MacBook-Pro:/tmp]$ 

dirname=`perl -e 'use Cwd "abs_path";print abs_path(shift)' $1`
echo $dirname
