MAKEFLAGS=-j 5

all: \
	dashboard \
	ls \
	osx_ed_webapi \
	sbwww \
	win_ed_webapi


dashboard: 
	if [ ! -d $@ ]; then \
		svn co http://vcs.streambox.com/rep/$@ \
		$@; else true; fi ;
	(cd $@ && svn update)
.PHONY: dashboard

ls:
	if [ ! -d $@ ]; then \
		svn co http://vcs.streambox.com/rep/$@ \
		$@; else true; fi ;
	(cd $@ && svn update)
.PHONY: ls

osx_ed_webapi:
	if [ ! -d $@ ]; then \
		svn co http://vcs.streambox.com/rep/$@ \
		$@; else true; fi ;
	(cd $@ && svn update)
.PHONY: osx_ed_webapi

sbwww:
	if [ ! -d $@ ]; then \
		svn co http://vcs.streambox.com/rep/$@ \
		$@; else true; fi ;
	(cd $@ && svn update)
.PHONY: sbwww

win_ed_webapi:
	if [ ! -d $@ ]; then \
		svn co http://vcs.streambox.com/rep/$@ \
		$@; else true; fi ;
	(cd $@ && svn update)
.PHONY: win_ed_webapi


