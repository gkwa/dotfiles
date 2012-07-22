;; this changes the value of the default-directory variable so that
;; the next dired will point you here
(add-to-list 'load-path "~/.elisp")

(find-file "~/notes.txt" t)

(cd "~/")
;; (setq Info-directory-list (cons (expand-file-name "~/.info") Info-default-directory-list))

;; ------------------------------
;; backup-dir
;; ------------------------------
					; http://www.emacswiki.org/cgi-bin/wiki?BackupDirectory
(require 'backup-dir)
;; localize it for safety.
(make-variable-buffer-local 'backup-inhibited)
(if (not (file-directory-p "~/.emacs.d")) (make-directory "~/.emacs.d"))
(if (not (file-directory-p "~/.emacs.d/backups")) (make-directory "~/.emacs.d/backups"))
(setq bkup-backup-directory-info '((t "~/.emacs.d/backups" ok-create full-path prepend-name)))
(setq delete-old-versions t
      kept-old-versions 1
      kept-new-versions 3
      version-control t)


(show-paren-mode 1); http://www.netexpertise.eu/en/misc/emacs-configuration.html


;; don't ask about killing subprocesses when killing emacs, just kill
;; off all children without question
;; http://stackoverflow.com/questions/2706527/make-emacs-stop-asking-active-processes-exist-kill-them-and-exit-anyway
(add-hook 'comint-exec-hook
      (lambda () (process-kill-without-query (get-buffer-process (current-buffer)))))


(require 'autoinsert) ;; leave this before any setting to variable auto-insert-alist

;; Tell Emacs to find the definition for the function caml-mode by
;; loading a Lisp library named caml (i.e. a file caml.elc or
;; caml.el):
(autoload 'css-mode "css-mode")
(autoload 'javascript-mode "javascript" nil t)
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(autoload 'caml-mode "caml" "Major mode for editing Caml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(autoload 'git "git" "Git-mode" t)

(add-to-list 'load-path "~/.elisp/psgml-1.2.5")	;; http://www.lysator.liu.se/~lenst/about_psgml/psgml.html

;; This mode seems too slow and I've not used it's functionality
;; (autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;; (autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

(setq auto-mode-case-fold t)
(add-to-list 'auto-mode-alist '( "\\.lsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.wiki\\'" . wikipedia-mode))
(add-to-list 'auto-mode-alist '("\\.scm\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.lsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode)); I'm not really using this mode and it slows things down when openning a xml file.
(add-to-list 'auto-mode-alist '("\\.\\(xml\\)\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt?\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rng\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.mlip]?\\'" . caml-mode))
(add-to-list 'auto-mode-alist '("\\.au3\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.\\'" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.css" . css-mode))
(add-to-list 'auto-mode-alist '("\\.gz\\(~\\|\\.~0]+~\\)?\\'" nil jka-compr))
(add-to-list 'auto-mode-alist '("\\.bz2\\'" nil jka-compr))
(add-to-list 'auto-mode-alist '("\\.tgz\\'" . tar-mode))

;; from nxml-mode/README
;; If you edit XML using iso-8859-N encodings other than iso-8859-1 and
;; you are running Emacs 21.3 or later, then I recommend enabling
;; unify-8859-on-decoding-mode, by adding
;;   (unify-8859-on-decoding-mode)
;; to you .emacs.
(unify-8859-on-decoding-mode); nxml-mode suggested adding this

(set-foreground-color "white")
(set-background-color "black")
(set-cursor-color "red")

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)




;; http://sigquit.wordpress.com/2008/09/28/single-dot-emacs-file/
(defun system-is-my-personal-laptop ()
  (interactive)
  "Return true if the system we are running on is"
  (string-equal system-name "Taylor-Monacellis-MacBook-Pro.local"))

(defun system-is-work-desktop ()
  (interactive)
  "Return true if the system we are running on work desktop"
  (string-equal system-name "demos-imac.streambox.com"))

(defun system-is-i5-laptop ()
  (interactive)
  "Return true if the system we are running on is my PC at work"
  (string-equal system-name "demos-MacBook-Pro.local"))

(defun system-is-win7-desktop1 ()
  (interactive)
  "Return true if the system we are running on is my PC at work"
  (string-equal system-name "DEMO-PC"))

(if (and
     (not (equal window-system nil))
     (or (system-is-my-personal-laptop)
	 (system-is-i5-laptop)
	 (system-is-win7-desktop1)
	 ))
    (progn
      (setq screen-height (x-display-pixel-height))
      (setq screen-width (x-display-pixel-width))
      (if (<= screen-height 768)
	  (progn
	    (set-frame-height (selected-frame) 40)
	    (set-frame-width (selected-frame) 100))
	(progn
	  (set-frame-height (selected-frame) 200)
	  (set-frame-width (selected-frame) 150)))))

;; (if (equal window-system nil)
;;     (shell nil))

;; Pgup/dn will return exactly to the starting point.
(setq scroll-preserve-screen-position 1)

;; turn off the toolbar
;;disable menu, toolbar and scrollbar
;;for X, use ~/.Xdefaults
;;for console emacs
(if (>= emacs-major-version 21)
    (progn
      (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
      (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
      (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))))

;; This is failing on W32 cause emacs can't find eshell-auto, but M-x eshell works fine.  What is eshell-auto?
;; ;; use eshell
;; (load "eshell-auto")
;; (setq eshell-cmpl-cycle-completions -1)




;; http://www.koders.com/lisp/fidE8CF96D104A21B9A8CECAE4340C8A565446B5EBE.aspx?s=TV+Raman

;; (add-hook 'text-mode-hook         '(lambda () (auto-fill-mode 1) (setq fill-column 72)))
(add-hook 'visual-basic-mode-hook '(lambda () (auto-fill-mode 1) (setq fill-column 72)))
(add-hook 'sh-mode-hook           '(lambda () (auto-fill-mode 1) (setq fill-column 72)))

;; --------------------------------------------------
;; Inserting a header automatically
;; http://www.bigwebmaster.com/General/Howtos/LinuxDoc+Emacs+Ispell-HOWTO-6.html

(add-hook 'find-file-hooks 'auto-insert)

(add-hook 'autoinsert-load-hook
	  '(lambda ()
	     (add-to-list 'auto-insert-alist
			  '(
			    ;; the following need an interpreter
			    ((sh-mode . "Script Mode") . (concat "#!/bin/sh\n" comment-start "-*- sh -*-\n\n\n" ))
			    ((visual-basic-mode . "Visual Basic Mode") . (concat comment-start "-*- visual-basic -*-\n\n\n" ))
			    ((sql-mode . "Sql Mode") . (concat comment-start " -*- sql -*-\n\n\n" ))
			    ((javascript-mode . "Javascript Mode") . (concat comment-start "-*- javascript -*-\n\n\n" ))
			    ((caml-mode . "Caml Mode") . (concat comment-start "-*- caml -*-\n\n\n" ))
			    ((css-mode . "CSS Mode") . (concat comment-start " Last modified $Id$" comment-end "\n" comment-start " $HeadURL$" comment-end "\n\n\n" ))
			    ))))

;; --------------------------------------------------

;; Mode specific key bindings


;; ;; C-c C-n t for sgml mode
;; (add-hook 'sgml-mode-hook
;;	  '(lambda () (define-key sgml-mode-map "\C-c\C-nt" 'tidy-buffer-xml )
;;	     ;;		     (define-key texinfo-mode-map "\C-cn"
;;	     ;;		       'forward-paragraph)
;;	     ))

;; --------------------------------------------------

;; global key sets






;; C-c i calls insert-date-string
(global-set-key (kbd "C-c i") 'insert-date-string)



;; resize man page to take up whole screen
(setq Man-notify 'bully)


(if (eq system-type 'windows-nt)
    (progn
      (setq explicit-shell-file-name "c:/cygwin/bin/bash.exe")
;;      (add-to-list 'Info-directory-list "c:/cygwin/usr/share/info")
      (require 'cygwin-mount)
      (cygwin-mount-activate)

      ; http://blogs.law.harvard.edu/hoanga/2008/04/10/fixing-that-really-irritating-perl-warning-setting-locale-failed-on/
      ; this error happens in emacs subshells when using 'git commit' unless you have set LC_ALL and LC_CTYPE.
      ; this error (below) is fixed by setting LC_ALL and LC_CTYPE.
      ; This doesn't happen in cygwin bash conseole, but only in emacs
      ; bash subshell.
;; + perl -i.bak -pe 's{exec git-update-server-info}{exec git update-server-info}' hooks/post-update
;; perl: warning: Setting locale failed.
;; perl: warning: Please check that your locale settings:
;;	LC_ALL = (unset),
;;	LANG = "ENU"
;;     are supported and installed on your system.
;; perl: warning: Falling back to the standard locale ("C").
;; + git update-server-info
      ;; (setenv "LC_CTYPE" (getenv "LC_CTYPE"))
      ;; (setenv "LC_ALL" (getenv "LC_ALL"))
      (setenv "LC_CTYPE" "en_US.UTF-8")
      (setenv "LC_ALL" "en_US.UTF-8")
      ; (setenv "CYGWIN" "binmode tty ntsec"); binmode, tty and ntsecare obsolete as of cygwin v1.7 http://cygwin.com/cygwin-ug-net/using-cygwinenv.html
;      (add-hook 'after-init-hook '(lambda () (w32-send-sys-command ?\xf030))) ;; maximize on startup, http://www.emacswiki.org/emacs/FrameSize#toc2
      ))

;; setup env path for subprocesses
;; http://us.generation-nt.com/answer/emacs-compilation-path-help-173905301.html
(when (equal system-type 'darwin)
  (progn
    (add-to-list 'exec-path '"/opt/local/bin")
    (add-to-list 'exec-path '"/usr/local/bin")
    (setenv "PATH" (concat "/opt/local/bin" ":" (getenv "PATH"))) ; added this next line due to problems in compilation-environment
    (custom-set-variables
     '(ispell-program-name "/opt/local/bin/aspell")) ; macport aspell
    ;;      (require 'w3m-load) ; available through macports (sudo port install emacs-w3m)
    ;; http://docs.freebsd.org/info/texinfo/texinfo.info.Other_Info_Directories.html
    ;; (add-to-list 'Info-directory-list "/opt/local/share/info")
    ;; (add-to-list 'Info-directory-list "/Applications/MacPorts/Emacs.app/Contents/Resources/info")
    ;; (add-to-list 'Info-directory-list "/opt/local/var/macports/software/gcc43/4.3.4_0/opt/local/share/gcc43/info")
    ;; (add-to-list 'Info-directory-list "/Applications/Aquamacs.app/Contents/Resources/info")
    ;; (add-to-list 'Info-directory-list "/Applications/Aquamacs.app/Contents/Resources/site-lisp/edit-modes/info")
    ;; (add-to-list 'Info-directory-list "/Applications/Emacs.app/Contents/Resources/extra/info")
    ;; (add-to-list 'Info-directory-list "/Applications/Emacs.app/Contents/Resources/info")
    ;; (add-to-list 'Info-directory-list "/opt/local/share/info")
    ;; (add-to-list 'Info-directory-list "/opt/local/share/gcc43/info")
    ;; (add-to-list 'Info-directory-list "/opt/local/share/info")
    ;; (add-to-list 'Info-directory-list "/opt/local/var/macports/software/gcc43/4.3.4_0/opt/local/share/gcc43/info")
    ;; (add-to-list 'Info-directory-list "/usr/share/info")

    (add-to-list 'load-path "/opt/local/var/macports/software/git-core/1.7.1_0+doc+svn/opt/local/share/doc/git-core/contrib/emacs")
    (add-to-list 'load-path "/opt/local/var/macports/software/emacs-app/23.2_0/Applications/MacPorts/Emacs.app/Contents/Resources/lisp/international")
    (add-to-list 'load-path "/opt/local/var/macports/software/emacs-app/23.2_0/Applications/MacPorts/Emacs.app/Contents/Resources/lisp")
    ))

;; Change the default eshell prompt
(setq eshell-prompt-function
      (lambda ()

	;; This special form is like `let', but it binds each variable
	;; right after computing its local value, before computing the
	;; local value for the next variable.  Therefore, an expression
	;; in BINDINGS can reasonably refer to the preceding symbols
	;; bound in this `let*' form.  Compare the following example
	;; with the example above for `let'.

	(let* ((prompt (eshell/pwd))
	       (tmp (string-match "/[^:/\\]*$" prompt)))
	  (concat
	   (substring prompt (+ tmp 1) (length prompt))

	   ;; Be careful about removing the following concatination!  I
	   ;; spent an hour trying to figure this one out.  Without
	   ;; either a hash or $ you will end up with  "Not Found" error
	   ;; messages in the Eshell window when you do
	   ;; eshell-previous-matching-input-from-input (most likely
	   ;; bound to M-p.  M-x customize-group <RET> eshell-prompt
	   ;; will give you more clues about the Eshell Prompt Regexp

	   " # "))))

(setenv "PS1" "\\u@\h \\W$ ")

;;http://www.emacswiki.org/cgi-bin/wiki/McMahanDotEmacs
;;; set the term to avoid ansi garbage in shell mode
;(setenv "TERM" "emacs")

;;; Commands added by calc-private-autoloads on Sat Mar 14 15:01:33 2009.
(autoload 'calc-dispatch	   "calc" "Calculator Options" t)
(autoload 'full-calc		   "calc" "Full-screen Calculator" t)
(autoload 'full-calc-keypad	   "calc" "Full-screen X Calculator" t)
(autoload 'calc-eval		   "calc" "Use Calculator from Lisp")
(autoload 'defmath		   "calc" nil t t)
(autoload 'calc			   "calc" "Calculator Mode" t)
(autoload 'quick-calc		   "calc" "Quick Calculator" t)
(autoload 'calc-keypad		   "calc" "X windows Calculator" t)
(autoload 'calc-embedded	   "calc" "Use Calc inside any buffer" t)
(autoload 'calc-embedded-activate  "calc" "Activate =>'s in buffer" t)
(autoload 'calc-grab-region	   "calc" "Grab region of Calc data" t)
(autoload 'calc-grab-rectangle	   "calc" "Grab rectangle of data" t)
(global-set-key "\e#" 'calc-dispatch)

;;; End of Calc autoloads.


;; ;; svn export https://svn.r-project.org/ESS/trunk ~/.elisp/ess
;; (if (file-directory-p "~/.elisp/ess")
;;     (progn
;;       (add-to-list 'load-path "~/.elisp/ess")
;;       (require 'ess-site)))






;; --------------------------------------------------
;; emacs server setup
;; --------------------------------------------------
;;http://www.emacswiki.org/emacs-en/emacsd
;; only start emacs server when it's not started, I hate warnings.
;; http://www.emacswiki.org/emacs/download/EmacsdInitScript

;; (if (>= (string-to-number emacs-version) 22)
;;     (progn
;;       (setq server-socket-file "/tmp/emacs1000/server")
;;       (unless (file-exists-p server-socket-file)
;;	(server-start)
;; )))

;; (server-start)

;; So emacs won't try to start the server again.

;; This function may be useful if you are always in a client. I bind it
;; to C-c q. So I don't need to use C-x # or C-x 5 0 any more.

(defun exit-emacs-client ()
  "consistent exit emacsclient.
if not in emacs client, echo a message in minibuffer, don't exit emacs.
if in server mode
and editing file, do C-x # server-edit
else do C-x 5 0 delete-frame"
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (delete-frame)))
(global-set-key (kbd "C-c q") 'exit-emacs-client)



;; ------------------------------
;; setup emacsclient frame dimensions and color
;; ------------------------------

;; http://www.emacswiki.org/emacs/SettingFrameColorsForEmacsClient

(defun setup-window-system-frame-colours (&rest frame)
  (if window-system
      (let ((f (if (car frame)
		   (car frame)
		 (selected-frame))))
	(progn
	  (set-frame-font "Bera Sans Mono-11")
	  (set-face-background 'default "#232F2F" f)
	  (set-face-foreground 'default "#FFFFFF" f)
	  (set-face-background 'fringe  "#000000" f)
	  (set-face-background 'cursor "#ff7f00" f)
	  (set-face-background 'mode-line "#2F4F4F" f)
	  (set-face-foreground 'mode-line "#BCBf91" f)))))

(defun setup-window-system-frame-dimensions (&rest frame)
  (if window-system
      (let ((f (if (car frame)
		   (car frame)
		 (selected-frame))))
	(progn
	  (maximize-frame (quote both))))))


(setq server-mode t)
(setq server-name "emacs1000")
(setq server-use-tcp t)

(require 'server)
(defadvice server-create-window-system-frame
  (after set-window-system-frame-colours ())
  "Set custom frame colours when creating the first frame on a display"
  (message "Running after frame-initialize")
  (setup-window-system-frame-colours))
(ad-activate 'server-create-window-system-frame)
(add-hook 'after-make-frame-functions 'setup-window-system-frame-colours t)
(add-hook 'after-make-frame-functions 'setup-window-system-frame-dimensions t)

;; http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
(when (and (= emacs-major-version 23)
	   (= emacs-minor-version 1)
	   (equal window-system 'w32))
  (setq w32-get-true-file-attributes nil))

(require 'server)
(when (and (eq window-system 'w32) (file-exists-p (getenv "APPDATA")))
  (setq server-auth-dir (concat (getenv "APPDATA") "/.emacs.d/server"))
  (setq parent-server-auth-dir (concat (getenv "APPDATA") "/.emacs.d"))
  (if (not (file-directory-p server-auth-dir))
      (make-directory server-auth-dir t)))

;; --------------------------------------------------
;; given some path such as  \\10.0.2.10\Production\Streambox\...\StreamboxOSX3.72b32.zip
;; toggle it between UNC/wiki/Mac format
;; \\10.0.2.10\Production\Streambox\...\StreamboxOSX3.72b32.zip
;; /Volumes/Production/Streambox/.../StreamboxOSX3.72b32.zip
;; [file://///10.0.2.10/Production/Streambox/.../StreamboxOSX3.72b32.zip \\10.0.2.10\Production\Streambox\...\StreamboxOSX3.72b32.zip]
;; --------------------------------------------------

(defun flipunc ()
  (interactive)
  (save-excursion
    (save-restriction
      (progn
	(back-to-indentation)
	(setq bor (point))
	(end-of-line)
	(setq eol (point))
	(narrow-to-region bor eol)
	(back-to-indentation)
	(if (looking-at "^/Volumes")
	    (progn
	      (replace-string "/Volumes" "\\\\10.0.2.10") (goto-char 0)
	      (replace-string "/" "\\") )
	  (if (looking-at "^\\\\")
	      (progn
		(let ((fullpath (buffer-string)))
		  (end-of-line)
		  (delete-horizontal-space) (insert-char ?\  1)
		  (let ((cp (point)))
		    (insert fullpath)
		    (delete-horizontal-space)            (goto-char cp)
		    (replace-string "\\\\" "file://///") (goto-char cp)
		    (replace-string "\\" "/")            (goto-char cp)
		    (replace-string " " "\%20")          (goto-char cp)
		    (goto-char 0)
		    (insert "[") (goto-char (point-max))
		    (transpose-regions (+ (point-min) 1) (- cp 1) (+ 1 cp) (- (point-max) 1))
		    (insert "]")
		    )))
	    (if (looking-at "^ *\\[file://///10.0.2.10/")
		(progn
		  (goto-char (- (point-max) 1))
		  (delete-char 1)
		  (beginning-of-line) (delete-char 1)
		  (let ((sp (search-forward " ")))
		    (delete-region (point-min) sp)
		    (beginning-of-line) (replace-string "\\\\10.0.2.10" "http://10.0.2.10")
		    (beginning-of-line) (replace-string "\\" "/")
		    (beginning-of-line) (replace-string " " "%20")
		    )
		  )
	      (if (looking-at "^ *http://10.0.2.10")
		  (progn
		    (beginning-of-line) (replace-string "http://10.0.2.10" "//10.0.2.10")
		    (beginning-of-line) (replace-string "%20" " ")
		    )
		(if (looking-at "^ *//10.0.2.10")
		    (progn
		      (beginning-of-line) ; rem, we've already narrowed to line above
		      (replace-string "//10.0.2.10" "http://dl.dropbox.com/u/9140609") ;; taylor's public dropbox folder
		      )
		  (if (looking-at "http://dl.dropbox.com/u/9140609")
		      (progn
			(beginning-of-line)
			(replace-string "http://dl.dropbox.com/u/9140609" "/Volumes")
			)
		      ))))))))))

(global-set-key "w" (quote flipunc))

(defun capture_full_path ()
  (interactive)
  (save-excursion
    (save-restriction
      (progn
	(let ((cp (point)))
	  (end-of-line)
	  (let ((fullpath
		 (concat
		  (expand-file-name dired-directory)
		  (buffer-substring cp (point)))))
	    (message "%s" fullpath)
	    (kill-new fullpath)
	    ))))))

(global-set-key "g" (quote capture_full_path))


;; --------------------------------------------------
;; I believe custom vars should appear last to overwrite factory default values...I think.
;; --------------------------------------------------
(setq-default
 default-major-mode 'org-mode ;; set default mode
 ;; default-major-mode 'emacs-lisp-mode	;; Silly "Fundamental"
 initial-major-mode 'org-mode ;; set default mode
 default-fill-column 72
 compilation-scroll-output t ; scroll automatically to follow the output as it comes in.
 enable-recursive-minibuffers t
 visible-bell t				;; Turns off audible bell
 inhibit-startup-message t ;; - http://www.gnu.org/software/emacs/manual/html_node/Init-Examples.html
 column-number-mode t
 display-buffer-reuse-frames t ; http://www.cs.cmu.edu/cgi-bin/info2www?%28emacs%29Select%20Buffer
 delete-by-moving-to-trash t
 frame-title-format "emacs - %b"
 diary-file (expand-file-name "~/.diary")
)








(fset 'yes-or-no-p 'y-or-n-p) ;; Make all "yes or no" prompts show "y or n" instead
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-mode-case-fold t)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(compilation-error-regexp-alist (quote (("^?:[	]+at com.mycompany.+(\\([^()
]+\\):\\([0-9]+\\))$" 2 3) ("^\\[ERROR\\].+
\\(.*\\):.\\([0-9]+\\)" 1 2) ("^git_jump:\\(.*\\):\\([0-9]+\\):" 1 2))))
 '(compile-command "make -k ")
 '(delete-by-moving-to-trash t)
 '(diary-file (expand-file-name "~/.diary"))
 '(display-time-mode t nil (time))
 '(eshell-prompt-function (lambda nil (let* ((prompt (eshell/pwd)) (tmp (string-match "/[^:/\\]*$" prompt))) (concat (substring prompt (+ tmp 1) (length prompt)) " "))) t)
 '(ffap-machine-p-known (quote reject))
 '(frame-title-format "emacs - %b" t)
 '(global-font-lock-mode t)
 '(ido-case-fold t)
 '(ispell-program-name "aspell")
 '(menu-bar-mode nil)
 '(mode-line-inverse-video nil)
 '(nxml-slash-auto-complete-flag t)
 '(recentf-max-menu-items 100)
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values (quote ((lexical-binding . t) (sgml-tag-region-if-active . t) (sgml-shorttag . t) (sgml-parent-document "Bugzilla-Guide.xml" "book" "chapter") (sgml-omittag . t) (sgml-namecase-general . t) (sgml-minimize-attributes) (sgml-local-ecat-files) (sgml-local-catalogs) (sgml-indent-step . 2) (sgml-indent-data . t) (sgml-general-insert-case . lower) (sgml-exposed-tags) (sgml-balanced-tag-edit . t) (sgml-auto-insert-required-elements . t) (sgml-always-quote-attributes . t) (TeX-master . t))))
 '(scroll-bar-mode nil)
 '(split-height-threshold nil)
 '(split-width-threshold 0)
 '(tab-stop-list (quote (2 4 6 8 10 12 56 64 72 80 88 96 104 112 120)))
 '(truncate-lines t))

(global-set-key (kbd "C-c C-c") (quote comment-region))
(global-set-key (kbd "C-c m") (quote manual-entry))

;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10963543.html
;; Add directories to recentf list and then assuming you're using
;; anything-sources, then anything-c-source-recentf will bring up past
;; directories.
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key "f" (quote find-dired))
	    (when recentf-mode
	      (recentf-add-file default-directory))))



;(define-key global-map "\C-xj" 'rename-uniquely)
(global-set-key (kbd "C-c j") 'rename-uniquely)

;; ;; ------------------------------
;; ;; breadcrumb
;; ;; ------------------------------
;;
;; use bookmarksplus until I can get the hang of a bookmarks manager and
;; then consider breadcrumb
;;
;; (setq load-path (append (list (expand-file-name "~/.elisp")) load-path))
;; (require 'breadcrumb)
;; (custom-set-variables
;;  '(bc-bookmark-limit 100)
;; )
;; (global-set-key (kbd "S-SPC")           'bc-set)            ;; Shift-SPACE for set bookmark
;; (global-set-key [(meta j)]              'bc-previous)       ;; M-j for jump to previous
;; (global-set-key [(shift meta j)]        'bc-next)           ;; Shift-M-j for jump to next
;; ;; doesn't wurk: (global-set-key (kbd "M-J")             'bc-next)           ;; Shift-M-j for jump to next
;; (global-set-key [(meta up)]             'bc-local-previous) ;; M-up-arrow for local previous
;; (global-set-key [(meta down)]           'bc-local-next)     ;; M-down-arrow for local next
;; (global-set-key [(control c)(j)]        'bc-goto-current)   ;; C-c j for jump to current bookmark
;; (global-set-key [(control x)(meta j)]   'bc-list)           ;; C-x M-j for the bookmark menu list


;; ------------------------------
;; perl-mode
;; ------------------------------
(add-to-list 'auto-mode-alist '("\\.pm\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pl\\'" . perl-mode))
(add-to-list 'auto-insert-alist '((perl-mode . "Perl Mode") . (concat comment-start "-*- perl -*-\n\n" )))

;; ------------------------------
;; wikipedia-mode
;; ------------------------------
(autoload 'wikipedia-mode
  "wikipedia-mode.el"
  "Major mode for editing documents in Wikipedia markup." t)
(autoload 'wikipedia-mode "wikipedia-mode.el" "Major mode for editing documents in Wikipedia markup." t)

;; ------------------------------
;; google fun stuff
;; ------------------------------
(require 'google-search)
(require 'google-define)
(define-key global-map "\C-cd" 'google-define)
(define-key global-map "\C-cs" 'google-search-selection)

;; ------------------------------
;; magit-mode
;; ------------------------------
;; http://psung.blogspot.com/2008/12/magit.html
;; http://zagadka.vm.bytemark.co.uk/magit/magit.html
(add-to-list 'load-path (expand-file-name "~/.elisp/magit"))
(autoload 'magit-status "magit" nil t)
(when (equal system-type 'darwin)
  (progn
    (custom-set-variables
     '(magit-git-executable "/opt/local/bin/git"))))
(global-set-key "g" (quote magit-status))
;; (global-set-key "\C-ci" 'magit-status)

;; change magit diff colors
;; http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors/
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(set-variable (quote magit-log-auto-more) t nil); pull more logs when reach end of page
;; ------------------------------
;; xquery-mode
;; ------------------------------
(autoload 'xquery-mode "xquery-mode" "major mode for editing Xquery source." t)
(add-to-list 'auto-mode-alist '("\\.xqlib\\'" . xquery-mode))
(add-to-list 'auto-mode-alist '("\\.xq\\'" . xquery-mode))

;; ------------------------------
;; malabar mode for java/maven
;; ------------------------------
(if (file-directory-p "~/.elisp/malabar-mode/target/malabar-1.5-SNAPSHOT-dist/malabar-1.5-SNAPSHOT/lisp")
    (progn
      (add-to-list 'load-path "~/.elisp/malabar-mode/target/malabar-1.5-SNAPSHOT-dist/malabar-1.5-SNAPSHOT/lisp")
      ;; Or enable more if you wish
      (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
					global-semanticdb-minor-mode
					global-semantic-idle-summary-mode
					global-semantic-mru-bookmark-mode))
      (semantic-mode 1)
      ;;  (require 'malabar-mode)
      (setq malabar-groovy-lib-dir "~/.elisp/malabar-mode/target/malabar-1.5-SNAPSHOT-dist/malabar-1.5-SNAPSHOT/lib")

      (add-to-list 'auto-mode-alist '( "\\.[jJ][aA][vV][aA]\\'" . malabar-mode))

      (autoload 'malabar-mode
	"malabar-mode" "java in emacs using malabar mode" t)))
(add-hook 'malabar-mode-hook
	  (lambda ()
	    (add-hook 'after-save-hook 'malabar-compile-file-silently
		      nil t)))

;; ------------------------------
;; html-helper-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/html-helper-mode")
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;   to invoke html-helper-mode automatically on .html files, do this:
;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-helper-mode))

(add-to-list 'auto-insert-alist '((html-helper-mode . "Yay HTML") . (concat comment-start " Last modified $Id$" comment-end "\n" comment-start " $HeadURL$" comment-end "\n\n\n" )))
(add-hook 'html-helper-mode-hook  '(lambda () (auto-fill-mode 1) (setq fill-column 60)))

;; C-c C-n t for HTML mode
(add-hook 'html-helper-mode-hook
	  '(lambda ()
	     (define-key html-helper-mode-map "\C-c\C-nt"
	       'tidy-buffer-xhtml)
	     ;;		     (define-key texinfo-mode-map "\C-cn"
	     ;;		       'forward-paragraph)
	     )
	  )

;; ;; ------------------------------
;; ;; ffap key rebindings
;; ;; ------------------------------
;; ;; find file at point
;; (require 'ffap)
;; ;; rebind C-x C-f and others to the ffap bindings (see variable ffap-bindings)
;; (ffap-bindings)
;; ;; C-u C-x C-f finds the file at point
;; (setq ffap-require-prefix t)
;; ;; browse urls at point via w3m
;; ;; (setq ffap-url-fetcher 'w3m-browse-url)



;; ------------------------------
;; yasnippet
;; ------------------------------
;; cd ~; svn export http://yasnippet.googlecode.com/svn/trunk/ .elisp/yasnippet-read-only
(add-to-list 'load-path "~/.elisp/yasnippet-read-only")
(add-to-list 'load-path "~/.elisp/yasnippet-read-only/snippets")

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.elisp/yasnippet-read-only/snippets")
(yas/load-directory "~/.elisp/yasnippet-org-mode")

;; ------------------------------
;; multi-term mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/MultiTerm
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; http://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings))

;; this might work great, I just don't have time to play with this now
;; ;; ------------------------------
;; ;; org-crypt
;; ;; ------------------------------
;; ;; http://doc.norang.ca/org-mode.html#HandlingEncryption
;; (require 'org-crypt)
;;					; Encrypt all entries before saving
;; (org-crypt-use-before-save-magic)
;; (setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;					; GPG key to use for encryption
;; (setq org-crypt-key "F0B66B40")


;; ------------------------------
;; recentf-mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/RecentFiles
(autoload 'recentf "RecentF" "Enter recentf mode." t)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(setq recentf-max-saved-items 100)
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; ------------------------------
;; bat-mode
;; ------------------------------
(autoload 'bat-mode "bat-mode" "DOS and WIndows BAT files" t)
(add-to-list 'auto-mode-alist '("\\.[sS][cC][pP][tT]\\'" . bat-mode))
(add-to-list 'auto-mode-alist '("\\.[cC][mM][dD]\\'" . bat-mode))
(add-to-list 'auto-mode-alist '("\\.[bB][aA][tT]\\'" . bat-mode))
(add-to-list 'auto-mode-alist '("CONFIG\\." . bat-mode))
(add-to-list 'auto-mode-alist '("AUTOEXEC\\." . bat-mode))

(add-hook 'bat-mode-hook
	  '(lambda ()
	     (auto-fill-mode 0)
	     (setq fill-column 72)
	     ))
(add-to-list 'auto-insert-alist '((bat-mode . "Bat Mode") . (concat comment-start "-*- bat -*-\n" "@Echo off\n\n\n")))


;; ;; ------------------------------
;; ;; ledger
;; ;; ------------------------------
;; (if (eq system-type 'darwin)
;;     (progn
;;       (require 'ledger)
;;       (setq ledger-binary-path "/opt/local/bin/ledger")
;;       ;; ;; http://sachachua.com/blog/2010/11/emacs-recording-ledger-entries-with-org-capture-templates/
;;       ;; (setq org-capture-templates
;;       ;;       (append '(("l" "Ledger entries")
;;       ;;                 ("lm" "MBNA" plain
;;       ;;                  (file "~/ledger")
;;       ;;                  "%(org-read-date) %^{Payee}
;;       ;;   Liabilities:MBNA
;;       ;;   Expenses:%^{Account}  %^{Amount}
;;       ;; ")
;;       ;;                 ("lc" "Cash" plain
;;       ;;		 (file "~/ledger")
;;       ;;		 "%(org-read-date) * %^{Payee}
;;       ;;   Expenses:Cash
;;       ;;   Expenses:%^{Account}  %^{Amount}
;;       ;; "))
;;       ;;	      org-capture-templates))
;;       ))



;; ------------------------------
;; easypg
;; ------------------------------
;; http://www.emacswiki.org/emacs/EasyPG
;; wget -P ~/.elisp http://git.savannah.gnu.org/cgit/emacs.git/plain/lisp/epa-file.el
(add-to-list 'load-path "~/.elisp")
(require 'epa-file)
(epa-file-enable)

;; ------------------------------
;; gpg mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/AutoEncryption
(defvar pgg-gpg-user-id "YOUR-ID-HERE")
(autoload 'pgg-make-temp-file "pgg" "PGG")
(autoload 'pgg-gpg-decrypt-region "pgg-gpg" "PGG GnuPG")
(define-generic-mode 'gpg-file-mode
  (list ?#)
  nil nil
  '(".gpg\\'" ".gpg-encrypted\\'")
  (list (lambda ()
	    (add-hook 'before-save-hook
		      (lambda ()
			(let ((pgg-output-buffer (current-buffer)))
			  (pgg-gpg-encrypt-region (point-min) (point-max)
						  (list pgg-gpg-user-id))))
		      nil t)
	    (add-hook 'after-save-hook
		      (lambda ()
			(let ((pgg-output-buffer (current-buffer)))
			  (pgg-gpg-decrypt-region (point-min) (point-max)))
			(set-buffer-modified-p nil)
			(auto-save-mode nil))
		      nil t)
	    (let ((pgg-output-buffer (current-buffer)))
	      (pgg-gpg-decrypt-region (point-min) (point-max)))
	    (auto-save-mode nil)
	    (set-buffer-modified-p nil)))
  "Mode for gpg encrypted files")

;; ------------------------------
;; dired-x
;; ------------------------------

(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    (setq dired-omit-files
		  (concat dired-omit-files "\\|^\\..+$"))
	    ))

(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
	    (setq dired-omit-files-p t)
	    ))

;; ------------------------------
;; anything mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/anything-config")

(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(
     anything-c-source-buffers
     anything-c-source-recentf
     anything-c-source-files-in-current-dir
     anything-c-source-bookmarks
     anything-c-source-recentf
     ;; anything-isearch???
     anything-c-source-files-in-current-dir
;; it seems that anything mode is just too slow when using
;; anything-c-source-mac-spotlight and anything-c-source-locate
;     anything-c-source-mac-spotlight
;     anything-c-source-locate
     anything-for-files-prefered-list
     anything-c-source-ffap-line
     anything-c-source-ffap-guesser
     ;; anything-c-source-mac-spotlight  ;; I believe this source is causing slowdown, its the one invoking mdfind
     ;; anything-c-source-occur
;;     anything-c-source-firefox-bookmarks causes error if ~/.mozilla/firefox/bookmarks.html doesn't exist
;;     anything-bookmarks ;; mcausese error
     ;; anything-c-source-bm
     ;; anything-mini
     ;; anything-minibuffer-history
     anything-c-source-kill-ring
;;     anything-dired-copy-file
     ;;     anything-c-source-file-name-history
     anything-c-source-mark-ring
     ;; anything-c-source-info-pages; Emacs on windows can't find info dir on windows, comment it out until a rainy day
     ;; anything-c-source-man-pages
     anything-c-source-buffer-not-found
     ;; anything-c-google-suggest-url
     ;; anything-c-source-emacs-commands
     ;; anything-c-source-files-in-all-dired
     anything-c-source-minibuffer-history
     ;; this one causes save-excursion: Marker does not point anywhere error when mark is not set
     ;; anything-c-source-mark-ring
     ;; anything-c-source-global-mark-ring causes problems when
     ;; switching back to original buffer.  Its as though save-excursion
     ;; isn't working because upon returning to the buffer, your
     ;; position is not correct.
     ;; anything-c-source-global-mark-ring
     anything-c-source-minibuffer-history
     anything-c-source-ctags
;     anything-c-source-info-pages
     ;; anything-c-source-info-elisp; this gives error progn: Symbol's function definition is void: Info-find-node
     ;; anything-c-source-man-pages
     ;; anything-c-source-locate
     ;; anything-c-source-emacs-commands
     anything-c-source-complex-command-history
     )
   " *my-anything*"))
(global-set-key "," (quote my-anything))
(require 'anything-config)		; loads anything.el too

(setq anything-c-google-suggest-url "http://www.google.cn/complete/search?hl=en&js=true&qu=")
(setq anything-c-use-standard-keys nil)
(setq anything-c-yas-display-key-on-candidate t)
(setq anything-candidate-number-limit 30)
(setq anything-dired-bindings 1)
(setq anything-etags-enable-tag-file-dir-cache t)
(setq anything-idle-delay 0.1)
(setq anything-input-idle-delay 0.1)
(setq anything-quick-update t)
(setq anything-samewindow t)

;; ===========================
;; Custom Functions
;; ===========================
(defun tm-dir-shell-here()
  (interactive)
  (let ((cbuff (buffer-name))
	(cdcmd (concat "cd \'" (expand-file-name (file-name-as-directory default-directory)) "\'")))
    (progn
      (shell)
      (goto-char (point-max))
      (move-beginning-of-line 1)
      (insert "# ") (comint-send-input)
      (goto-char (point-max))
      (insert cdcmd) (comint-send-input)
      ;; it seems better not to split window and switch
      ;; (switch-to-buffer-other-window cbuff)
      ;; (other-window 1)
      (kill-new cbuff)
      )))
(global-set-key "e" (quote tm-dir-shell-here))

;; Insert dates
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%a %b %e %Y")))

;; print an ascii table
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder "
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

;; Function to run Tidy HTML parser on buffer, this requires external app Tidy
(defun tidy-buffer-xhtml ()
  "Run Tidy HTML parser on current buffer."
  (interactive)
  (save-excursion
    (if (get-buffer "tidy-html-errs") (kill-buffer "tidy-html-errs"))
    (let ((tmp (concat temporary-file-directory "tidy-html-errs"))
	  (cmd "tidy --force-output true -asxhtml --tidy-mark no --doctype strict --indent-attributes true --wrap-attributes true --vertical-space true -q -i -wrap 60 -c -f "))
      (shell-command-on-region (point-min) (point-max)
			       (concat cmd tmp)
			       t)
					;(shell-command-on-region (point-min) (point-max) "tidyClean"
					;t)
      (find-file-other-window tmp)
      (other-window 1)
      (enlarge-window (- (- (frame-height) +8) (window-height)))
      (if (file-exists-p tmp) (delete-file tmp))
      (goto-char (point-min))
      )
    (message "buffer tidy'ed and tidyClean'ed")
    )
  )

;; Function to run Tidy xml parser on buffer, this requires external app Tidy
(defun tidy-buffer-xml ()
  "Run Tidy XML parser on current buffer."
  (interactive)
  (save-excursion
    (if (get-buffer "tidy-xml-errs") (kill-buffer "tidy-xml-errs"))
    (let ((tmp (concat temporary-file-directory "tidy-xml-errs"))
	  (cmd "tidy -xml --tidy-mark no --doctype strict --vertical-space true --indent-attributes true --wrap-attributes true -q -i -wrap 72 -c -f " ))
      (shell-command-on-region (point-min) (point-max)
			       (concat cmd tmp)
			       t)
      (find-file-other-window tmp)
      (other-window 1)
      (enlarge-window (- (- (frame-height) +8) (window-height)))
      (if (file-exists-p tmp) (delete-file tmp))
      (goto-char (point-min))
      )
    (message "buffer tidy'ed")
    )
  )


																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																		     ;;; Convert DOS file format to Unix
;; look at
;; M-x comint-strip-ctrl-m
;;   Command: Strip trailing `^M' characters from the current output group.
;; from: elf@ee.ryerson.ca (Luis Fernandes)
;; 22 May 1997
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																		     ;;; Usage: M-x dos2unix
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																		     ;;;
(defun dos2unix ()
  "Convert this entire buffer from MS-DOS text file format to UNIX."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\r$" "" nil)
    (goto-char (1- (point-max)))
    (if (looking-at "\C-z")
	(delete-char 1))))

;; ------------------------------
;; longlines
;; ------------------------------
(add-to-list 'load-path "~/.elisp")
(autoload 'longlines-mode
  "longlines.el"
  "Minor mode for automatically wrapping long lines." t)

;; ------------------------------
;; org-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/org-mode/lisp")
(add-to-list 'load-path "~/.elisp/org-mode/lisp/babel")
(add-to-list 'load-path "~/.elisp/org-mode/lisp/babel/langs")
(add-to-list 'load-path "~/.elisp/org-mode/contrib/lisp")
(add-to-list 'load-path "~/.elisp/org-mode/EXPERIMENTAL/") ; make use of .elisp/org-mode/EXPERIMENTAL/org-mediawiki.el
(require 'org)
(require 'org-install)
;(require 'ob-sh)
;;(require 'ob-R)         ;; requires R and ess-mode
;(require 'ob-perl)      ;;
;(require 'ob-ruby)      ;; requires ruby, irb, ruby-mode, and inf-ruby
;(require 'ob-python)    ;; requires python, and python-mode
;(require 'ob-clojure)   ;; requires clojure, clojure-mode, swank-clojure and slime

(setq-default
;;; org-list-automatic-rules t ; don't do this it gives error: org-set-regexps-and-options: Wrong type argument: listp, t
 org-babel-library-of-babel t
 org-return-follows-link t
 org-agenda-files '("~/notes.txt")
 org-agenda-include-diary t
 org-agenda-ndays 31
 org-confirm-babel-evaluate nil
 org-deadline-warning-days 100)

(require 'org-crypt)
(require 'org-publish)
(setq org-publish-project-alist
      '(
	;; ... add all the components here (see below)...
	("org-notes"
	 :base-directory "~/Documents/projects/git_proj/read-sb-changelog"
	 :base-extension "txt"
	 :publishing-directory "~/Documents/projects/git_proj/read-sb-changelog"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 )

	("org" :components ("org-notes" "org-static"))

	))


(setq org-use-speed-commands t)
(setq org-speed-commands-user (quote (("0" . delete-window)
				      ("1" . delete-other-windows)
				      ("2" . split-window-vertically)
				      ("3" . split-window-horizontally)
				      ("h" . hide-other)
				      ("k" . org-kill-note-or-show-branches)
				      ("r" . org-reveal))))


(setq org-agenda-custom-commands '(("f" occur-tree "FIXME")))

(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key "c" (quote calendar))))

;; Encrypt all entries before saving
(org-crypt-use-before-save-magic)
;; Which tag is used to mark headings to be encrypted
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;; GPG key to use for encryption
(setq org-crypt-key "F0B66B40")

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
(setq org-default-notes-file (concat org-directory "~/notes.txt"))


(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t)
;; ))



;; org-list-automatic-rules
;; org-item-re


;; (toggle-debug-on-error 1)
;;  (org-babel-do-load-languages
;;        'org-babel-load-languages
;;        '(
;;	 ;;(emacs-lisp . t)
;;	 (sh . t)
;;          ;;(R . t)
;;	 ))




;; ;;http://orgmode.org/worg/org-contrib/babel/languages.html
;; ;;active Babel languages
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((R . t)
;;    (ditaa . t)
;;    (dot . t)
;;    (emacs-lisp . t)
;;    (gnuplot . t)
;;    (haskell . nil)
;;    (ocaml . nil)
;;    (python . t)
;;    (ruby . t)
;;    (screen . nil)
;;    (sh . t)
;;    (sql . nil)
;;    (sqlite . t)))

(require 'ob-R)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . nil)
;;    (R . t)))

;; keep "/opt/local/share/info" as the last element of
;; Info-default-directory-list because "/opt/local/share/info" has the
;; newest stuff
;; (setq Info-directory-list (cons (expand-file-name "/opt/local/share/info") Info-default-directory-list))

;; ------------------------------
;; nsis mode
;; ------------------------------
;; wget -P.elisp http://www.emacswiki.org/emacs/download/nsis-mode.el
;; (autoload 'nsis-mode "nsis-mode" "NSIS mode" t)
;; (setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Ii]\\)$" .
;;                                  nsis-mode)) auto-mode-alist))
;; (setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Hh]\\)$" .
;;                                  nsis-mode)) auto-mode-alist))






;; ------------------------------
;; browse-apropose-url
;; ------------------------------

;; Don't know if it's the best way , but it seemed to work. (Requires emacs >= 20)
(defun browse-apropos-url (text &optional new-window)
  (interactive (browse-url-interactive-arg "Location: "))
  (let ((text (replace-regexp-in-string
	       "^ *\\| *$" ""
	       (replace-regexp-in-string "[ \t\n]+" " " text))))
    (let ((url (assoc-default
		text apropos-url-alist
		'(lambda (a b) (let () (setq __braplast a) (string-match a b)))
		text)))
      (browse-url (replace-regexp-in-string __braplast url text) new-window))))


(defun browse-apropos-url-on-region (min max text &optional new-window)
  (interactive "r \nsAppend region to location: \nP")
  (browse-apropos-url (concat text " " (buffer-substring min max)) new-window))

;; http://www.emacswiki.org/emacs/BrowseAproposURL#toc6
(setq apropos-url-alist
      '(("^gw?:? +\\(.*\\)" . ;; Google Web
	 "http://www.google.com/search?q=\\1")
	("^g!:? +\\(.*\\)" . ;; Google Lucky
	 "http://www.google.com/search?btnI=I%27m+Feeling+Lucky&q=\\1")
	("^gl:? +\\(.*\\)" .  ;; Google Linux
	 "http://www.google.com/linux?q=\\1")
	("^gi:? +\\(.*\\)" . ;; Google Images
	 "http://images.google.com/images?sa=N&tab=wi&q=\\1")
	("^gg:? +\\(.*\\)" . ;; Google Groups
	 "http://groups.google.com/groups?q=\\1")
	("^gd:? +\\(.*\\)" . ;; Google Directory
	 "http://www.google.com/search?&sa=N&cat=gwd/Top&tab=gd&q=\\1")
	("^gn:? +\\(.*\\)" . ;; Google News
	 "http://news.google.com/news?sa=N&tab=dn&q=\\1")
	("^gt:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(\\w+://.*\\)" . ;; Google Translate URL
	 "http://translate.google.com/translate?langpair=\\1|\\2&u=\\3")
	("^gt:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(.*\\)" . ;; Google Translate Text
	 "http://translate.google.com/translate_t?langpair=\\1|\\2&text=\\3")
	("^/\\.$" . ;; Slashdot
	 "http://www.slashdot.org")
	("^/\\.:? +\\(.*\\)" . ;; Slashdot search
	 "http://www.osdn.com/osdnsearch.pl?site=Slashdot&query=\\1")
	("^fm$" . ;; Freshmeat
	 "http://www.freshmeat.net")
	("^ewiki:? +\\(.*\\)" . ;; Emacs Wiki Search
	 "http://www.emacswiki.org/cgi-bin/wiki?search=\\1")
	("^ewiki$" . ;; Emacs Wiki
	 "http://www.emacswiki.org")
	("^arda$" . ;; The Encyclopedia of Arda
	 "http://www.glyphweb.com/arda/")
	("^nsis:? +\\(.*\\)" . ;; NSIS docs
	 "http://www.google.com/search?q=site:nsis.sourceforge.net%20\\1")
	))

(global-set-key "b" (quote browse-apropos-url-on-region))

;; ------------------------------
;; compilation mode stuff
;; ------------------------------

(require 'compile)

;; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
(add-hook 'makefile-mode-hook
 (lambda ()
   (define-key makefile-mode-map (kbd "C-c u") 'compile) ;
   (define-key makefile-mode-map (kbd "C-c i") 'recompile) ;
))

(when (equal system-type 'darwin)
  (progn
    (custom-set-variables
     '(compile-command "gmake -k "))))

(setq-default
 compilation-scroll-output t ;; scroll automatically to follow the output as it comes in.
 compilation-skip-threshold 0
 compilation-auto-jump-to-first-error t
 ;; compilation-search-path "." ;; http://www.mail-archive.com/emacs-pretest-bug@gnu.org/msg11407.html
)

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
      '(
	absoft
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
	weblint
	))

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
; (setq compilation-window-height 12)

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

;; ------------------------------
;; applescript-mode actionscript mode osascript
;; ------------------------------
(add-to-list 'load-path "~/.elisp/applescript-mode.el")
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(add-to-list 'auto-mode-alist '("\\.scpt\\'" . applescript-mode))
(add-to-list 'auto-mode-alist '("\\.applescript\\'" . applescript-mode))

;; liveEncoderAutomate.scpt:1338:1339: script error: Expected “else”, etc. but found unknown token. (-2741)
(add-to-list 'compilation-error-regexp-alist
	     '("^\\([^:]*\\):\\([0-9]+\\).* script error:" 1 2))


(global-set-key "i" (quote recompile))
(global-set-key "u" (quote compile))
;; ------------------------------
;; php-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/php-mode-1.5.0")
(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
(autoload 'php-mode "php-mode" "Enter PHP mode." t)


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


(global-set-key "i" (quote recompile))
(global-set-key "u" (quote compile))


;; (when (equal system-type 'darwin)
;;   (progn
;;     (custom-set-variables
;;      '(compilation-search-path
;;        (quote
;;	(nil "~/pdev/maven-practice/11/my-app/src/test/java/com/mycompany/app/pages"
;;	     "/Users/demo/play/Selenium2/java/client/src/org/openqa/selenium/firefox" "")))



;; ------------------------------
;; csharp-mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/download/csharp-mode.el

(add-to-list 'load-path "~/.elisp")
; (add-to-list 'auto-mode-alist '("\\.cs?\\'" . csharp-mode))
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

;; Optionally, define and register a mode-hook function. To do so, use
;; something like this in your .emacs file:

(defun my-csharp-mode-fn ()
   "function that runs when csharp-mode is initialized for a buffer."
;   (turn-on-auto-revert-mode)
;   (setq indent-tabs-mode nil)
   (require 'flymake)
   (flymake-mode 0)
;   (require 'yasnippet)
   (yas/minor-mode-on)
;   (require 'rfringe)
;   ...insert more code here...
;   ...including any custom key bindings you might want ...
)
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

;; ------------------------------
;; gmail gnus
;; ------------------------------
;; ;; http://www.emacswiki.org/emacs/GnusGmail#toc2

;; (add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
;;                                   (nnimap-address "imap.gmail.com")
;;                                   (nnimap-server-port 993)
;;                                   (nnimap-stream ssl)))


;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587 "taylor.monacelli@streambox.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-local-domain "streambox.com")

;; ------------------------------
;; wanderlust
;; ------------------------------

;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com")
;; (setq elmo-imap4-default-user "<accountname>@gmail.com")
(setq elmo-imap4-default-user "taylor.monacelli@streambox.com")
(setq elmo-imap4-default-authenticate-type 'clear)
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "mattofransen")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t)

(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))



; http://praveen.kumar.in/2011/03/09/making-gnu-emacs-detect-custom-error-messages-a-maven-example/
(add-to-list 'compilation-error-regexp-alist 'maven)
(add-to-list 'compilation-error-regexp-alist-alist
       '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
	   1 2 3))



;; ------------------------------
;; cmake-mode
;; ------------------------------

;; http://www.cmake.org/CMakeDocs/cmake-mode.el

(setq load-path (cons (expand-file-name "~/.elisp") load-path))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;; ------------------------------
;; python-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/python-mode-1.0")
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-insert-alist '((python-mode . "Python Mode") . (concat comment-start "-*- python -*-\n\n\n" )))
(setq auto-mode-alist (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("sconstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("SConscript" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("sconscript" . python-mode) auto-mode-alist))

;  File "/Users/demo/pdev/check2000/SConstruct", line 30:
(add-to-list 'compilation-error-regexp-alist
	     '("^ +File .\\(.*\\)., line \\([0-9]+\\):" 1 2))

;; ---------------
;; http://www.masteringemacs.org/articles/2012/05/29/compiling-running-scripts-emacs/

(require 'python)
(defun python--add-debug-highlight ()
  "Adds a highlighter for use by `python--pdb-breakpoint-string'"
  (highlight-lines-matching-regexp "## DEBUG ##\\s-*$" 'hi-red-b))

(add-hook 'python-mode-hook 'python--add-debug-highlight)

(defvar python--pdb-breakpoint-string "import pdb; pdb.set_trace() ## DEBUG ##"
  "Python breakpoint string used by `python-insert-breakpoint'")

(defun python-insert-breakpoint ()
  "Inserts a python breakpoint using `pdb'"
  (interactive)
  (back-to-indentation)
  ;; this preserves the correct indentation in case the line above
  ;; point is a nested block
  (split-line)
  (insert python--pdb-breakpoint-string))
(define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint)

(defadvice compile (before ad-compile-smart activate)
  "Advises `compile' so it sets the argument COMINT to t
if breakpoints are present in `python-mode' files"
  (when (derived-mode-p major-mode 'python-mode)
    (save-excursion
      (save-match-data
	(goto-char (point-min))
	(if (re-search-forward (concat "^\\s-*" python--pdb-breakpoint-string "$")
			       (point-max) t)
	    ;; set COMINT argument to `t'.
	    (ad-set-arg 1 t))))))
;; end http://www.masteringemacs.org/articles/2012/05/29/compiling-running-scripts-emacs/
;; ---------------


;; ------------------------------

;; my-isearch-word-at-point
;; ------------------------------
;;http://stackoverflow.com/questions/589691/how-can-i-emulate-vims-search-in-gnu-emacs
(defun my-isearch-word-at-point ()
  (interactive)
  (call-interactively 'isearch-forward-regexp))

(defun my-isearch-yank-word-hook ()
  (when (equal this-command 'my-isearch-word-at-point)
    (let ((string (concat "\\<"
			  (buffer-substring-no-properties
			   (progn (skip-syntax-backward "w_") (point))
			   (progn (skip-syntax-forward "w_") (point)))
			  "\\>")))
      (if (and isearch-case-fold-search
	       (eq 'not-yanks search-upper-case))
	  (setq string (downcase string)))
      (setq isearch-string string
	    isearch-message
	    (concat isearch-message
		    (mapconcat 'isearch-text-char-description
			       string ""))
	    isearch-yank-flag t)
      (isearch-search-and-update))))

(add-hook 'isearch-mode-hook 'my-isearch-yank-word-hook)


(global-set-key "p" (quote my-isearch-word-at-point))
(global-set-key "w" (quote whitespace-cleanup))


;; ------------------------------
;; git jump with quickfix files
;; ------------------------------

;; http://aaroncrane.co.uk/2011/11/git_jump_emacs/

(defun quickfix-open (files)
  (setq-default compilation-directory default-directory)
  (compilation-start
   (concat "cat "
	   (mapconcat #'shell-quote-argument files " "))))


(global-set-key "p" (quote my-isearch-word-at-point))
(global-set-key "w" (quote whitespace-cleanup))


;; ------------------------------
;; git jump with quickfix files
;; ------------------------------

;; http://aaroncrane.co.uk/2011/11/git_jump_emacs/

(defun quickfix-open (files)
  (setq-default compilation-directory default-directory)
  (compilation-start
   (concat "cat "
	   (mapconcat #'shell-quote-argument files " "))))


;; ------------------------------
;; desktop sessions
;; ------------------------------
; (desktop-save-mode 1)

;; ------------------------------
;; turn on winner-mode
;; ------------------------------
(winner-mode 1)

;; ------------------------------
;; bookmarkplus mode
;; ------------------------------
;;http://www.emacswiki.org/emacs/BookmarkPlus
(add-to-list 'load-path "~/.elisp/bookmarkplus")
(set-variable (quote bookmark-save-flag) 1 nil)
(set-variable (quote bmkp-last-as-first-bookmark-file) "~/.emacs.bmk" nil)
(require 'bookmark+)

;; ------------------------------
;; psvn.el
;; ------------------------------
(require 'psvn)

;; ------------------------------
;; ctags-update
;; ------------------------------
(require 'ctags-update)
(ctags-update-minor-mode 1)

;; ------------------------------

;; psvn.el
;; ------------------------------
; (require 'psvn)

;; ------------------------------
;; custom-set-faces
;; ------------------------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ------------------------------
;; newsticker
;; ------------------------------
;; == Newsticker ==
(setq newsticker-url-list
      (quote (("ACM Queue" "http://queue.acm.org/rss/feeds/blogroll.xml" nil nil nil))))

;; ------------------------------
;; shell
;; ------------------------------
(shell)

;; ------------------------------
;; Window Number mode
;; ------------------------------
;; http://nschum.de/src/emacs/window-numbering-mode/
(add-to-list 'load-path "~/.elisp")
(require 'window-numbering)
(window-numbering-mode 1)

;; ------------------------------
;; Frame resolution
;; ------------------------------
; http://stackoverflow.com/questions/92971/how-do-i-set-the-size-of-emacs-window
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
	   (add-to-list 'default-frame-alist (cons 'width 120))
	   (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
	 (cons 'height (/ (- (x-display-pixel-height) 200)
			     (frame-char-height)))))))

(if (eq system-type 'windows-nt)
    (progn
      (set-frame-size-according-to-resolution)
      (set-frame-position (selected-frame) 70 10)))
;; ------------------------------
;; programmable completion pcomplete
;; ------------------------------

;; http://www.masteringemacs.org/articles/2012/01/16/pcomplete-context-sensitive-completion-emacs/

; emacs pcomplete git branch

(defconst pcmpl-git-commands
  '("add" "bisect" "branch" "checkout" "clone"
    "commit" "diff" "fetch" "grep"
    "init" "log" "merge" "mv" "pull" "push" "rebase"
    "reset" "rm" "show" "status" "tag" )
  "List of `git' commands")

(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs")

(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE"
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let ((ref-list))
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
	(add-to-list 'ref-list (match-string 1)))
      ref-list)))

(defun pcomplete/git ()
  "Completion for `git'"
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-git-commands)
  ;; complete files/dirs forever if the command is `add' or `rm'
  (cond
   ((pcomplete-match (regexp-opt '("add" "rm")) 1)
    (while (pcomplete-here (pcomplete-entries))))
   ;; provide branch completion for the command `checkout'.
   ((pcomplete-match "checkout" 1)
    (pcomplete-here* (pcmpl-git-get-refs "heads")))))


; from /Users/demo/play/emacs/lisp/pcomplete.el
(add-hook 'shell-mode-hook 'pcomplete-shell-setup)
