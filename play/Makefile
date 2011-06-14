MAKEFLAGS=-j 5


update: \
	android_tools \
	wikitest \
	git-mediawiki \
	timecard \
	bugzilla \
	bztools \
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
	virtualbox \
	mod_auth_openid \


.PHONY: update

android_tools:
	if [ ! -d $@ ]; then mkdir $@ && cd $@ && repo init -u git://android.git.kernel.org/tools/manifest.git < /dev/null; else true; fi ;
	(cd $@ && repo sync)
.PHONY: android_tools

# http://git.661346.n2.nabble.com/Git-Mediawiki-Question-about-Jeff-King-s-import-script-td6407396.html
# or here git://github.com/Bibzball/Git-Mediawiki.git
# http://thread.gmane.org/gmane.comp.version-control.git/175525
# http://thread.gmane.org/gmane.comp.version-control.git/175525
# https://git.wiki.kernel.org/index.php/InterfacesFrontendsAndTools
git-mediawiki:
	if [ ! -d $@ ]; then git clone git://github.com/singpolyma/git-mediawiki.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: git-mediawiki

wikitest:
	if [ ! -d $@ ]; then git clone git://github.com/peff/wikitest.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: wikitest


timecard:
	if [ ! -d $@ ]; then git clone git://github.com/peff/timecard.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: timecard


mod_auth_openid:
	if [ ! -d $@ ]; then git clone git://github.com/bmuller/mod_auth_openid.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: mod_auth_openid

# http://techbase.kde.org/Getting_Started/Sources/KDE_git-tutorial
amarok:
	if [ ! -d $@ ]; then git clone git://anongit.kde.org/amarok $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: amarok

cmake:
	if [ ! -d $@ ]; then git clone http://wildcodes.com/git/CMake $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: cmake

virtualbox:
	if [ ! -d $@ ]; then svn co http://www.virtualbox.org/svn/vbox/trunk $@; else true; fi ;
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: virtualbox

dvc:
	if [ ! -d $@ ]; then bzr co -v http://bzr.xsteve.at/dvc $@; else true; fi ;
	(cd $@ && bzr update)
.PHONY: dvc

bugzilla:
	if [ ! -d $@ ]; then bzr co -v bzr://bzr.mozilla.org/bugzilla/trunk $@; else true; fi ;
	(cd $@ && bzr update)
.PHONY: bugzilla


bztools:
	if [ ! -d $@ ]; then git clone git://github.com/LegNeato/bztools.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: bztools

git: 
	if [ ! -d $@ ]; then git clone git://git.kernel.org/pub/scm/git/git.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: git

git-gui: 
	if [ ! -d $@ ]; then git clone git://repo.or.cz/git-gui.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: git-gui

gitk: 
	if [ ! -d $@ ]; then git clone git://git.kernel.org/pub/scm/gitk/gitk.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: gitk

pybugz:
	if [ ! -d $@ ]; then git clone git://github.com/williamh/pybugz.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: pybugz

syslinux:
	if [ ! -d $@ ]; then git clone git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: syslinux

emacs:
	if [ ! -d $@ ]; then git clone git://git.savannah.gnu.org/emacs.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: emacs

# http://code.google.com/p/gerrit/wiki/Source?tm=4
gerrit2:
	if [ ! -d $@ ]; then mkdir gerrit2; cd gerrit2; repo init -u git://android.git.kernel.org/tools/manifest.git; else true; fi ;
	(cd $@ && repo sync)
.PHONY: gerrit2

gsl-shell:
	if [ ! -d $@ ]; then git clone git://git.savannah.nongnu.org/gsl-shell.git $@; else true; fi ;
	(cd $@ && git pull)
.PHONY: gsl-shell

# http://code.google.com/p/waf/
# http://waf.googlecode.com/svn/docs/wafbook/single.html
waf:
	if [ ! -d $@ ]; then \
		svn checkout http://waf.googlecode.com/svn/trunk/ $@; \
	else true; fi ;
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: waf

# The ns-3 Network Simulator http://nsnam.blogspot.com
ns-3-dev: 
	if [ ! -d $@ ]; then \
		hg clone http://code.nsnam.org/ns-3-dev $@; \
	else true; fi ;
	(cd $@ && hg update)
.PHONY: ns-3-dev

freebsd:
	if [ ! -d $@ ]; then svn checkout svn+ssh://svn.freebsd.org/base/head $@; else true; fi ;
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: freebsd

