(add-to-list 'load-path "~/.emacs.d/elisp")

(setq package-enable-at-startup nil)

(require 'user-init-package-init)
(require 'user-init)
(provide 'init)
(put 'downcase-region 'disabled nil)
