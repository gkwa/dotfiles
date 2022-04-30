(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point 'symbol)
 '(helm-ag-ignore-buffer-patterns '("\\.txt\\'" "\\.mkd\\'")))

(provide 'user-init-ag)
