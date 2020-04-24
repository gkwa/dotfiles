. ~/.bash.d/less.sh
. ~/.bash.d/ruby.sh
. ~/.bash.d/asciidoc.sh
. ~/.bash.d/bash.sh
. ~/.bash.d/cabal.sh
. ~/.bash.d/chef.sh
. ~/.bash.d/common.sh
. ~/.bash.d/docker.sh
. ~/.bash.d/emacs.sh
. ~/.bash.d/enscript.sh
. ~/.bash.d/fzf.sh
. ~/.bash.d/git.sh
. ~/.bash.d/golang.sh
. ~/.bash.d/google-cloud-sdk.sh
. ~/.bash.d/mutt.sh
. ~/.bash.d/ncurses.sh
. ~/.bash.d/nginx.sh
. ~/.bash.d/node.sh
. ~/.bash.d/selenium.sh
. ~/.bash.d/serverless.sh
. ~/.bash.d/sphinx-doc.sh
. ~/.bash.d/sqlite3.sh
. ~/.bash.d/travis.sh
. ~/.bash.d/vault.sh
. ~/.bash.d/gnu.sh
. ~/.bash.d/openssl.sh
. ~/.bash.d/rust.sh
. ~/.bash.d/.alias
. ~/.bash.d/.alias-terraform.sh
[[ $OSTYPE =~ ^cygwin ]] && . ~/.bash.d/cygwin.sh
[[ $OSTYPE =~ ^darwin ]] && . ~/.bash.d/bash-darwin.sh
. ~/.bash.d/python3.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
