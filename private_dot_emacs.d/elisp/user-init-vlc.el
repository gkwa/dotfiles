;; curl -g 'http://localhost:8080/requests/status.xml?command=seek&val=-10'
(defun vlc-jump-back-a-little ()
  (interactive)
  (require 'request)

  (request
   "http://localhost:8080/requests/status.xml"
   :params '(("command" . "seek") ("val" . "-2"))
   :parser 'json-read
   :success (function*
	     (lambda (&key data &allow-other-keys)
	       (message "I sent: %S" (assoc-default 'args data))))))


;; M-n
(global-set-key [27 110] (quote vlc-jump-back-a-little))

(defun vlc-pause ()
  (interactive)
  (require 'request)

  (request
   "http://localhost:8080/requests/status.xml"
   :params '(("command" . "pl_pause"))
   :parser 'json-read
   :success (function*
	     (lambda (&key data &allow-other-keys)
	       (message "I sent: %S" (assoc-default 'args data))))))

;; M-g p
(global-set-key [27 103 112] (quote vlc-pause))

(provide 'user-init-vlc)
