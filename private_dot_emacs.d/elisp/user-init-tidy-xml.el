;; Function to run Tidy HTML parser on buffer, this requires external app Tidy
(defun tidy-buffer-xhtml ()
  "Run Tidy HTML parser on current buffer."
  (interactive)
  (save-excursion
    (if (get-buffer "tidy-html-errs") (kill-buffer "tidy-html-errs"))
    (let ((tmp (concat temporary-file-directory "tidy-html-errs"))
	  (cmd "tidy --force-output true -asxhtml --tidy-mark no --doctype strict --indent-attributes false --wrap-attributes false --vertical-space false -q -i -wrap 100000 -c -f "))
      (shell-command-on-region (point-min) (point-max)
			       (concat cmd tmp)
			       nil 'replace)
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
	  (cmd "tidy -xml --indent-attributes false --tidy-mark no --doctype strict --wrap-attributes false -q -i -wrap 100000 -c -f " ))
      (shell-command-on-region (point-min) (point-max)
			       (concat cmd tmp)
			       nil 'replace)
      (find-file-other-window tmp)
      (other-window 1)
      (enlarge-window (- (- (frame-height) +8) (window-height)))
      (if (file-exists-p tmp) (delete-file tmp))
      (goto-char (point-min))
      )
    (message "buffer tidy'ed")
    )
  )

;; Function to run Tidy xml parser on buffer, this requires external app Tidy
(defun tidy-buffer-xml-indent-attributes ()
  "Run Tidy XML parser on current buffer."
  (interactive)
  (save-excursion
    (if (get-buffer "tidy-xml-errs") (kill-buffer "tidy-xml-errs"))
    (let ((tmp (concat temporary-file-directory "tidy-xml-errs"))
	  (cmd "tidy -xml --indent-attributes true --tidy-mark no --doctype strict --wrap-attributes false -q -i -wrap 100000 -c -f " ))
      (shell-command-on-region (point-min) (point-max)
			       (concat cmd tmp)
			       nil 'replace)
      (find-file-other-window tmp)
      (other-window 1)
      (enlarge-window (- (- (frame-height) +8) (window-height)))
      (if (file-exists-p tmp) (delete-file tmp))
      (goto-char (point-min))
      )
    (message "buffer tidy'ed")
    )
  )



(provide 'user-init-tidy-xml)
