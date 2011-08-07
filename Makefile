MAKEFLAGS=-j 4

uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

ifeq ($(uname_S),Darwin)
all: \
	emacs \
	update \
	pu
else
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


zip: /tmp/o.zip
/tmp/o.zip:
	git ls -c .emacs .elisp | cpio -pamvd /tmp/o
	7za a /tmp/o.zip /tmp/o
.PHONY: /tmp/o.zip

exe:/tmp/o.exe
/tmp/o.exe:
	rm -rf \
		/tmp/o \
		$@
	({ git ls \
		.gitmodules \
		.emacs \
		.gitignore \
		.gitconfig \
		.bash_profile \
		.bashrc \
		.emacs_bash \
		cygwin_setup/home-administrator.bat \
		cygwin_setup/home-boxstream.bat \
		cygwin_setup/pathman.exe \
		cygwin_setup/robocopy.exe \
		cygwin_setup/setx.exe \
		.elisp ; \
		find .elisp \( -name '.git' -o -iname "*.pyc" -o -iname "*.elc" \) -prune -o -print ;} \
		| cpio -pamvd /tmp/o;)
#	7za a /tmp/o.zip /tmp/o
	(cd /tmp/o; 7za a -sfx /tmp/o.exe .)
	du -sh /tmp/o.exe
.PHONY: /tmp/o.exe

upload:
	rsync -vaz --progress /tmp/o.exe boxstream@69.90.235.86:/c/apache/htdocs




emacs = \
	(cd ~/.elisp/org-mode; \
		$(MAKE) EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs; \
		$(MAKE) EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs all;)

clean_org_mode = \
	(cd ~/.elisp/org-mode; $(MAKE) clean)