;; find file at point

(require 'ffap)
;; rebind C-x C-f and others to the ffap bindings (see variable ffap-bindings)
(ffap-bindings)
;; C-u C-x C-f finds the file at point
(setq ffap-require-prefix t)
;; browse urls at point via w3m
;; (setq ffap-url-fetcher 'w3m-browse-url)

(setq-default ffap-machine-p-known (quote reject))

(provide 'user-init-ffap)
