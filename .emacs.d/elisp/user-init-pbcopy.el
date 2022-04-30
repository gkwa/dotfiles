(if (eq system-type 'darwin)
    (progn
      (require 'pbcopy)
      (turn-on-pbcopy)
      ))

(provide 'user-init-pbcopy)
