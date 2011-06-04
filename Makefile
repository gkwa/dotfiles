MAKEFLAGS=-j 4

uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

ifeq ($(uname_S),Darwin)
all:						\
	emacs				\
	update					\
	portsupdate
else
all:						\
	emacs				\
	update
endif

.PHONY:emacs
emacs:
	$(emacs)

.PHONY: update
update:
	git submodule update --init --recursive

upgrade:
	(git submodule foreach "git co master"; \
	git submodule foreach "git pull"; \
	git submodule summary)

t:
	echo $(uname)
compile:
	$(emacs)

portsupdate: 
	sudo port selfupdate
	sudo port sync
	sudo port upgrade outdated

ifeq ($(uname),Darwin)
clean:
	sudo rm -rf ~/.local/share/Trash/files/* ~/.Trash/*
	$(clean_org_mode)
else
clean:
	$(clean_org_mode)
endif


emacs = \
	cd ~/.elisp/org-mode; $(MAKE)

clean_org_mode = \
	(cd ~/.elisp/org-mode; $(MAKE) clean)