(ensure-package-installed 'php-mode)

(add-to-list 'load-path "~/.emacs.d/elisp/php-mode-1.5.0")
(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
(autoload 'php-mode "php-mode" "Enter PHP mode." t)

(setq tab-stop-list (number-sequence 8 120 8))

(add-hook 'php-mode-hook 'my-php-mode-hook)
(defun my-php-mode-hook ()
  (setq indent-tabs-mode t)
  (let ((my-tab-width 4))
    (setq tab-width my-tab-width)
    (setq c-basic-indent my-tab-width)
    (set (make-local-variable 'tab-stop-list)
         (number-sequence my-tab-width 200 my-tab-width))))
(setq-default c-basic-offset 4)

;; 4 spaces rather than tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-basic-indent 4)

(provide 'user-init-php)
