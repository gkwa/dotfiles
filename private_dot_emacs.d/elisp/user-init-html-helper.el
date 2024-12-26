(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)

;;   to invoke html-helper-mode automatically on .html files, do this:
;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-helper-mode))

(add-hook 'html-helper-mode-hook '(lambda () (auto-fill-mode 1) (setq fill-column 60)))

;; C-c C-n t for HTML mode
(add-hook 'html-helper-mode-hook
		  '(lambda ()
			 (define-key html-helper-mode-map "\C-c\C-nt"
			   'tidy-buffer-xhtml)
			 ;;		     (define-key texinfo-mode-map "\C-cn"
			 ;;		       'forward-paragraph)
			 )
		  )

(provide 'user-init-html-helper)
