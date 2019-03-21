;; don't prompt to kill subshell
;; don't ask about killing subprocesses when killing emacs, just kill
;; off all children without question
;; http://stackoverflow.com/questions/2706527/make-emacs-stop-asking-active-processes-exist-kill-them-and-exit-anyway

(setenv "PS1" "\\u@\h \\W$ ")

(add-hook 'comint-exec-hook
		  (lambda () (process-kill-without-query
					  (get-buffer-process (current-buffer)))))

(setq-default comint-completion-addsuffix t)
(setq-default comint-completion-autolist t)
(setq-default comint-input-ignoredups t)
(setq-default comint-scroll-show-maximum-output t)
(setq-default comint-scroll-to-bottom-on-input t)

(provide 'user-init-shell)
