;; emacs  --quick --batch --no-window-system --load emacs-get-packages.el --funcall main

(require 'cl)
(toggle-debug-on-error)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if t
           (package-install package)
         package)))
   packages))

;; http://nic.ferrier.me.uk/blog/2012_07/emacs-packages-for-programmers

(defun main ()
  (interactive)
  (destructuring-bind
      (package &optional elpa-parent) command-line-args-left
    ;; Make the elpa dir for this if we need to.
    (when (and elpa-parent
	       (not (file-exists-p elpa-parent)))
      (make-directory elpa-parent t))
    ;; Package stuff
    (setq package-user-dir
	  (concat
	   (or (concat elpa-parent "/")
	       user-emacs-directory)
	   ".elpa"))

    (setq package-archives ())
    (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
    (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
    (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
    (add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t) ;; http://emacsredux.com/blog/2014/05/16/melpa-stable

    (package-initialize)
    (package-refresh-contents)

    ;; activate installed packages
    (ensure-package-installed 'bookmark+)
    ;; (ensure-package-installed 'java-file-create)
    ;; (ensure-package-installed 'java-snippets)
    ;; (ensure-package-installed 'javadoc-lookup)
    ;; (ensure-package-installed 'jump-char)
    ;; (ensure-package-installed 'jump)
    ;; (ensure-package-installed 'json-mode)
    ;; (ensure-package-installed 'javascript)
    ;; (ensure-package-installed 'helm-chrome)
    ;; (ensure-package-installed 'helm-chrome)
    ;; (ensure-package-installed 'ac-helm)
    ;; (ensure-package-installed 'helm-chrome)
    ;; (ensure-package-installed 'magit-annex)
    ;; (ensure-package-installed 'magit-filenotify)
    ;; (ensure-package-installed 'magit-find-file)
    ;; (ensure-package-installed 'magit-gerrit)
    ;; (ensure-package-installed 'magit-gh-pulls)
    ;; (ensure-package-installed 'magit-gitflow)
    ;; (ensure-package-installed 'magit-log-edit)
    ;; (ensure-package-installed 'magit-push-remote)
    ;; (ensure-package-installed 'magit-simple-keys)
    ;; (ensure-package-installed 'magit-stgit)
    ;; (ensure-package-installed 'magit-svn)
    ;; (ensure-package-installed 'magit-topgit)
    ;; (ensure-package-installed 'magit-tramp)
    ;; (ensure-package-installed 'magithub)
    ;; (ensure-package-installed 'helm)
    ;; (ensure-package-installed 'iedit)
    ;; (ensure-package-installed 'magit)
))
