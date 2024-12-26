;; http://www.emacswiki.org/emacs/IndentingJava
;; (add-hook 'java-mode-hook (lambda ()
;;                                 (setq c-basic-offset 4
;;                                       tab-width 4
;;                                       indent-tabs-mode t)))

(add-hook 'java-mode-hook (lambda ()
                                (setq c-basic-offset 2
                                      tab-width 2
                                      indent-tabs-mode nil)))

(provide 'user-init-java)
