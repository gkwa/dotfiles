(when (equal system-type 'darwin)
  (progn
    (require 'user-init-pbcopy)
    (require 'pbcopy)
    (turn-on-pbcopy)
    ;; On osx, when I try C-DEL, then all I get is DEL. I want to bind
    ;; C-DEL to backward-kill-word, but since I can't generate the
    ;; C-DEL key, I'm using the function key fn
    (global-set-key [deletechar] (quote backward-kill-word))
    ))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'user-init-darwin)
