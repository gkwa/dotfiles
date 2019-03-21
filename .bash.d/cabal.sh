#pandoc and haskell cabal defaults to ~/.cabal/bin
[[ -d ~/.cabal/bin ]] && PATH=~/.cabal/bin:$PATH
[[ -d ~/.cabal/share/man ]] && MANPATH=~/.cabal/share/man:$MANPATH
