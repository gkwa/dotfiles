;; http://www.emacswiki.org/emacs/RecentFiles
(autoload 'recentf "RecentF" "Enter recentf mode." t)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(setq recentf-max-saved-items 100)
(setq recentf-max-menu-items 100)
;;(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'user-init-recentf)