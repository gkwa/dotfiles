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


emacs = \
	(cd ~/.elisp/org-mode; \
		$(MAKE) EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs; \
		$(MAKE) EMACS=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs all;)

clean_org_mode = \
	(cd ~/.elisp/org-mode; $(MAKE) clean)