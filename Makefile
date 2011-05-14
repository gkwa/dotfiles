all: \
	emacs_setup \
	update \
	portsupdate

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

compile:
	$(emacs_setup)

portsupdate: 
	sudo port selfupdate
	sudo port sync
	sudo port upgrade outdated


emacs_setup = \
	cd ~/.elisp/org-mode; $(MAKE)