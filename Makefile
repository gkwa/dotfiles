MAKEFLAGS=-j 4

uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

##############################
ifeq ($(uname_S),Darwin)
all: emacs update ports
clean:
	sudo rm -rf ~/.local/share/Trash/files/* ~/.Trash/*
	$(clean_org_mode)

else
all: emacs update
clean:
	$(clean_org_mode)
endif

##############################
emacs:
	$(emacs)
.PHONY: emacs

##############################
update:
	git submodule update --init --recursive
.PHONY: update

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
	sudo port sync
	sudo port upgrade outdated

##############################
zip:/tmp/o.zip
/tmp/o.zip:
	rm -rf \
		/tmp/o \
		$@
	({ git ls \
		.bash_profile \
		.bashrc \
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
	(cd /tmp/o; 7za a -tzip /tmp/o.zip .)
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
		$(MAKE) EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs; \
		$(MAKE) EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs all;)

##############################

clean_org_mode = \
	(cd ~/.elisp/org-mode; $(MAKE) clean)