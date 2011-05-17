update: bugzilla bztools git pybugz syslinux
	(cd bugzilla && bzr update)
	(cd bztools && git pull)
	(cd git && git pull)
	(cd pybugz && git pull)

bugzilla:
	bzr co -v bzr://bzr.mozilla.org/bugzilla/trunk bugzilla
bztools:
	git clone git://github.com/LegNeato/bztools.git
git: 
	git clone git://git.kernel.org/pub/scm/git/git.git
pybugz:
	git://github.com/williamh/pybugz.git

syslinux:
	-git clone git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git
	(cd syslinux && git pull)
