(defun helm-my-buffers ()
  (interactive)
  (helm-other-buffer
   '(helm-c-source-recentf
	 helm-c-source-buffers-list
	 helm-c-source-bookmarks
	 helm-c-source-files-in-current-dir
	 helm-c-source-buffer-not-found)
   "*helm-my-buffers*"))

(ensure-package-installed 'helm)

(require 'helm-config)

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
		(execute-extended-command . nil)))

;; https://github.com/shishi/.emacs.d/blob/master/inits/10-helm.el
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-;") 'helm-for-files)
(define-key global-map (kbd "M-;") 'helm-for-files)
(global-set-key (kbd "C-[ [ a a") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x b") 'helm-bookmarks)
(define-key global-map (kbd "M-s-d") 'helm-apropos)
(define-key global-map (kbd "C-<return>") 'helm-buffer-switch-other-window)

(global-set-key (kbd "M-p") 'helm-resume)
;;(global-set-key (kbd "C-x C-d") 'helm-browse-project) ; https://github.com/emacs-helm/helm-ls-git
(global-set-key (kbd "C-x C-d") 'helm-ls-git-ls) ; https://github.com/emacs-helm/helm-ls-git

(global-set-key (kbd "C-x ,") (quote helm-my-buffers))
(global-set-key (kbd "C-x c g") 'helm-do-ag)
(global-set-key (kbd "C-x c d") 'helm-do-ag-buffers)
(global-set-key (kbd "C-x c k") 'helm-do-ag-this-file)
(global-set-key (kbd "C-x c j") 'helm-do-ag-project-root)

;; http://www.reddit.com/r/emacs/comments/1q6zx2/disable_helmfindfiles_path_autocompletion/
;; helm auto-complete in dired sucks, disable it
(setq helm-ff-auto-update-initial-value nil)

(require 'cl)

;; https://github.com/felix-d/dot-files/blob/e773f0ccbc39f6d858c09fa19735255d2317eec4/.emacs.d/init/helm-setup.el#L5
(setq helm-locate-command
      (ecase system-type
        ('gnu/linux "locate -i -r %s")
        ('berkeley-unix "locate -i %s")
        ('windows-nt "es %s")
        ('darwin "mdfind -name %s %s")
        (t "locate %s")))

(setq-default helm-ff-newfile-prompt-p nil)

(provide 'user-init-helm)
