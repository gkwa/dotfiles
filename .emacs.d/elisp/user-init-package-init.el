(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives ())
  (add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
   (when (file-exists-p custom-file)
       (load custom-file))

(provide 'user-init-package-init)
