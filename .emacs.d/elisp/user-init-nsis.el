;; ------------------------------
;; nsis mode
;; ------------------------------
;; ;; nsis-mode works but its too darn slow..disabling
;; (if (eq system-type 'windows-nt) ; This slows down emacs too much on OSX
;;     (progn
;;       (add-to-list 'load-path "~/.emacs.d/elisp/nsis-mode")
;;       (autoload 'nsis-mode "nsis-mode" "NSIS mode" t)
;;       (setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Ii]\\)$" .
;;				       nsis-mode)) auto-mode-alist))
;;       (setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Hh]\\)$" .
;;				       nsis-mode)) auto-mode-alist))))
;; ;; ------------------------------

;; org-agenda-text-search-extra-files
;; http://orgmode.org/worg/org-tutorials/advanced-searching.html

;; Warning (initialization): An error occurred while loading `c:/cygwin/home/Administrator/.emacs':
;; Symbol's value as variable is void: org-directory
;; To ensure normal operation, you should investigate and remove the
;; cause of the error in your initialization file.  Start Emacs with
;; the `--debug-init' option to view a complete error backtrace.

(provide 'user-init-nsis)
