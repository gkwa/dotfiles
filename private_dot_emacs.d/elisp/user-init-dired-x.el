(require 'dired-x)

;; https://emacs.stackexchange.com/a/36851/13580
(defun tl/dired-copy-path-at-point ()
    (interactive)
    (dired-copy-filename-as-kill 0))
(define-key dired-mode-map (kbd "W") 'tl/dired-copy-path-at-point)

(setq-default dired-omit-files-p t)
(setq-default dired-recursive-deletes 'always)

(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq dired-listing-switches "-alh")

(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key "f" (quote find-dired))
	    (when recentf-mode
	      (recentf-add-file default-directory))))

(provide 'user-init-dired-x)
