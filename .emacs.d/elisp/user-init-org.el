(ensure-package-installed 'org)

(org-babel-do-load-languages
   'org-babel-load-languages
   '(
	 (ruby . t)
	 (python . t)
	 (java . t)
	 ))

(setq org-adapt-indentation nil)
(setq org-src-preserve-indentation t)
(setq org-confirm-babel-evaluate nil)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-mark-ring-goto)
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

(provide 'user-init-org)
