#!/bin/bash
# Last modified $Id$
# $HeadURL$
# -*- sh -*-

set -e
set -x

tmpdir=$(mktemp -d /tmp/XXXXXXXX)
targetdir=$tmpdir/home

cd
git ls-files | cpio -pamd $targetdir

pushd $tmpdir

zip -9r home.zip home/*
popd

cp $tmpdir/home.zip ~
rm -rf $tmpdir