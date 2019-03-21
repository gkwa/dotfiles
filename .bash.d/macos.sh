[[ -d /usr/local/share/info ]] && INFOPATH=/usr/local/share/info:$INFOPATH

[[ -d /Developer/usr/bin ]] && PATH=$PATH:/Developer/usr/bin
[[ -d /usr/local/sbin ]] && PATH=/usr/local/sbin:$PATH
[[ -d /usr/local/bin ]] && PATH=/usr/local/bin:$PATH
[[ -d /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
[[ -d /usr/libexec ]] && PATH=$PATH:/usr/libexec # for plistbuddy
