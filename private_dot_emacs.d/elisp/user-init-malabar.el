;; ------------------------------
;; malabar mode for java/maven
;; ------------------------------
(if (file-directory-p "~/.emacs.d/elisp/malabar-mode/target/malabar-1.5-SNAPSHOT-dist/malabar-1.5-SNAPSHOT/lisp")
    (progn
      (add-to-list 'load-path "~/.emacs.d/elisp/malabar-mode/target/malabar-1.5-SNAPSHOT-dist/malabar-1.5-SNAPSHOT/lisp")
      ;; Or enable more if you wish
      (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
					global-semanticdb-minor-mode
					global-semantic-idle-summary-mode
					global-semantic-mru-bookmark-mode))
      (semantic-mode 1)
      ;;  (require 'malabar-mode)
      (setq malabar-groovy-lib-dir "~/.emacs.d/elisp/malabar-mode/target/malabar-1.5-SNAPSHOT-dist/malabar-1.5-SNAPSHOT/lib")

      (add-to-list 'auto-mode-alist '( "\\.[jJ][aA][vV][aA]\\'" . malabar-mode))

      (autoload 'malabar-mode
	"malabar-mode" "java in emacs using malabar mode" t)))
(add-hook 'malabar-mode-hook
	  (lambda ()
	    (add-hook 'after-save-hook 'malabar-compile-file-silently
		      nil t)))


(provide 'user-init-malabar)
