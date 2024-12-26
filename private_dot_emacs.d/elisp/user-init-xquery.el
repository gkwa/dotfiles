(autoload 'xquery-mode "xquery-mode" "major mode for editing Xquery source." t)
(add-to-list 'auto-mode-alist '("\\.xqlib\\'" . xquery-mode))
(add-to-list 'auto-mode-alist '("\\.xq\\'" . xquery-mode))

(provide 'user-init-xquery)
