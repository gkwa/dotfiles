(autoload 'recentf "RecentF" "Enter recentf mode." t)
(setq recentf-auto-cleanup 3600)
(setq recentf-max-saved-items 50)
(setq recentf-max-menu-items 50)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'user-init-recentf)
