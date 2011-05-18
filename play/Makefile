.PHONY: update
update: bugzilla bztools git pybugz syslinux dvc

.PHONY: dvc
dvc:
	-bzr get http://bzr.xsteve.at/dvc/
	(cd $@ && bzr update)

.PHONY: bugzilla
bugzilla:
	-bzr co -v bzr://bzr.mozilla.org/bugzilla/trunk bugzilla
	(cd $@ && bzr update)

.PHONY: bztools
bztools:
	-git clone git://github.com/LegNeato/bztools.git
	(cd $@ && git pull)

.PHONY: git
git: 
	-git clone git://git.kernel.org/pub/scm/git/git.git
	(cd $@ && git pull)

.PHONY: pybugz
pybugz:
	-git clone git://github.com/williamh/pybugz.git
	(cd $@ && git pull)

.PHONY: syslinux
syslinux:
	-git clone git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git
	(cd syslinux && git pull)
