(elpy-enable)

(add-hook 'python-mode-hook 'blacken-mode)
(setq-default python-indent-offset 4)

(provide 'user-init-python)
