#!/usr/bin/env bash

#pandoc and haskell cabal defaults to ~/.cabal/bin
[[ -d ~/.cabal/bin ]] && export PATH=~/.cabal/bin:$PATH
[[ -d ~/.cabal/share/man ]] && export MANPATH=~/.cabal/share/man:$MANPATH
