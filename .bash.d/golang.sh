[[ -d /usr/local/opt/go/libexec ]] && GOROOT=/usr/local/opt/go/libexec
[[ -d $HOME/go ]] && GOPATH=$HOME/go
[[ -d $HOME/go/bin ]] && GOPATH=$HOME/go/bin

PATH=$PATH:$GOPATH/bin
PATH=$PATH:$GOROOT/bin
