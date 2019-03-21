[[ -d /usr/local/opt/go/libexec ]] && GOROOT=/usr/local/opt/go/libexec
[[ -d $HOME/go ]] && GOPATH=$HOME/go

PATH=$PATH:$GOPATH/bin
PATH=$PATH:$GOROOT/bin
