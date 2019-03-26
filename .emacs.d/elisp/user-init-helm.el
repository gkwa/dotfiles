(ensure-package-installed 'helm)
(require 'helm)
(require 'helm-config)
(require 'cl)

(defun helm-my-buffers ()
  (interactive)
  (helm-other-buffer
   '(helm-c-source-recentf
	 helm-c-source-buffers-list
	 helm-c-source-bookmarks
	 helm-c-source-files-in-current-dir
	 helm-c-source-buffer-not-found)
   "*helm-my-buffers*"))

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
(define-key global-map (kbd "M-;") 'helm-for-files)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "M-p") 'helm-resume)
(define-key global-map (kbd "M-p") 'helm-resume)

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
