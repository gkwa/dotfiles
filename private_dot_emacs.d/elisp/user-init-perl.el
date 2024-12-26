;; ------------------------------
;; perl-mode
;; ------------------------------
(add-to-list 'auto-mode-alist '("\\.pm\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pl\\'" . perl-mode))

(add-hook 'perl-mode-hook
	  (lambda ()
	    (setq tab-width 12)))

(provide 'user-init-perl)
