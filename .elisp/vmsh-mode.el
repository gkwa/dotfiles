;; vmsh-mode.el, version 0.2 
;; 
;; Author: Vivek Sharma (http://www.viveksharma.com) 
;; Provides: Major mode for editing MSH (Monad) scripts 
;; Last Updated: 1/08/2005 
;;
;; 01/05/2006 - v0.2 improved the syntax table 
;; 11/08/2006 - v0.1 first iteration of msh major mode 
;; 
;; TODO
;; - Indentation support  
;; - support here strings 
;; - C# class support 
;; - lots of other stuff


;; custom hooks 
(defvar vmsh-mode-hook nil)

;; default mode map, really simple 
(defvar vmsh-mode-map  
  (let ((vmsh-mode-map (make-keymap)))
    (define-key vmsh-mode-map "\t" 'vmsh-indent-line)
    vmsh-mode-map)
  "Keymap for MSH major mode")

(add-to-list 'auto-mode-alist '("\\.msh\\'" . vmsh-mode))


;; only defined one keyword list right now 
(defconst vmsh-font-lock-keywords-3
  (list
   '("\\<\\(d\\(?:o\\|efault\\)\\|else\\|f\\(?:oreach\\|unction\\)\\|if\\|switch\\|t\\(?:hrow\\|rap\\)\\|w\\(?:here\\|hile\\)\\)\\>" . font-lock-keyword-face)
   '("$[a-zA-Z0-9_\\.:{}]+\\>" . font-lock-variable-name-face)
   '("\\<\\w+-\\w+\\>" . font-lock-function-name-face)
   '("\\<-\\w+\\>" . font-lock-builtin-face)
   '("@'[A-z0-9\n\t ]+'@" . font-lock-string-face)
   '("@\"[A-z0-9\n\t ]+\"@" . font-lock-string-face)
   '("\\(-\\)\\([a-z][a-zA-Z0-9]+\\)" . font-lock-type-face)) 
  "Maximum highlighting for MSH major mode")

(defvar vmsh-font-lock-keywords vmsh-font-lock-keywords-3
  "Maximum highlighting for MSH major mode")

;; is adding punctuation to word syntax appropriate?? 
(defvar vmsh-mode-syntax-table
  (let ((vmsh-mode-syntax-table (make-syntax-table)))
   (modify-syntax-entry ?. "_" vmsh-mode-syntax-table)
   (modify-syntax-entry ?: "_" vmsh-mode-syntax-table)
   (modify-syntax-entry ?{ "(" vmsh-mode-syntax-table)
   (modify-syntax-entry ?} ")" vmsh-mode-syntax-table)
   (modify-syntax-entry ?[ "(" vmsh-mode-syntax-table)
   (modify-syntax-entry ?] ")" vmsh-mode-syntax-table)
   (modify-syntax-entry ?( "(" vmsh-mode-syntax-table)
   (modify-syntax-entry ?) ")" vmsh-mode-syntax-table)
   (modify-syntax-entry ?` "\\" vmsh-mode-syntax-table)
   (modify-syntax-entry ?_ "w" vmsh-mode-syntax-table)
   (modify-syntax-entry ?# "<" vmsh-mode-syntax-table)
   (modify-syntax-entry ?\n ">" vmsh-mode-syntax-table)
   (modify-syntax-entry ?' "\"" vmsh-mode-syntax-table)
    vmsh-mode-syntax-table)
  "Syntax for MSH major mode")

(defun vmsh-mode ()
  "Major mode for editing MSH files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table vmsh-mode-syntax-table)
  (use-local-map vmsh-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(vmsh-font-lock-keywords))

  (make-local-variable 'compile-command)
  (setq compile-command (format "msh -noprofile -nologo -command %s"
			 (expand-file-name buffer-file-name)))

  (setq major-mode 'vmsh-mode)
  (setq mode-name "MSH")
  (run-hooks 'vmsh-mode-hook))

(provide 'vmsh-mode)




