(ensure-package-installed 'org)

; With just a few keystrokes, it is possible to insert empty
; structural blocks, such as ‘#+BEGIN_SRC’ … ‘#+END_SRC’, or to wrap
; existing text in such a block. Enable it by customizing org-modules
; or add ‘(require 'org-tempo)’ to your Emacs init file.
(require 'org-tempo)

(setq initial-major-mode 'org-mode)
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

(with-eval-after-load 'org
  (bind-key "C-^" #'reformat-paragraph-with-line-spacing org-mode-map)
  (bind-key "M-C-^" #'reformat-paragraph-with-line-spacing-to-end-of-file org-mode-map))

(defun taylor-org-mode-wrap-block-in-example-markdown()
  "taylor-org-mode-wrap-block-in-example-markdown"
  (interactive)
  (progn
    (kill-region)
    (open-line)
    (self-insert-command)
    (indent-for-tab-command)
    (yank)
    (delete-blank-lines)
    (delete-blank-lines)
    (next-line)
    (open-line)
    (next-line)
    (previous-line)
    (delete-blank-lines)
    (delete-blank-lines)
    (open-line)
    (next-line)))

(provide 'user-init-org)
