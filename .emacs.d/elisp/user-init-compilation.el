(require 'compile)

;; ------------------------------
;; perl ack in compilation mode in emacs
;; ------------------------------

;; http://stackoverflow.com/questions/2322389/ack-does-not-work-when-run-from-grep-find-in-emacs-on-windows
(defvar ack-command "ack --nogroup --nocolor ")
(defvar ack-history nil)
(defvar ack-host-defaults-alist nil)

(defun ack ()
  "Like grep, but using ack-command as the default"
  (interactive)
  ;; Make sure grep has been initialized
  (if (>= emacs-major-version 22)
      (require 'grep)
    (require 'compile))
  ;; Close STDIN to keep ack from going into filter mode
  (let ((null-device (format "< %s" null-device))
	(grep-command ack-command)
	(grep-history ack-history)
	(grep-host-defaults-alist ack-host-defaults-alist))
    (call-interactively 'grep)
    (setq ack-history             grep-history
	  ack-host-defaults-alist grep-host-defaults-alist)))

;; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
(add-hook 'makefile-mode-hook
	  (lambda ()
	    (define-key makefile-mode-map (kbd "C-c u") 'compile)
	    (define-key makefile-mode-map (kbd "C-c i") 'recompile)))

;; compilation-scroll-output 'first-error ;; scroll automatically to follow the output as it comes in.
(setq-default compilation-always-kill t)

;; scroll automatically to follow the output as it comes in.
(setq-default compilation-scroll-output t )
(setq-default compilation-skip-threshold 0)
(setq-default compilation-auto-jump-to-first-error t)

;; http://www.mail-archive.com/emacs-pretest-bug@gnu.org/msg11407.html
;; (setq-default compilation-search-path "." )

;; see compilation-environment for info on how make deals with subprocess path
;; (describe-variable (quote compilation-environment))
;; (describe-variable (quote process-environment))

;; ;; gfortran 4.1:
;; (add-to-list 'compilation-error-regexp-alist
;;	     ;;  In file pfft3d.f90:182
;;              ;;
;;	     ;;           MPI_double_precision, &
;;	     ;;                              1
;;	     ;; Error: Symbol 'mpi_double_precision' at (1) has no IMPLICIT type
;;	     '(" *In file \\([^ :\n]*\\):\\([0-9]+\\)[ \t]*\n\n.*\n.*\n.*Error:.*\n" 1 2))
;; ;; NAGWare5 f95:
;; (add-to-list 'compilation-error-regexp-alist
;;	     ;; Error: mpi.F90, line 116: Implicit type for MPI_COMM_WORLD in MPI_MOD_INIT
;;	     ;;        detected at MPI_M@<end-of-statement>
;;	     ;; [f95 terminated - errors found by pass 1]
;;	     '("^Error: \\([^ ,\n]*\\), line \\([0-9]+\\):" 1 2))
;; (add-to-list 'compilation-error-regexp-alist
;;	     ;; Fatal Error: global.F90, line 25: Cannot find module MPI_M
;;              ;; detected at MPI_M@<end-of-statement>
;;	     '("^Fatal Error: \\([^ ,\n]*\\), line \\([0-9]+\\):" 1 2))

;; workaround see notes.txt for "messagebox"
(setq compilation-error-regexp-alist
      '(absoft
	ada
	aix
	ant
	bash
	borland
	caml
	comma
	edg-1
	edg-2
	epc
	ftnchek
	iar
	ibm
	irix
	java
	jikes-file
	jikes-line
	;; gnu
	gcc-include
	lcc
	makepp
	mips-1
	mips-2
	msft
	omake
	oracle
	perl
	php
	rxp
	sparc-pascal-file
	sparc-pascal-line
	sparc-pascal-example
	sun
	sun-ada
	watcom
	4bsd
	gcov-file
	gcov-header
	gcov-nomark
	gcov-called-line
	gcov-never-called
	perl--Pod::Checker
	perl--Test
	perl--Test2
	perl--Test::Harness
	weblint))

;; nsis
(add-to-list 'compilation-error-regexp-alist
	     '("^Error in script \"\\([^\"]*\\)\" on line \\([0-9]+\\)" 1 2))
;; unknown variable/constant "regname" detected, ignoring (PortableEncoder.nsi:201)
(add-to-list 'compilation-error-regexp-alist
	     '("unknown variable/constant.*\(\\([^:]*\\):\\([0-9]+\\)" 1 2))

;; this means hitting the compile button always saves the buffer
;; having to separately hit C-x C-s is a waste of time
(setq compilation-ask-about-save nil)

;; make the compile window stick at 12 lines tall
;; (setq compilation-window-height 12)

;; from enberg on #emacs
;; if the compilation has a zero exit code,
;; the windows disappears after two seconds
;; otherwise it stays
;; (setq compilation-finish-function
;;      (lambda (buf str)
;;        (unless (string-match "exited abnormally" str)
;;          ;;no errors, make the compilation window go away in a few seconds
;;          (run-at-time
;;           "2 sec" nil 'delete-windows-on
;;           (get-buffer-create "*compilation*"))
;;          (message "No Compilation Errors!"))))

(when (equal system-type 'darwin)
  (progn
    (add-to-list 'compilation-error-regexp-alist
		 '("^git_jump:\\(.*\\):\\([0-9]+\\)" 1 2))
    ))


;; http://stackoverflow.com/a/8311700/1495086
;; Helper for compilation. Close the compilation window if
;; there was no error at all. (emacs wiki)
(defun compilation-exit-autoclose (status code msg)
  ;; If M-x compile exists with a 0
  (when (and (eq status 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'compilation-exit-autoclose)

;; liveEncoderAutomate.scpt:1338:1339: script error: Expected "else", etc. but found unknown token. (-2741)
(add-to-list 'compilation-error-regexp-alist
	     '("^\\([^:]*\\):\\([0-9]+\\).* script error:" 1 2))

;; # PHP Fatal error:  Uncaught exception 'DOMException' with message 'Wrong Document Error' in /Users/demo/pdev/sfs/setup-sfssettings.php:22
(add-to-list 'compilation-error-regexp-alist
	     '("^PHP Fatal error: .* in \\(.*\\):\\([0-9]+\\)" 1 2))
(add-to-list 'compilation-error-regexp-alist
	     '("^Warning: .* in \\(.*\\) on line \\([0-9]+\\)" 1 2))
(add-to-list 'compilation-error-regexp-alist
	     '(".* fatal error: .* in \\(.*\\) on line \\([0-9]+\\)" 1 2))
(add-to-list 'compilation-error-regexp-alist
	     '("^PHP Notice: .* in \\(.*\\) on line \\([0-9]+\\)" 1 2))
(add-to-list 'compilation-error-regexp-alist
	     '("^PHP Warning: .* in \\(.*\\) on line \\([0-9]+\\)" 1 2))

;; http://praveen.kumar.in/2011/03/09/making-gnu-emacs-detect-custom-error-messages-a-maven-example/
(add-to-list 'compilation-error-regexp-alist 'maven)
(add-to-list 'compilation-error-regexp-alist-alist
	     '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
		     1 2 3))

;;  File "/Users/demo/pdev/check2000/SConstruct", line 30:
(add-to-list 'compilation-error-regexp-alist
	     '("^ +File .\\(.*\\)., line \\([0-9]+\\):" 1 2))

(add-to-list 'compilation-error-regexp-alist
	     '("^git_jump:\\(.*\\):\\([0-9]+\\)" 1 2))

(setq-default compilation-scroll-output t)

(provide 'user-init-compilation)
