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

(defadvice server-create-window-system-frame
  (after set-window-system-frame-colours ())
  "Set custom frame colours when creating the first frame on a display"
  (message "Running after frame-initialize")
  (setup-window-system-frame-colours))
(ad-activate 'server-create-window-system-frame)

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

(provide 'user-init-client-server)
