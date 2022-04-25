(ensure-package-installed 'terraform-mode)

(add-to-list 'auto-mode-alist '("\\.tf\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tfstate\\'" . json-mode))

(provide 'user-init-terraform)
