uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')

ifeq ($(uname_S),Darwin)
all:						\
	emacs_setup				\
	update					\
	portsupdate
else
all:						\
	emacs_setup				\
	update
endif

.PHONY:emacs_setup
emacs_setup:
	$(emacs_setup)

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
	$(emacs_setup)

portsupdate: 
	sudo port selfupdate
	sudo port sync
	sudo port upgrade outdated


emacs_setup = \
	cd ~/.elisp/org-mode; $(MAKE)

ifeq ($(uname),Darwin)
clean:
	sudo rm -rf ~/.local/share/Trash/files/* ~/.Trash/*
else
clean:
endif
