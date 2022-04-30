(require 'helm)

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

(setq-default helm-ff-newfile-prompt-p nil)

(provide 'user-init-helm)
