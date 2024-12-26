(if (eq system-type 'windows-nt)
    (progn
      (if (file-exists-p "c:/cygwin64/bin/bash.exe")
	    (setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
	(setq explicit-shell-file-name "c:/cygwin/bin/bash.exe"))
      ;;      (add-to-list 'Info-directory-list "c:/cygwin/usr/share/info")

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



(if (eq system-type 'windows-nt)
    (progn
      (set-frame-size-according-to-resolution)
      (set-frame-position (selected-frame) 70 10)))


(provide 'user-init-microsoft-windows)
