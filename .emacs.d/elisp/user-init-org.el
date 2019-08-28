(ensure-package-installed 'org)

(setq js-indent-level 2)
(setq org-adapt-indentation nil)
(setq org-src-preserve-indentation t)
(setq org-confirm-babel-evaluate nil)
(setq org-special-ctrl-a/e nil)
(setq org-log-done t)
(setq org-babel-python-command "/usr/local/bin/python3")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (shell . t)
   (python . t)
   (js . t)
   (java . t)))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-mark-ring-goto)

(defun reformat-paragraph-with-line-spacing()
  "do mything"
  (interactive)
  (progn
    (org-beginning-of-line)
    (delete-horizontal-space)
    (open-line 1)
    (forward-char)
    (fill-paragraph)
    (forward-line -1)
    (delete-blank-lines)
    (delete-blank-lines)
    (open-line 1)
    (org-forward-sentence)
    (delete-horizontal-space)
    (open-line 2)
    (forward-char)
    (forward-char)
    (fill-paragraph)
    (forward-line -1)
    (delete-blank-lines)
    (delete-blank-lines)
    (open-line 1)
    (org-forward-element)))

(with-eval-after-load 'org
  (bind-key "C-^" #'reformat-paragraph-with-line-spacing org-mode-map))

(provide 'user-init-org)
