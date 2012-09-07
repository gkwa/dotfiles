MAKEFLAGS=-j 5

all: \
	ds \
	dashboard \
	ls \
	osx_ed_webapi \
	sbwww \
	win_ed_webapi \
	lstmptrash

ds:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: ds

lstmptrash:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: lstmptrash

dashboard:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: dashboard

ls:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: ls

osx_ed_webapi:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: osx_ed_webapi

sbwww:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: sbwww

win_ed_webapi:
	test -d $@ || (svn co http://vcs.streambox.com/rep/$@ --username taylor && svn upgrade)
	(cd $@ && svn cleanup)
	(cd $@ && svn update)
.PHONY: win_ed_webapi
