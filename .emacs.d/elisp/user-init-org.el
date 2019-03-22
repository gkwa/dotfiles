(ensure-package-installed 'org)

(setq org-adapt-indentation nil)
(setq org-src-preserve-indentation t)
(setq org-confirm-babel-evaluate nil)
(setq org-special-ctrl-a/e t)
(setq org-log-done t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (python . t)
   (java . t)))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-mark-ring-goto)

(provide 'user-init-org)
