MAKEFLAGS=-j 4

uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

##############################
ifeq ($(uname_S),Darwin)

EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs

all: upgrade emacs ports
clean:
	find ~/.local/share/Trash/files -print0 | xargs -n10 -0 sudo rm -rf
	find ~/.Trash -print0 | xargs -n10 -0 sudo rm -rf
	$(clean_org_mode)

else

EMACS=/cygdrive/c/Program\\ Files/emacs-23.3/bin/emacs.exe

all: upgrade emacs
clean:
	$(clean_org_mode)
endif

##############################
emacs:
	$(emacs)
.PHONY: emacs

##############################
subupdate:
	git submodule update --init --recursive
.PHONY: subupdate

##############################
upgrade:
	(git submodule foreach "git co master"; \
	git submodule foreach "git pull"; \
	git submodule summary)

##############################
t:
	echo $(uname)

##############################
compile:
	$(emacs)

##############################
# ports update
ports:
	sudo port selfupdate
	sudo port -v sync
	sudo port upgrade outdated

##############################
zip: /tmp/o.zip
/tmp/o.zip:
	rm -rf \
		/tmp/o \
		$@
	({ git ls \
		.bash_profile \
		.bashrc \
		.minttyrc \
		.inputrc \
		.alias \
		.gitmodules \
		.emacs \
		.emacs_bash \
		.gitignore \
		.gitconfig \
		cygwin_setup/cygwin-path.bat \
		cygwin_setup/home-administrator.bat \
		cygwin_setup/home-boxstream.bat \
		cygwin_setup/pathman.exe \
		cygwin_setup/robocopy.exe \
		cygwin_setup/setx.exe \
		.elisp ; \
		find .elisp \( -name '.git' -o -iname "*.pyc" -o -iname "*.elc" \) -prune -o -print ;} \
		| cpio -pamvd /tmp/o;)
#	7za a /tmp/o.zip /tmp/o
# macports 7za is broken (for me right now, switching to zip)
#	(cd /tmp/o; 7za a -tzip /tmp/o.zip .)
	(cd /tmp/o; zip -9r /tmp/o.zip .)
	du -sh /tmp/o.zip
.PHONY: /tmp/o.zip

##############################
upload: /tmp/o.zip
	rsync -vaz --progress /tmp/o.zip boxstream@69.90.235.86:/c/apache/htdocs
	rsync -vaz --progress /tmp/o.zip /Volumes/taylor.monacelli
	du -sh /tmp/o.zip

##############################
emacs = \
	(cd ~/.elisp/org-mode; \
		$(MAKE) EMACS="$(EMACS)"; \
		$(MAKE) EMACS="$(EMACS)" all;)


##############################

clean_org_mode = \
	(cd ~/.elisp/org-mode; $(MAKE) clean)