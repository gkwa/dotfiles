(require 'ctags-update)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name
	   (directory-file-name dir-name))))

(ctags-update-minor-mode 1)
(setq-default path-to-ctags "ctags")

(provide 'user-init-ctags)
