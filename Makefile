MAKEFLAGS=-j 4

uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

ifeq ($(uname_S),Darwin)

EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacsa

all: \
emacs \
update \
pu
else

EMACS=/cygdrive/c/Program\\ Files/emacs-23.3/bin/emacs.exe

all: \
emacs \
update

endif


emacs:
	$(emacs)
.PHONY: emacs


update:
	git submodule update --init --recursive
.PHONY: update

upgrade:
	(git submodule foreach "git co master"; \
	git submodule foreach "git pull"; \
	git submodule summary)

t:
	echo $(uname)
compile:
	$(emacs)

# ports update
pu:
	sudo port selfupdate
	sudo port sync
	sudo port upgrade outdated

ifeq ($(uname_S),Darwin)
clean:
	sudo rm -rf ~/.local/share/Trash/files/* ~/.Trash/*
	$(clean_org_mode)
else
clean:
	$(clean_org_mode)
endif

zip:/tmp/o.zip
/tmp/o.zip:
	rm -rf \
		/tmp/o \
		$@
	({ git ls \
		.gitmodules \
		.emacs \
		.gitignore \
		.gitconfig \
		.bash_profile \
		.alias \
		.bashrc \
		.emacs_bash \
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
	(cd /tmp/o; 7za a -tzip /tmp/o.zip .)
	du -sh /tmp/o.zip
.PHONY: /tmp/o.zip

upload:
	du -sh /tmp/o.zip
	rsync -vaz --progress /tmp/o.zip boxstream@69.90.235.86:/c/apache/htdocs

emacs = \
	(cd ~/.elisp/org-mode; \
		$(MAKE) EMACS="$(EMACS)"; \
		$(MAKE) EMACS="$(EMACS)" all;)


clean_org_mode = \
	(cd ~/.elisp/org-mode; $(MAKE) clean)