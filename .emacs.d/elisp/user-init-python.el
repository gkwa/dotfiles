(ensure-package-installed 'elpy)
(elpy-enable)
(ensure-package-installed 'blacken)

(add-hook 'python-mode-hook 'blacken-mode)
(setq-default python-indent-offset 2)

(provide 'user-init-python)
