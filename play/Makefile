MAKEFLAGS=-j 5

.PHONY: update
update: bugzilla bztools git git-gui gitk pybugz syslinux dvc gerrit2

.PHONY: dvc
dvc:
	if [ ! -d $@ ]; then bzr co -v bzr get http://bzr.xsteve.at/dvc $@; else true; fi ;
	(cd $@ && bzr update)

.PHONY: bugzilla
bugzilla:
	if [ ! -d $@ ]; then bzr co -v bzr://bzr.mozilla.org/bugzilla/trunk $@; else true; fi ;
	(cd $@ && bzr update)

.PHONY: bztools
bztools:
	if [ ! -d $@ ]; then git clone git://github.com/LegNeato/bztools.git $@; else true; fi ;
	(cd $@ && git pull)

.PHONY: git
git: 
	if [ ! -d $@ ]; then git clone git://git.kernel.org/pub/scm/git/git.git $@; else true; fi ;
	(cd $@ && git pull)

.PHONY: git-gui
git-gui: 
	if [ ! -d $@ ]; then git clone git://repo.or.cz/git-gui.git $@; else true; fi ;
	(cd $@ && git pull)

.PHONY: gitk
gitk: 
	if [ ! -d $@ ]; then git clone git://git.kernel.org/pub/scm/gitk/gitk.git $@; else true; fi ;
	(cd $@ && git pull)

.PHONY: pybugz
pybugz:
	if [ ! -d $@ ]; then git clone git://github.com/williamh/pybugz.git $@; else true; fi ;
	(cd $@ && git pull)

.PHONY: syslinux
syslinux:
	if [ ! -d $@ ]; then git clone git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git $@; else true; fi ;
	(cd $@ && git pull)

# http://code.google.com/p/gerrit/wiki/Source?tm=4
.PHONY: gerrit2
gerrit2:
	if [ ! -d $@ ]; then mkdir gerrit2; cd gerrit2; repo init -u git://android.git.kernel.org/tools/manifest.git; else true; fi ;
	(cd $@ && repo sync)
