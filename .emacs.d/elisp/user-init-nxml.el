(add-hook 'nxml-mode-hook '(lambda ()
                             (setq require-final-newline nil)
                             (setq mode-require-final-newline nil)))

(setq-default nxml-slash-auto-complete-flag t)

(provide 'user-init-nxml)
