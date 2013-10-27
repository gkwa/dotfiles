;; keep "/opt/local/share/info" as the last element of
;; Info-default-directory-list because "/opt/local/share/info" has the
;; newest stuff
;; (setq Info-directory-list (cons (expand-file-name "/opt/local/share/info") Info-default-directory-list))



;; this changes the value of the default-directory variable so that
;; the next dired will point you here
(add-to-list 'load-path "~/.elisp")

;; ------------------------------
;; bookmarkplus mode
;; ------------------------------
;;http://www.emacswiki.org/emacs/BookmarkPlus
(add-to-list 'load-path "~/.elisp/bookmark-plus")
(set-variable (quote bookmark-save-flag) 1 nil)
(set-variable (quote bmkp-last-as-first-bookmark-file) "~/.emacs.d/bookmarks" nil)
(require 'bookmark+)

;; ------------------------------
;; http://flask.pocoo.org/docs/unicode/
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;; ------------------------------

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
      (if (file-exists-p "c:/cygwin64/bin/bash.exe")
	    (setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
	(setq explicit-shell-file-name "c:/cygwin/bin/bash.exe"))
      ;;      (add-to-list 'Info-directory-list "c:/cygwin/usr/share/info")
      (require 'cygwin-mount)
      (cygwin-mount-activate)

      ;; http://blogs.law.harvard.edu/hoanga/2008/04/10/fixing-that-really-irritating-perl-warning-setting-locale-failed-on/
      ;; this error happens in emacs subshells when using 'git commit' unless you have set LC_ALL and LC_CTYPE.
      ;; this error (below) is fixed by setting LC_ALL and LC_CTYPE.
      ;; This doesn't happen in cygwin bash conseole, but only in emacs
      ;; bash subshell.
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
;      (add-hook 'after-init-hook '(lambda () (w32-send-sys-command ?\xf030))) ;; maximize on startup, http://www.emacswiki.org/emacs/FrameSize#toc2

      ;; http://pages.cs.wisc.edu/~quefeng/.emacs
      ;; open current buffer directory in explorer
      (defun open-buffer-path ()
	"Run explorer on the directory of the current buffer."
	(interactive)
	(shell-command (concat "explorer "
			       (replace-regexp-in-string "/" "\\" (file-name-directory (buffer-file-name)) t t)
			       )))
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

    ;; ------------------------------
    ;; pbcopy.el allows cut-paste from emacs into other apps
    ;; ------------------------------
    ;; http://mindlev.wordpress.com/2011/06/13/emacs-in-a-terminal-on-osx/
    ;; wget -P ~/.elisp https://gist.github.com/daniel-nelson/1023272/raw/7b0db196d1184e3a2f43b31c601c415f1d41830f/pbcopy.el
    (add-to-list 'load-path "~/.elisp")
    (require 'pbcopy)
    (turn-on-pbcopy)
    ;; ------------------------------

    (add-to-list 'load-path "/opt/local/var/macports/software/git-core/1.7.1_0+doc+svn/opt/local/share/doc/git-core/contrib/emacs")
    (add-to-list 'load-path "/opt/local/var/macports/software/emacs-app/23.2_0/Applications/MacPorts/Emacs.app/Contents/Resources/lisp/international")
    (add-to-list 'load-path "/opt/local/var/macports/software/emacs-app/23.2_0/Applications/MacPorts/Emacs.app/Contents/Resources/lisp")

    (load-theme (quote tango-dark) nil nil)

    ;; ------------------------------
    ;; On osx, when I try C-DEL, then all I get is DEL.  I want to bind
    ;; C-DEL to backward-kill-word, but since I can't generate the C-DEL
    ;; key, I'm using the function key fn
    (global-set-key [deletechar] (quote backward-kill-word))
    ;; ------------------------------
    )) ; end (when (equal system-type 'darwin)...

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
;;(setenv "TERM" "emacs")

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
;; (add-hook 'after-make-frame-functions 'setup-window-system-frame-dimensions t)

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
 ;; default-major-mode 'emacs-lisp-mode	;; Silly "Fundamental"
 default-fill-column 72
 compilation-scroll-output t ; scroll automatically to follow the output as it comes in.
 enable-recursive-minibuffers t
 visible-bell t				;; Turns off audible bell
 inhibit-startup-message t ;; - http://www.gnu.org/software/emacs/manual/html_node/Init-Examples.html
 column-number-mode t
 display-buffer-reuse-frames t ; http://www.cs.cmu.edu/cgi-bin/info2www?%28emacs%29Select%20Buffer
 delete-by-moving-to-trash t
 frame-title-format "emacs - %b"
 diary-file (expand-file-name "~/.diary"))


(fset 'yes-or-no-p 'y-or-n-p) ;; Make all "yes or no" prompts show "y or n" instead
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-mode-case-fold t)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(delete-by-moving-to-trash t)
 '(diary-file (expand-file-name "~/.diary"))
 '(eshell-prompt-function (lambda nil (let* ((prompt (eshell/pwd)) (tmp (string-match "/[^:/\\]*$" prompt))) (concat (substring prompt (+ tmp 1) (length prompt)) " "))) t)
 '(ffap-machine-p-known (quote reject))
 '(frame-title-format "emacs - %b" t)
 '(global-font-lock-mode t)
 '(ido-case-fold t)
 '(ispell-program-name "aspell")
 '(menu-bar-mode nil)
 '(mode-line-inverse-video nil)
 '(nxml-slash-auto-complete-flag t)
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t) (lexical-binding . t) (sgml-tag-region-if-active . t) (sgml-shorttag . t) (sgml-parent-document "Bugzilla-Guide.xml" "book" "chapter") (sgml-omittag . t) (sgml-namecase-general . t) (sgml-minimize-attributes) (sgml-local-ecat-files) (sgml-local-catalogs) (sgml-indent-step . 2) (sgml-indent-data . t) (sgml-general-insert-case . lower) (sgml-exposed-tags) (sgml-balanced-tag-edit . t) (sgml-auto-insert-required-elements . t) (sgml-always-quote-attributes . t) (TeX-master . t))))
 '(scroll-bar-mode nil)
 '(split-height-threshold nil)
 '(split-width-threshold 0)
 '(tab-stop-list (quote (2 4 6 8 10 12 56 64 72 80 88 96 104 112 120)))
 '(truncate-lines t)
 '(use-file-dialog nil))


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

;;(define-key global-map "\C-xj" 'rename-uniquely)
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
;; copy line
;; ------------------------------
;; http://www.emacswiki.org/emacs/CopyingWholeLines#toc4
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key "\C-h\C-k" 'copy-line)

;; ------------------------------
;; perl-mode
;; ------------------------------
(add-to-list 'auto-mode-alist '("\\.pm\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pl\\'" . perl-mode))
(add-to-list 'auto-insert-alist '((perl-mode . "Perl Mode") . (concat comment-start "-*- perl -*-\n\n" )))
(add-hook 'perl-mode-hook
	  (lambda ()
	    (setq tab-width 12)))

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
;; PowerShell mode
;; ------------------------------
; https://github.com/fperrin/powershell-mode
; http://thread.gmane.org/gmane.emacs.sources/3383
; www.emacswiki.org/emacs/PowerShell
(autoload 'powershell-mode "powershell-mode" "Mode PowerShell" t)
(push '("\\.ps[12]?$" . powershell-mode) auto-mode-alist)

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
(setq recentf-max-menu-items 100)
;;(recentf-mode 1)
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

;; ------------------------------
;; dired-x, diredx
;; ------------------------------
(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq dired-listing-switches "-alh")

;; ------------------------------
;; org-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/org-mode")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-publish-project-alist
      '(("org-weblog"
	 ;; Path to your org files.
	 :base-directory "~/pdev/weblog/org/"
	 :base-extension "org"

	 ;; Path to your Jekyll project.
	 :publishing-directory "~/pdev/weblog/jekyll/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :body-only t)

	("org-static-weblog"
	  :base-directory "~/pdev/weblog/org/"
	  :base-extension "png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	  :publishing-directory "~/pdev/weblog/jekyll/attachments"
	  :recursive t
	  :publishing-function org-publish-attachment)

	("weblog" :components ("org-weblog"
			       "org-static-weblog"))))

;; --------------------------------------------------
;; http://twitch.nervestaple.com/2011/10/09/blogging_with_emacs/
;; Note: An Odd Issue

;; Recently, for now reason I can discern, publishing my weblog
;; project would fail after attempting to export the first page to
;; HTML. Org Mode would export the file to HTML and then copy the
;; exported text to the clipboard, this should be text but it wasn't
;; and this was breaking the project export process.

;; Adding the following line to my Org Mode setup fixed this
;; issue. What would I do with that buffer of HTML anyway?
(setq org-export-copy-to-kill-ring nil)
;; --------------------------------------------------

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
	  (cmd "tidy --force-output true -asxhtml --tidy-mark no --doctype strict --indent-attributes true --wrap-attributes true --vertical-space true -q -i -wrap 60000 -c -f "))
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
	  (cmd "tidy -xml --tidy-mark no --doctype strict --vertical-space true --indent-attributes false --wrap-attributes false -q -i -wrap 72000 -c -f " ))
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
;; nsis mode
;; ------------------------------
;; ;; nsis-mode works but its too darn slow..disabling
;; (if (eq system-type 'windows-nt) ; This slows down emacs too much on OSX
;;     (progn
;;       (add-to-list 'load-path "~/.elisp/nsis-mode")
;;       (autoload 'nsis-mode "nsis-mode" "NSIS mode" t)
;;       (setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Ii]\\)$" .
;;				       nsis-mode)) auto-mode-alist))
;;       (setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Hh]\\)$" .
;;				       nsis-mode)) auto-mode-alist))))
;; ;; ------------------------------

;; org-agenda-text-search-extra-files
;; http://orgmode.org/worg/org-tutorials/advanced-searching.html

(setq org-agenda-files '("~/notes.txt"))
(setq org-default-notes-file (concat org-directory "~/notes.txt"))
;; http://lists.gnu.org/archive/html/emacs-orgmode/2011-09/msg00267.html
(setq org-agenda-text-search-extra-files
      (directory-files "~/notes" t "^[^.#].*\\.\\(org$\\|org_archive$\\)"))

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

(setq-default
 compilation-always-kill t
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

;; ------------------------------
;; applescript-mode actionscript mode osascript
;; ------------------------------
(add-to-list 'load-path "~/.elisp/applescript-mode.el")
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(add-to-list 'auto-mode-alist '("\\.scpt\\'" . applescript-mode))
(add-to-list 'auto-mode-alist '("\\.applescript\\'" . applescript-mode))

;; liveEncoderAutomate.scpt:1338:1339: script error: Expected "else", etc. but found unknown token. (-2741)
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




; http://praveen.kumar.in/2011/03/09/making-gnu-emacs-detect-custom-error-messages-a-maven-example/
(add-to-list 'compilation-error-regexp-alist 'maven)
(add-to-list 'compilation-error-regexp-alist-alist
       '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
	   1 2 3))

;; ------------------------------
;; csharp-mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/download/csharp-mode.el

(add-to-list 'load-path "~/.elisp")
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

;;  File "/Users/demo/pdev/check2000/SConstruct", line 30:
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

(add-to-list 'compilation-error-regexp-alist
	     '("^git_jump:\\(.*\\):\\([0-9]+\\)" 1 2))

(global-set-key "p" (quote my-isearch-word-at-point))
(global-set-key "w" (quote whitespace-cleanup))

;; ------------------------------
;; desktop sessions
;; ------------------------------
;; (desktop-save-mode 1)

;; ------------------------------
;; turn on winner-mode
;; ------------------------------
(winner-mode 1)

;; ------------------------------
;; ctags-update
;; ------------------------------
(require 'ctags-update)
(ctags-update-minor-mode 1)

;; ------------------------------
;; ctags
;; ------------------------------

;; (setq path-to-ctags "/usr/local/bin/ctags") ;; <- your ctags path here
(setq path-to-ctags "ctags") ;; <- your ctags path here
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
  )
(global-set-key "t" (quote create-tags))

;; ------------------------------
;; psvn.el
;; ------------------------------
;; (require 'psvn)

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
;; http://stackoverflow.com/questions/92971/how-do-i-set-the-size-of-emacs-window
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
(add-to-list 'load-path "~/.elisp/pcmpl-git-el")
(require 'pcmpl-git)

;; end pcmpl-git configuration
;; ------------------------------

;; http://snarfed.org/dotfiles/.emacs
(setenv "PAGER" "cat")

;; ------------------------------
;; puppet mode
;; ------------------------------
;; Setup puppet-mode for autoloading
(add-to-list 'load-path "~/.elisp/puppet-syntax-emacs")
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; ------------------------------
;; tramp
;; ------------------------------
(require 'backup-dir)
(add-to-list 'bkup-backup-directory-info
	     (list "." "~/.emacs.d/backups/" 'full-path))
(setq tramp-bkup-backup-directory-info bkup-backup-directory-info)

;; end tramp configuration
;; ------------------------------


;; ------------------------------
;; js2-mode
;; Enhanced JavaScript IDE Emacs Mode
;; ------------------------------


;; http://code.google.com/p/js2-mode/source/checkout
;; svn checkout http://js2-mode.googlecode.com/svn/trunk/ ~/.elisp/js2-mode-read-only

(add-to-list 'load-path "~/.elisp/js2-mode-read-only")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; end js2-mode configuration
;; ------------------------------

;; ------------------------------
;; MELPA
;; Add additional 3rd party pacakge archives
;; ------------------------------
; http://melpa.milkbox.net/#/getting-started
; http://stackoverflow.com/questions/6506739/slime-mode-error

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
	     '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; End MELPA
;; ------------------------------

;; ------------------------------
;; winring
;; ------------------------------
(add-to-list 'load-path "~/.elisp")
(require 'winring)
(winring-initialize)

;; end winring configuration
;; ------------------------------

;; ------------------------------
;; helm
;; ------------------------------

; http://stackoverflow.com/questions/11403862/how-to-have-emacs-helm-list-offer-files-in-current-directory-as-options

(add-to-list 'load-path "~/.elisp/helm")
(require 'helm-config)
(helm-mode 1)

(defun helm-my-buffers ()
  (interactive)
  (helm-other-buffer '(
		       helm-c-source-buffers-list
		       helm-c-source-mac-spotlight;; I believe this source is causing slowdown, its the one invoking mdfind
		       helm-c-source-recentf
		       helm-c-source-bookmarks
		       helm-c-source-files-in-current-dir
		       helm-c-source-buffer-not-found
		       ) "*helm-my-buffers*"))

(global-set-key (kbd "C-x ,") (quote helm-my-buffers))

(add-hook 'eshell-mode-hook
	  #'(lambda ()
	      (define-key eshell-mode-map
		[remap eshell-pcomplete]
		'helm-esh-pcomplete)))



;; https://github.com/fengxiaolong/emacs.d-1/blob/master/init-helm.el
(setq helm-completing-read-handlers-alist
      '((dired-create-directory . nil)
	(dired-do-copy . nil)
        (dired-do-rename . nil)
	(execute-extended-command . nil)
	))

;; end helm configuration
;; ------------------------------
