(autoload 'bat-mode "bat-mode" "DOS and WIndows BAT files" t)

(add-to-list 'auto-mode-alist '("\\.[sS][cC][pP][tT]\\'" . bat-mode))
(add-to-list 'auto-mode-alist '("\\.[cC][mM][dD]\\'" . bat-mode))
(add-to-list 'auto-mode-alist '("\\.[bB][aA][tT]\\'" . bat-mode))
(add-to-list 'auto-mode-alist '("CONFIG\\." . bat-mode))
(add-to-list 'auto-mode-alist '("AUTOEXEC\\." . bat-mode))

(add-hook 'bat-mode-hook
	  '(lambda ()
	     (auto-fill-mode 0)
	     (setq fill-column 72)
	     ))

(provide 'user-init-bat)
