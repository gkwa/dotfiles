(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)

(add-to-list 'auto-mode-alist '("\\.scpt\\'" . applescript-mode))
(add-to-list 'auto-mode-alist '("\\.applescript\\'" . applescript-mode))

(provide 'user-init-applescript)
