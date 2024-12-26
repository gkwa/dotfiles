;; ------------------------------
;; git jump with quickfix files
;; ------------------------------

;; http://aaroncrane.co.uk/2011/11/git_jump_emacs/

(defun quickfix-open (files)
  (setq-default compilation-directory default-directory)
  (compilation-start
   (concat "cat "
	   (mapconcat #'shell-quote-argument files " "))))

(provide 'user-init-git-jump)
