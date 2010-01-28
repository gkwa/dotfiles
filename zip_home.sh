#!/bin/bash
# Last modified $Id$
# $HeadURL$
# -*- sh -*-

set -e
set -x

rm -f home.zip
tmpdir=$(mktemp -d /tmp/XXXXXXXX)
targetdir=$tmpdir/home
mkdir -p $targetdir

rsync -vaz --progress . $targetdir --exclude=.git
pushd $tmpdir

zip -9r home.zip home
popd

cp $tmpdir/home.zip .
rm -rf $tmpdir