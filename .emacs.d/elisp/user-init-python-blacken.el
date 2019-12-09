(ensure-package-installed 'blacken)
(add-hook 'python-mode-hook 'blacken-mode)

(provide 'user-init-python-blacken)
