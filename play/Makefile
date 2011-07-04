MAKEFLAGS=-j 10


update: \
	cpython \
	python \
	virtualbox \
	sphinx-info \
	pyutils \
	monodevelop \
	JSONKit \
	polypkg \
	clicktoflash \
	hudson \
	rails \
	jquery \
	gparted \
	android_tools \
	wikitest \
	git-mediawiki \
	timecard \
	bugzilla \
	bztools \
	mono \
	git \
	git-gui \
	gitk \
	pybugz \
	syslinux \
	dvc \
	gerrit2 \
	emacs \
	gsl-shell \
	ns-3-dev \
	amarok \
	cmake \
	monomac \
	rst2texinfo \
	mod_auth_openid

mono: 
	test -d $@ || git clone git://github.com/mono/mono.git
	cd $@ && git pull
.PHONY: mono

rst2texinfo: 
	test -d $@ || hg clone https://bitbucket.org/jonwaltman/rst2texinfo
	cd $@ && hg update
.PHONY: rst2texinfo

cpython:
	test -d $@ || hg clone http://hg.python.org/cpython
	cd $@ && hg update
.PHONY: cpython

python:
	test -d $@ || git clone http://hg.python.org/python $@/trunk
	cd $@/trunk && git pull
.PHONY: python

# https://bitbucket.org/jonwaltman/sphinx-info
sphinx-info:
	test -d $@ || hg clone https://bitbucket.org/jonwaltman/sphinx-info
	cd $@ && hg update
.PHONY: sphinx-info

pyutils:
	test -d $@ || git clone git://github.com/kashifpk/pyutils.git
	cd $@ && git pull
.PHONY: pyutils

monomac:
	test -d $@ || git clone git://github.com/mono/monomac.git
	cd $@ && git pull
.PHONY: monomac

monodevelop:
	test -d $@ || git clone git://github.com/mono/monodevelop.git
	cd $@ && git pull
.PHONY: monodevelop

JSONKit:
	test -d $@ || git clone git://github.com/fpillet/JSONKit.git
	cd $@ && git pull
.PHONY: JSONKit

polypkg:
	test -d $@ || git clone git://github.com/tedjp/polypkg.git
	cd $@ && git pull
.PHONY: polypkg

clicktoflash:
	test -d $@ || git clone git://github.com/rentzsch/clicktoflash.git
	cd $@ && git pull
.PHONY: clicktoflash

hudson:
	test -d $@ || git clone git://github.com/hudson/hudson.git
	cd $@ && git pull
.PHONY: hudson

rails:
	test -d $@ || git clone https://github.com/rails/rails.git
	cd $@ && git pull
.PHONY: rails

# http://code.google.com/p/chromium/wiki/UsingGit
jquery:
	test -d $@ || git clone git://github.com/jquery/jquery.git
	cd $@ && git pull
.PHONY: jquery

android_tools:
	if test ! -d $@; then mkdir $@ && cd $@ && repo init -u git://android.git.kernel.org/tools/manifest.git < /dev/null; else true; fi ;
	(cd $@ && repo sync)
.PHONY: android_tools

# http://git.661346.n2.nabble.com/Git-Mediawiki-Question-about-Jeff-King-s-import-script-td6407396.html
# or here git://github.com/Bibzball/Git-Mediawiki.git
# http://thread.gmane.org/gmane.comp.version-control.git/175525
# http://thread.gmane.org/gmane.comp.version-control.git/175525
# https://git.wiki.kernel.org/index.php/InterfacesFrontendsAndTools
git-mediawiki:
	test -d $@ || git clone git://github.com/singpolyma/git-mediawiki.git
	cd $@ && git pull
.PHONY: git-mediawiki

gparted:
	test -d $@ || git clone git://git.gnome.org/gparted
	cd $@ && git pull
.PHONY: gparted

wikitest:
	test -d $@ || git clone git://github.com/peff/wikitest.git
	cd $@ && git pull
.PHONY: wikitest

timecard:
	test -d $@ || git clone git://github.com/peff/timecard.git
	cd $@ && git pull
.PHONY: timecard

mod_auth_openid:
	test -d $@ || git clone git://github.com/bmuller/mod_auth_openid.git
	cd $@ && git pull
.PHONY: mod_auth_openid

# http://techbase.kde.org/Getting_Started/Sources/KDE_git-tutorial
amarok:
	test -d $@ || git clone git://anongit.kde.org/amarok $@
	cd $@ && git pull
.PHONY: amarok

cmake:
	test -d $@ || git clone http://wildcodes.com/git/CMake
	cd $@ && git pull
.PHONY: cmake

virtualbox:
	test -d $@ || svn co http://www.virtualbox.org/svn/vbox/trunk
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: virtualbox

dvc:
	test -d $@ || bzr co -v http://bzr.xsteve.at/dvc
	cd $@ && bzr update
.PHONY: dvc

bugzilla:
	test -d $@ || bzr co -v bzr://bzr.mozilla.org/bugzilla/trunk $@
	cd $@ && bzr up
.PHONY: bugzilla

bztools:
	test -d $@ || git clone git://github.com/LegNeato/bztools.git
	cd $@ && git pull
.PHONY: bztools

git: 
	test -d $@ || git clone git://git.kernel.org/pub/scm/git/git.git
	cd $@ && git pull
.PHONY: git

git-gui: 
	test -d $@ || git clone git://repo.or.cz/git-gui.git
	cd $@ && git pull
.PHONY: git-gui

gitk: 
	test -d $@ || git clone git://git.kernel.org/pub/scm/gitk/gitk.git
	cd $@ && git pull
.PHONY: gitk

pybugz:
	test -d $@ || git clone git://github.com/williamh/pybugz.git
	cd $@ && git pull
.PHONY: pybugz

syslinux:
	test -d $@ || git clone git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git
	cd $@ && git pull
.PHONY: syslinux

emacs:
	test -d $@ || git clone git://git.savannah.gnu.org/emacs.git
	cd $@ && git pull
.PHONY: emacs

# http://code.google.com/p/gerrit/wiki/Source?tm=4
gerrit2:
	if [ ! -d $@ ]; then mkdir gerrit2; cd gerrit2; repo init -u git://android.git.kernel.org/tools/manifest.git; else true; fi ;
	(cd $@ && repo sync)
.PHONY: gerrit2

gsl-shell:
	test -d $@ || git clone git://git.savannah.nongnu.org/gsl-shell.git
	cd $@ && git pull
.PHONY: gsl-shell

# http://code.google.com/p/waf/
# http://waf.googlecode.com/svn/docs/wafbook/single.html
waf:
	test -d $@ || svn checkout http://waf.googlecode.com/svn/trunk/ $@
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: waf

# The ns-3 Network Simulator http://nsnam.blogspot.com
ns-3-dev: 
	test -d $@ || hg clone http://code.nsnam.org/ns-3-dev
	cd $@ && hg update
.PHONY: ns-3-dev

freebsd:
	test -d $@ || svn checkout svn+ssh://svn.freebsd.org/base/head $@
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: freebsd


# ##################################################
# chromium
# ##################################################

# http://code.google.com/p/chromium/wiki/UsingGit#Getting_the_code

chromium: \
	chromium/depot_tools \
	chromium/src

chromium/depot_tools:
	-svn co http://src.chromium.org/svn/trunk/tools/depot_tools $@
	cd $@ && svn update
.PHONY: chromium/depot_tools


chromium/src:
	-git clone http://git.chromium.org/git/chromium.git $@
	cd $@ && git pull
.PHONY: chromium/src