(ensure-package-installed 'elpy)
(ensure-package-installed 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'user-init-python)
