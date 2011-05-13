emacs_setup: .elisp/org-mode
	(cd ~/.elisp/org-mode; $(MAKE))

.PHONY: git_sub_update
git_sub_update:
	git submodule update --init --recursive

.elisp/org-mode: git_sub_update

up:
	(git submodule foreach "git co master")
	(git submodule foreach "git pull")