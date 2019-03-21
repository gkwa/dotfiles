(ensure-package-installed 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.eyaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(provide 'user-init-yaml)
