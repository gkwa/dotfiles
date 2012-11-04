# fixme: this fails with this error
# scons \
# Updating '.':
# Authentication realm: <http://scons.tigris.org:80> CollabNet Subversion Repository
# Password for 'demo':
# Authentication realm: <http://scons.tigris.org:80> CollabNet Subversion Repository
# Username: demo
# Password for 'demo':
# Authentication realm: <http://scons.tigris.org:80> CollabNet Subversion Repository
# Username:
# Password for '':
# svn: E170001: Unable to connect to a repository at URL 'http://scons.tigris.org/svn/scons/trunk'
# svn: E170001: OPTIONS of 'http://scons.tigris.org/svn/scons/trunk': authorization failed: Could not authenticate to server: rejected Basic challenge (http://scons.tigris.org)
# make: *** [scons] Error 1
# [demo@demos-imac:~/play(master)]$
####################################################################################################


MAKEFLAGS=-j 10

gitlog1=git log --pretty=tformat:'%h %d %ar %s' --reverse --name-status -m ..origin/master >> ../$@.gitlog
gitlog2=git log --pretty=tformat:'%h %d %ar %s' --reverse -m ..origin/master >> ../$@.gitlog
gitlog3=git log -p --reverse -m ..origin/master >> ../$@.gitlog
gitlog=\
	echo -------------------------------------------------------------------  >> ../$@.gitlog; \
	$(gitlog2); \
	echo -------------------------------------------------------------------  >> ../$@.gitlog; \
	$(gitlog1); \
	echo -------------------------------------------------------------------  >> ../$@.gitlog; \
	$(gitlog3)

update: \
theunarchiver \
windirstat \
jinja2 \
cheetah \
jekyll_generator \
asciidoc-8.6.8 \
octopress \
bockbuild \
gnupg \
gnucash \
msmtp \
mpop \
zf2 \
mintty-read-only \
misspell-check \
imagemagick \
ffmpeg_bundle \
ffmpeg \
ffmpeg-web \
libav \
audacity-read-only \
curl \
subversion \
gdrive-cli \
sparkle \
mod_perl \
mod_perl-2.0 \
augeas \
windows-package-manager \
filezilla \
topgit \
build-emacs \
emacs-starter-kit \
MediaWiki \
thucydides \
pweave \
bradleywright-emacs-d \
python-bugzilla \
mplayer \
mplayer-build \
git_osx_installer \
bash-completion \
pfsense \
emacs-tiny-tools \
kBuild \
node \
go \
golang-on-cygwin \
fetchmail \
pre-commit \
grc \
gitflow \
gnus \
junit \
numpy \
fedora-mingw \
slum \
clam \
unsis \
nvda \
mongo \
tinypy \
nsis \
gitolite \
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
git \
git-gui \
gitk \
timecard \
bugzilla \
bztools \
mono \
pybugz \
linux-2.6 \
linux \
syslinux \
dvc \
gerrit2 \
gerrit \
emacs \
gsl-shell \
ns-3-dev \
amarok \
cmake \
monomac \
rst2texinfo \
mod_auth_openid \
python-graph-read-only \
gitster \
mozilla-1.9.git \
keepassx \
ndesk-options \
selenium-grid \
php-src \
php-src-5.2 \
gitlab \
Selenium2-Java-QuickStart-Archetype \
Selenium2 \
Quicksilver \
php-src-trunk \
wanderlust

jinja2:
	-git clone git://github.com/mitsuhiko/jinja2.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: jinja2

jekyll_generator:
	-git clone git://github.com/drnic/jekyll_generator.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: jekyll_generator

# https://github.com/wanderlust/wanderlust
wanderlust:
	-git clone git://github.com/wanderlust/wanderlust.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: wanderlust

octopress:
	-git clone git://github.com/imathis/octopress.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: octopress


bockbuild:
	-git clone git://github.com/abock/bockbuild.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: bockbuild

gnupg:
	test -d $@ || git clone git://git.gnupg.org/gnupg.git
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: gnupg


gnucash:
	test -d $@ || git clone git://github.com/Gnucash/gnucash.git
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: gnucash

# Non-members may check out a read-only working copy anonymously over HTTP.
mintty-read-only:
	test -d $@ || svn checkout http://mintty.googlecode.com/svn/trunk/ mintty-read-only
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: mintty-read-only

# http://www.mediawiki.org/wiki/Developer_hub
MediaWiki:
	test -d $@ || svn checkout http://svn.wikimedia.org/svnroot/mediawiki/trunk/phase3 MediaWiki
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: MediaWiki

##############################

ffmpeg_bundle: libav ffmpeg-web ffmpeg

ffmpeg-web:
	[ -d $@ ] || git clone git://ffmpeg.org/ffmpeg-web.git
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: ffmpeg-web

mpop:
	[ -d $@ ] || git clone git://mpop.git.sourceforge.net/gitroot/mpop/mpop
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: mpop

msmtp:
	[ -d $@ ] || git clone git://msmtp.git.sourceforge.net/gitroot/msmtp/msmtp
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: msmtp

# php stack
# http://framework.zend.com/
# https://github.com/zendframework/zf2
zf2:
	[ -d $@ ] || git clone git://github.com/zendframework/zf2.git
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: zf2

libav:
	[ -d $@ ] || git clone git://git.libav.org/libav.git
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: libav

ffmpeg:
	[ -d $@ ] || git clone git://source.ffmpeg.org/ffmpeg.git
	cd $@ && git fetch && $(gitlog) && git pull
.PHONY: ffmpeg

##############################

linux-2.6:
	test -d $@ || git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: linux-2.6.git

linux:
	test -d $@ || git clone git://github.com/torvalds/linux.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: linux

gdrive-cli.git:
	test -d $@ || git clone git://github.com/tom-dignan/gdrive-cli.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gdrive-cli.git

gitlabhq:
	test -d $@ || git clone git://github.com/gitlabhq/gitlabhq.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gitlabhq


sparkle:
	test -d $@ || git clone git://github.com/andymatuschak/Sparkle.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: sparkle

topgit:
	test -d $@ || git clone git://repo.or.cz/topgit.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: topgit

emacs-starter-kit:
	test -d $@ || git clone git://github.com/technomancy/emacs-starter-kit.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: emacs-starter-kit

build-emacs:
	test -d $@ || git clone git://github.com/caldwell/build-emacs.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: build-emacs

bradleywright-emacs-d:
	test -d $@ || git clone git://github.com/bradleywright/emacs-d.git bradleywright-emacs-d
	cd $@ && git config remote.origin.url git://github.com/bradleywright/emacs-d.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: bradleywright-emacs-d

python-bugzilla:
	test -d $@ || git clone git://git.fedorahosted.org/git/python-bugzilla
	cd $@ && git config remote.origin.url git://git.fedorahosted.org/git/python-bugzilla
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: git

# git mirror of php source from svn
php-src:
	test -d $@ || git clone git://github.com/php/php-src.git
	cd $@ && git config remote.origin.url git://github.com/php/php-src.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: git

# http://www.php.net/svn.php
php-src-5.2:
	test -d $@ || svn checkout https://svn.php.net/repository/php/php-src/branches/PHP_5_2 $@
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: php-src-5.2

# http://www.php.net/svn.php
php-src-trunk:
	test -d $@ || svn checkout https://svn.php.net/repository/php/php-src/trunk php-src-trunk
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: php-src-trunk

keepassx:
	test -d $@ || svn --trust-server-cert checkout https://keepassx.svn.sourceforge.net/svnroot/keepassx keepassx
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: keepassx

gerrit:
	test -d $@ || git clone https://code.google.com/p/gerrit gerrit
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gerrit

git_osx_installer:
	test -d $@ || git clone git://github.com/timcharper/git_osx_installer.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: git_osx_installer

bash-completion:
	test -d $@ || git clone git://git.debian.org/git/bash-completion/bash-completion.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: bash-completion

pfsense:
# http://devwiki.pfsense.org/GitWorkflow
	test -d $@ || git clone git://github.com/bsdperimeter/pfsense.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: pfsense

git:
	test -d $@ || git clone git://github.com/git/git.git
	(cd git; git config remote.origin.url git://github.com/git/git.git)
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: git

theunarchiver:
	test -d $@ || hg clone hg clone https://code.google.com/p/theunarchiver
	cd $@ && hg update
.PHONY: theunarchiver

windirstat:
	test -d $@ || hg clone http://windirstat.hg.sourceforge.net:8000/hgroot/windirstat/windirstat
	cd $@ && hg update
.PHONY: windirstat

# https://bitbucket.org/mpastell/pweave
pweave:
	test -d $@ || hg clone https://bitbucket.org/mpastell/pweave
	cd $@ && hg update
.PHONY: pweave

# http://www.methods.co.nz/asciidoc/INSTALL.html#_installing_from_the_mercurial_repository
asciidoc-8.6.8:
	hg clone -r 8.6.8 https://asciidoc.googlecode.com/hg/ asciidoc-8.6.8
	test -d $@ || hg clone -r 8.6.8 https://asciidoc.googlecode.com/hg/ asciidoc-8.6.8
	cd $@ && hg update
.PHONY: pweave





npackd: windows-package-manager
windows-package-manager:
	test -d $@ || hg clone https://code.google.com/p/windows-package-manager
	cd $@ && hg update
.PHONY: windows-package-manager


go:
	test -d $@ || hg clone -u release https://go.googlecode.com/hg/ go
	cd $@ && hg update
.PHONY: go

# junio's repo
# https://mail.google.com/mail/?account_id=taylor.monacelli@streambox.com&shva=1#search/from%3Ajunio+github/1325c4d77836ead8
gitster:
	test -d $@ || git clone git://github.com/gitster/git.git $@
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gitster

emacs-tiny-tools:
	test -d $@ || git clone git://git.savannah.nongnu.org/emacs-tiny-tools.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: emacs-tiny-tools

mozilla-1.9:
	test -d $@ || git clone git://repo.or.cz/mozilla-1.9.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: mozilla-1.9


golang-on-cygwin:
	test -d $@ || hg clone https://golang-on-cygwin.googlecode.com/hg/ golang-on-cygwin
	cd $@ && hg update
.PHONY: golang-on-cygwin

# http://repo.or.cz/w/mplayer-build.git
mplayer-build:
	test -d $@ || git clone git://repo.or.cz/mplayer-build.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
	(cd $@ && git sub update --init --recursive)
.PHONY: mplayer

python-graph-read-only:
	test -d $@ || svn checkout http://python-graph.googlecode.com/svn/trunk/ python-graph-read-only
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: python-graph-read-only

fetchmail:
	test -d $@ || git clone git://gitorious.org/fetchmail/fetchmail.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: fetchmail

pre-commit:
	test -d $@ || git clone git://github.com/jish/pre-commit.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: pre-commit


junit:
	test -d $@ || git clone git://github.com/KentBeck/junit.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: junit

numpy:
	test -d $@ || git clone git://github.com/numpy/numpy.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: numpy

# Non-members may check out a read-only working copy anonymously over HTTP.

fedora-mingw:
	test -d $@ || git clone git://git.annexia.org/git/fedora-mingw.git
	-rm -f $@.gitlog
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: fedora-mingw

kBuild:
# possibly newer version are listed here http://svn.netlabs.org/kbuild/wiki/Download
	test -d $@ || svn co http://svn.netlabs.org/repos/kbuild/tags/kBuild-0.1.5-p2 $@
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: kBuild

slum:
	test -d $@ || svn checkout http://slum.googlecode.com/svn/trunk $@
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: slum

clam:
	test -d $@ || svn co http://clam-project.org/clam/trunk clam
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: clam

unsis:
	test -d $@ || svn checkout http://unsis.googlecode.com/svn/trunk $@
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: unsis

# http://www.nvda-project.org/attachment/ticket/1221/sconstruct
nvda:
	test -d $@ || bzr checkout --lightweight http://bzr.nvaccess.org/nvda/main $@
	cd $@ && bzr update
.PHONY: nvda


selenium-grid:
	test -d $@ || git clone git://github.com/nirvdrum/selenium-grid.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: selenium-grid

mongo:
	test -d $@ || git clone git://github.com/mongodb/mongo.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: mongo

gitolite:
	test -d $@ || git clone git://github.com/sitaramc/gitolite.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gitolite

ndesk-options:
	test -d $@ || git clone git://git.ndesk.org/pub/scm/ndesk-options
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: ndesk-options

gnus:
	test -d $@ || git clone http://git.gnus.org/gnus.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gnus

mono:
	test -d $@ || git clone git://github.com/mono/mono.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: mono

rst2texinfo:
	test -d $@ || hg clone https://bitbucket.org/jonwaltman/rst2texinfo
	cd $@ && hg update
.PHONY: rst2texinfo

cpython:
	test -d $@ || hg clone http://hg.python.org/cpython
	cd $@ && hg update
.PHONY: cpython

gitosis:
	test -d $@ || git clone git://eagain.net/gitosis.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gitosis

topology-doc:
	test -d $@ || git clone git://github.com/mjdominus/topology-doc.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: topology-doc

python:
	mkdir -p $@/trunk
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
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: pyutils

monomac:
	test -d $@ || git clone git://github.com/mono/monomac.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: monomac

monodevelop:
	test -d $@ || git clone git://github.com/mono/monodevelop.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: monodevelop

JSONKit:
	test -d $@ || git clone git://github.com/fpillet/JSONKit.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: JSONKit

polypkg:
	test -d $@ || git clone git://github.com/tedjp/polypkg.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: polypkg

clicktoflash:
	test -d $@ || git clone git://github.com/rentzsch/clicktoflash.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: clicktoflash

hudson:
	test -d $@ || git clone git://github.com/hudson/hudson.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: hudson

rails:
	test -d $@ || git clone https://github.com/rails/rails.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: rails

# http://code.google.com/p/chromium/wiki/UsingGit
jquery:
	test -d $@ || git clone git://github.com/jquery/jquery.git
	(cd $@ && git fetch && $(gitlog) && git pull)
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
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: git-mediawiki

gparted:
	test -d $@ || git clone git://git.gnome.org/gparted
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gparted

wikitest:
	test -d $@ || git clone git://github.com/peff/wikitest.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: wikitest

timecard:
	test -d $@ || git clone git://github.com/peff/timecard.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: timecard

mod_auth_openid:
	test -d $@ || git clone git://github.com/bmuller/mod_auth_openid.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: mod_auth_openid

# http://techbase.kde.org/Getting_Started/Sources/KDE_git-tutorial
amarok:
	test -d $@ || git clone git://anongit.kde.org/amarok $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: amarok

cmake:
	test -d $@ || git clone http://wildcodes.com/git/CMake
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: cmake

tinypy:
	test -d $@ || svn checkout http://tinypy.googlecode.com/svn/trunk/ tinypy
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: tinypy

virtualbox:
	test -d $@ || svn co http://www.virtualbox.org/svn/vbox/trunk virtualbox
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: virtualbox

diffmk:
	test -d $@ || svn co http://diffmk.svn.sourceforge.net/trunk diffmk
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: diffmk


nsis:
	test -d $@ || svn co https://nsis.svn.sourceforge.net/svnroot/nsis/NSIS/trunk nsis \
		--trust-server-cert --non-interactive
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: scons

scons:
	test -d $@ || svn checkout http://scons.tigris.org/svn/scons/trunk scons \
		--username guest --password ""
	cd $@ && svn cleanup
	cd $@ && svn update
.PHONY: scons

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
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: bztools

node:
	test -d $@ || git clone git://github.com/joyent/node.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: node

git-gui:
	test -d $@ || git clone git://repo.or.cz/git-gui.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: git-gui

gitk:
	test -d $@ || git clone git://git.kernel.org/pub/scm/gitk/gitk.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gitk

pybugz:
	test -d $@ || git clone git://github.com/williamh/pybugz.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: pybugz

syslinux:
	test -d $@ || git clone git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: syslinux

gitflow:
	test -d $@ || git clone git://github.com/nvie/gitflow.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: gitflow

thucydides:
	test -d $@ || git clone git://github.com/thucydides-webtests/thucydides.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: thucydides

grc:
	test -d $@ || git clone git://github.com/leathekd/grc.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: grc

Selenium2:
	test -d $@ || git clone git://github.com/Selenium2/Selenium2.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: Selenium2

Selenium2-Java-QuickStart-Archetype:
	test -d $@ || git clone git://github.com/sebarmeli/Selenium2-Java-QuickStart-Archetype.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: Selenium2-Java-QuickStart-Archetype

emacs:
	test -d $@ || git clone git://git.savannah.gnu.org/emacs.git
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: emacs

# http://code.google.com/p/gerrit/wiki/Source?tm=4
gerrit2:
	if [ ! -d $@ ]; then mkdir gerrit2; cd gerrit2; repo init -u git://android.git.kernel.org/tools/manifest.git; else true; fi ;
	(cd $@ && repo sync)
.PHONY: gerrit2

gsl-shell:
	test -d $@ || git clone git://git.savannah.nongnu.org/gsl-shell.git
	(cd $@ && git fetch && $(gitlog) && git pull)
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

mod_perl-2.0:
	test -d $@ || svn co https://svn.apache.org/repos/asf/perl/modperl/trunk/ mod_perl-2.0
	cd $@ && svn udpate
.PHONY: mod_perl-2.0

mod_perl:
	test -d $@ || git clone git://github.com/apache/mod_perl.git
	cd $@ && git pull
.PHONY: mod_perl

augeas:
	test -d $@ || git clone git://github.com/lutter/augeas.git
	cd $@ && git pull
.PHONY: augeas


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

subversion:
	-svn co http://svn.apache.org/repos/asf/subversion/trunk subversion \
		--trust-server-cert --non-interactive
	cd $@ && svn update
.PHONY: subversion

audacity-read-only:
	-svn checkout http://audacity.googlecode.com/svn/audacity-src/trunk audacity-read-only
	cd $@ && svn update
.PHONY: audacity-read-only

filezilla:
	-svn co https://svn.filezilla-project.org/svn/FileZilla3/trunk filezilla --trust-server-cert --non-interactive
	cd $@ && svn update
.PHONY: filezilla

# To retrieve, or check out ImageMagick development, use this command:
# http://www.imagemagick.org/script/subversion.php
imagemagick:
	-svn co https://www.imagemagick.org/subversion/ImageMagick/trunk ImageMagick --trust-server-cert --non-interactive
	cd $@ && svn update
.PHONY: imagemagick

curl:
	git clone git://github.com/bagder/curl.git
	cd $@ && git pull
.PHONY: curl


mplayer:
	git clone git://repo.or.cz/mplayer.git
	cd $@ && git pull
.PHONY: mplayer

chromium/src:
	-git clone http://git.chromium.org/git/chromium.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: chromium/src


misspell-check:
	-git clone git://github.com/lyda/misspell-check.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: misspell-check

cheetah:
	-git clone git://github.com/cheetahtemplate/cheetah.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: cheetah

Quicksilver:
	-git clone git://github.com/quicksilver/Quicksilver.git $@
	(cd $@ && git fetch && $(gitlog) && git pull)
.PHONY: Quicksilver


# ##################################################
# cleanup
# ##################################################

clean:
	rm -f \
		*.gitlog
