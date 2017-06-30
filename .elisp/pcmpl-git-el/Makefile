.PHONY: git-options
EMACS=Emacs

git-options: pcmpl-git-parse.el
	$(EMACS) --batch \
		--eval "(add-to-list 'load-path (expand-file-name \"~/.elisp/pcmpl-git-el\"))" \
		-q \
		-no-site-file \
		-l ./pcmpl-git-parse.el \
		-f git-parse-and-save
