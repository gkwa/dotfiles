;; ------------------------------
;; Window Number mode
;; ------------------------------
;; http://nschum.de/src/emacs/window-numbering-mode/
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'window-numbering)
(window-numbering-mode 1)

(provide 'user-init-window-numbering)
