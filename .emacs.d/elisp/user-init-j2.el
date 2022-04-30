;; http://code.google.com/p/js2-mode/source/checkout
;; svn checkout http://js2-mode.googlecode.com/svn/trunk/ ~/.emacs.d/elisp/js2-mode-read-only

(add-to-list 'load-path "~/.emacs.d/elisp/js2-mode-read-only")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(provide 'user-init-j2)
