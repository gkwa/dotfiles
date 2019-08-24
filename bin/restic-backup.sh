#!/bin/env bash

set -e

tmp=$(mktemp -d /tmp/restic.XXXXX)

export B2_ACCOUNT_ID="$(security find-generic-password -a ${USER} -s B2_ACCOUNT_ID -w)"
export B2_ACCOUNT_KEY="$(security find-generic-password -a ${USER} -s B2_ACCOUNT_KEY -w)"
export macos_laptop_restic_pass="$(security find-generic-password -a ${USER} -s macos_laptop_restic_pass -w)"
export RESTIC_REPOSITORY="b2:macos-laptop"
export RESTIC_PASSWORD_FILE="$tmp/restic-pw.txt"
touch $RESTIC_PASSWORD_FILE
chmod go-rwx $RESTIC_PASSWORD_FILE
echo "$macos_laptop_restic_pass" >$RESTIC_PASSWORD_FILE

cat <<'__eot__' >$tmp/excludes.txt
$HOME/.511976.padl
$HOME/.CFUserTextEncoding
$HOME/.IdentityService
$HOME/.ServiceHub
$HOME/.android
$HOME/.ansible
$HOME/.aspnet
$HOME/.atom
$HOME/.aws
$HOME/.babel.7.5.5.development.json
$HOME/.babel.json
$HOME/.bash.d
$HOME/.bash_history
$HOME/.bash_profile
$HOME/.bash_sessions
$HOME/.bashrc
$HOME/.buffalo
$HOME/.cache
$HOME/.cargo
$HOME/.cdk
$HOME/.config
$HOME/.cookiecutter_replay
$HOME/.cookiecutterrc
$HOME/.cookiecutters
$HOME/.dbeaver-drivers
$HOME/.dbeaver4
$HOME/.dlv
$HOME/.docker
$HOME/.dotnet
$HOME/.dropbox
$HOME/.duti
$HOME/.eclipse
$HOME/.editorconfig
$HOME/.emacs.d
$HOME/.emacs_backups
$HOME/.emacs_bash
$HOME/.gem
$HOME/.gist
$HOME/.git
$HOME/.gitconfig
$HOME/.gitflow_export
$HOME/.gitignore_global
$HOME/.gitkraken
$HOME/.glide
$HOME/.gnupg
$HOME/.hammerspoon
$HOME/.helm
$HOME/.hgignore_global
$HOME/.httpie
$HOME/.inputrc
$HOME/.into-ledger
$HOME/.ipython
$HOME/.irssi
$HOME/.jupyter
$HOME/.kube
$HOME/.lesshst
$HOME/.local
$HOME/.logout
$HOME/.m2
$HOME/.matplotlib
$HOME/.minikube
$HOME/.minttyrc
$HOME/.mono
$HOME/.mpoprc
$HOME/.mysql_history
$HOME/.node-gyp
$HOME/.node_repl_history
$HOME/.npm
$HOME/.npmrc
$HOME/.npmrcs
$HOME/.nuget
$HOME/.nvm
$HOME/.omnisharp
$HOME/.oracle_jre_usage
$HOME/.p2
$HOME/.packer.d
$HOME/.pgAdmin4.startup.log
$HOME/.pgadmin
$HOME/.psql_history
$HOME/.pylint.d
$HOME/.python_history
$HOME/.refresh
$HOME/.repo_.gitconfig.json
$HOME/.repoconfig
$HOME/.rnd
$HOME/.rspec
$HOME/.screenrc
$HOME/.sleep
$HOME/.sqlite_history
$HOME/.ssh
$HOME/.stCommitMsg
$HOME/.subversion
$HOME/.templateengine
$HOME/.terraform.d
$HOME/.thumbnails
$HOME/.tooling
$HOME/.v8flags.7.5.288.22-node.16.09321b8d5a296ad4613d6618091ed098.json
$HOME/.vagrant.d
$HOME/.vim
$HOME/.viminfo
$HOME/.virtualenvs
$HOME/.vs-kubernetes
$HOME/.vscode-react-native
$HOME/.vuerc
$HOME/.wget-hsts
$HOME/.yarnrc
$HOME/.yo-rc-global.json
$HOME/.z
$HOME/.zoomus
$HOME/Library/Caches
$HOME/.dropbox
$HOME/.cargo
$HOME/.dbeaver-drivers
.DS_Store
Downloads/pluralsight
.Trash
__eot__

time restic backup /Users --exclude-file=$tmp/excludes.txt
