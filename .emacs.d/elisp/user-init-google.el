(require 'google-search)
(require 'google-define)

(define-key global-map "\C-cd" 'google-define)
(define-key global-map "\C-cs" 'google-search-selection)

(provide 'user-init-google)
