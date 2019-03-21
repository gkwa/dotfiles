(ensure-package-installed 'ledger-mode)

(require 'ledger-mode)
(if (eq system-type 'darwin)
    (progn (require 'ledger-mode)))

(provide 'user-init-ledger)
