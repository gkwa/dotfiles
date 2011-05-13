.PHONY:emacs_setup
emacs_setup:
	(cd ~/.elisp/org-mode; $(MAKE))

.PHONY: update
update:
	git submodule update --init --recursive

getnew:
	(git submodule foreach "git co master")
	(git submodule foreach "git pull")