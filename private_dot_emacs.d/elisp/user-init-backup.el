(require 'backup-dir)

(if (not (file-directory-p "~/.emacs_backups"))
	(make-directory "~/.emacs_backups"))
(if (not (file-directory-p "~/.emacs_backups"))
	(make-directory "~/.emacs_backups"))

(setq bkup-backup-directory-info
      '((t "~/.emacs_backups" ok-create full-path prepend-name)))

(setq-default delete-old-versions t)
(setq-default kept-old-versions 1)
(setq-default kept-new-versions 3)
(setq-default version-control t)

(provide 'user-init-backup)
