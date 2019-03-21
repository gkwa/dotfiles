(ensure-package-installed 'puppet-mode)

(add-to-list 'load-path "~/.emacs.d/elisp/puppet-syntax-emacs")
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(provide 'user-init-puppet)
