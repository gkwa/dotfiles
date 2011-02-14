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

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

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
                 (cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;; (if (equal window-system nil)
;;     (shell nil))

(setq initial-frame-alist '((top . 10) (left . 30)))

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
;; 	  '(lambda () (define-key sgml-mode-map "\C-c\C-nt" 'tidy-buffer-xml )
;; 	     ;;  	     (define-key texinfo-mode-map "\C-cn"
;; 	     ;;  	       'forward-paragraph)
;; 	     ))

;; --------------------------------------------------

;; global key sets


(global-set-key "j" (quote rename-uniquely))


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
      ))

(if 
    (eq system-type 'darwin)
    (progn
      (add-to-list 'exec-path '(
				"/usr/local/bin"
				"/opt/local/bin"
				))
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




(require 'breadcrumb)

;; (global-set-key [(shift space)]         'bc-set)            ;; Shift-SPACE for set bookmark
;; (global-set-key (quote [33554464]) (quote bc-set))          ;; Shift-SPACE for set bookmark
(global-set-key [(meta j)]              'bc-previous) ;; M-j for jump to previous
(global-set-key [(shift meta j)]        'bc-next) ;; Shift-M-j for jump to next
(global-set-key [(meta up)]             'bc-local-previous) ;; M-up-arrow for local previous
(global-set-key [(meta down)]           'bc-local-next)	;; M-down-arrow for local next
(global-set-key [(control c)(j)]        'bc-goto-current) ;; C-c j for jump to current bookmark
(global-set-key [(control x)(meta j)]   'bc-list) ;; C-x M-j for the bookmark menu list

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
;; 	(server-start)
;; )))

;; (server-start)

;; So emacs won't try to start the server again.

;; This function may be useful if you are always in a client. I bind it to C-c q. So I don't need to use C-x # or C-x 5 0 any more.

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
 bc-bookmark-limit 100
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
 '(bc-bookmark-limit 100)
 '(delete-by-moving-to-trash t)
 '(frame-title-format "emacs - %b")
 '(diary-file (expand-file-name "~/.diary"))
 '(display-time-mode t nil (time))
 '(eshell-prompt-function (lambda nil
			    (let* ((prompt (eshell/pwd)) 
				   (tmp (string-match "/[^:/\\]*$" prompt))) 
			      (concat (substring prompt (+ tmp 1) (length prompt)) " "))) t)
 ;; auto-mode-case-fold t means that this: (add-to-list 'auto-mode-alist '("\\.xq\\'" . xquery-mode))
 ;; will match both 1.xQ and 1.xq (case is insensitive)
 '(auto-mode-case-fold t) 
 '(ido-case-fold t)
 '(major-mode (quote org-mode))
 '(menu-bar-mode nil)
 '(mode-line-inverse-video nil)
 '(nxml-slash-auto-complete-flag t)
 '(global-font-lock-mode t)
 '(ring-bell-function (quote ignore) t)
 '(scroll-bar-mode nil)
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



(define-key global-map "\C-xj" 'rename-uniquely)

;; ------------------------------
;; perl-mode
;; ------------------------------
(add-to-list 'auto-mode-alist '("\\.pm\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pl\\'" . perl-mode))
(add-to-list 'auto-insert-alist '((perl-mode . "Perl Mode") . (concat comment-start "-*- perl -*-\n\n" )))

;; ------------------------------
;; python-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/python-mode-1.0")
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-insert-alist '((python-mode . "Python Mode") . (concat comment-start "-*- python -*-\n\n\n" )))

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
;; (global-set-key "\C-ci" 'magit-status)

;; ------------------------------
;; applescript-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/applescript-mode.el")
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(add-to-list 'auto-mode-alist '("\\.scpt\\'" . applescript-mode))
(add-to-list 'auto-mode-alist '("\\.applescript\\'" . applescript-mode))

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
;; php-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/php-mode-1.5.0")
(autoload 'php-mode "php-mode" "Enter PHP mode." t)


;; ------------------------------
;; html-helper-mode
;; ------------------------------
(add-to-list 'load-path "~/.elisp/html-helper-mode/html-helper-mode.el")
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-helper-mode))

(add-to-list 'auto-insert-alist '((html-helper-mode . "Yay HTML") . (concat comment-start " Last modified $Id$" comment-end "\n" comment-start " $HeadURL$" comment-end "\n\n\n" )))

(add-hook 'html-helper-mode-hook  '(lambda () (auto-fill-mode 1) (setq fill-column 60)))

;; C-c C-n t for HTML mode
(add-hook 'html-helper-mode-hook
	  '(lambda ()
	     (define-key html-helper-mode-map "\C-c\C-nt"
	       'tidy-buffer-xhtml
	       )
	     ;;  	     (define-key texinfo-mode-map "\C-cn"
	     ;;  	       'forward-paragraph)
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

;; ------------------------------
;; org-crypt
;; ------------------------------
;; http://doc.norang.ca/org-mode.html#HandlingEncryption
(require 'org-crypt)
					; Encrypt all entries before saving
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
					; GPG key to use for encryption
(setq org-crypt-key "F0B66B40")



;; ------------------------------
;; recentf-mode
;; ------------------------------
;; http://www.emacswiki.org/emacs/RecentFiles
(autoload 'recentf "RecentF" "Enter recentf mode." t)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(setq recentf-max-saved-items 2500)
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
;;       ;; 		 (file "~/ledger")
;;       ;; 		 "%(org-read-date) * %^{Payee}
;;       ;;   Expenses:Cash
;;       ;;   Expenses:%^{Account}  %^{Amount}
;;       ;; "))
;;       ;; 	      org-capture-templates))
;;       ))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anything-dired-bindings 1)
 '(anything-idle-delay 0)
 '(anything-samewindow t)
 '(anything-dired-bindings 1)
 '(anything-quick-update t)
 ;; '(anything-c-find-files-show-icons t)
 '(anything-candidate-number-limit 30)
 '(anything-c-yas-display-key-on-candidate t)
 '(anything-etags-enable-tag-file-dir-cache t)
 '(anything-c-use-standard-keys nil)
 ;; '(anything-etags-cache-tag-file-dir "~/.emacs.d/") 
 '(anything-c-google-suggest-url "http://www.google.cn/complete/search?hl=en&js=true&qu=")
 ;; (anything-etags-generate-tag-buffer)
)

(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(
     anything-c-source-buffers
     anything-c-source-recentf
     anything-c-source-files-in-current-dir
     anything-for-files-prefered-list
     anything-c-source-ffap-line
     anything-c-source-ffap-guesser
     ;; anything-c-source-mac-spotlight  ;; I believe this source is causing slowdown, its the one invoking mdfind
     ;; anything-c-source-occur     
     ;; anything-c-source-bookmarks
     ;; anything-c-source-bm
     ;; anything-mini
     ;; anything-minibuffer-history
     anything-c-source-kill-ring
     ;;     anything-c-source-file-name-history
     anything-c-source-mark-ring 
     ;; anything-c-source-info-pages
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
     anything-c-source-info-pages
     ;; anything-c-source-info-elisp; this gives error progn: Symbol's function definition is void: Info-find-node
     ;; anything-c-source-man-pages
     ;; anything-c-source-locate
     ;; anything-c-source-emacs-commands
     anything-c-source-complex-command-history
     )
   " *my-anything*"))
(global-set-key "," (quote my-anything))
(require 'anything-config)		; loads anything.el too


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
(require 'org)
(require 'org-install)
;; org babel: ob
(add-to-list 'load-path "~/.elisp/org-mode/lisp")
(require 'ob)
(require 'ob-R)         ;; requires R and ess-mode
(require 'ob-perl)      ;; 
(require 'ob-ruby)      ;; requires ruby, irb, ruby-mode, and inf-ruby
(require 'ob-python)    ;; requires python, and python-mode
(require 'ob-clojure)   ;; requires clojure, clojure-mode, swank-clojure and slime


(setq-default
 org-babel-library-of-babel t
 org-return-follows-link t
 org-agenda-files '("~/notes.txt")
 org-agenda-include-diary t
 org-agenda-ndays 31
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



;; keep "/opt/local/share/info" as the last element of
;; Info-default-directory-list because "/opt/local/share/info" has the
;; newest stuff
;; (setq Info-directory-list (cons (expand-file-name "/opt/local/share/info") Info-default-directory-list))

;; ------------------------------
;; compilation mode stuff
;; ------------------------------

(require 'compile)
(global-set-key "h" (quote recompile))
(setq-default
 compilation-scroll-output t ;; scroll automatically to follow the output as it comes in.
 compilation-skip-threshold 0
 compilation-auto-jump-to-first-error t
 ;; compilation-search-path "." ;; http://www.mail-archive.com/emacs-pretest-bug@gnu.org/msg11407.html
)



;; ;; gfortran 4.1:
;; (add-to-list 'compilation-error-regexp-alist
;; 	     ;;  In file pfft3d.f90:182
;;              ;;
;; 	     ;;           MPI_double_precision, &
;; 	     ;;                              1
;; 	     ;; Error: Symbol 'mpi_double_precision' at (1) has no IMPLICIT type
;; 	     '(" *In file \\([^ :\n]*\\):\\([0-9]+\\)[ \t]*\n\n.*\n.*\n.*Error:.*\n" 1 2))
;; ;; NAGWare5 f95:
;; (add-to-list 'compilation-error-regexp-alist
;; 	     ;; Error: mpi.F90, line 116: Implicit type for MPI_COMM_WORLD in MPI_MOD_INIT
;; 	     ;;        detected at MPI_M@<end-of-statement>
;; 	     ;; [f95 terminated - errors found by pass 1]
;; 	     '("^Error: \\([^ ,\n]*\\), line \\([0-9]+\\):" 1 2))
;; (add-to-list 'compilation-error-regexp-alist
;; 	     ;; Fatal Error: global.F90, line 25: Cannot find module MPI_M
;;              ;; detected at MPI_M@<end-of-statement>
;; 	     '("^Fatal Error: \\([^ ,\n]*\\), line \\([0-9]+\\):" 1 2))

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

;; ------------------------------
;; shell
;; ------------------------------

(shell)