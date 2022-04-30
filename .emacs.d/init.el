(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "/Users/mtm/.emacs.d/.cask/28.1/elpa")
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'user-init)
