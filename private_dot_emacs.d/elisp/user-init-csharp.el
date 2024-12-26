;; ------------------------------
;; csharp-mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/download/csharp-mode.el

(add-to-list 'load-path "~/.emacs.d/elisp")
;; (add-to-list 'auto-mode-alist '("\\.cs?\\'" . csharp-mode))
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

;; Optionally, define and register a mode-hook function. To do so, use
;; something like this in your .emacs file:

(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  ;;   (turn-on-auto-revert-mode)
  ;;   (setq indent-tabs-mode nil)
  (require 'flymake)
  (flymake-mode 0)
  ;;   (require 'yasnippet)
  (yas/minor-mode-on)
  ;;   (require 'rfringe)
  ;;   ...insert more code here...
  ;;   ...including any custom key bindings you might want ...
  )
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(provide 'user-init-csharp)
