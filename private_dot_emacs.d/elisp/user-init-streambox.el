(defun flipunc ()
  (interactive)
  (save-excursion
    (save-restriction
      (progn
		(back-to-indentation)
		(setq bor (point))
		(end-of-line)
		(setq eol (point))
		(narrow-to-region bor eol)
		(back-to-indentation)
		(if (looking-at "^/volume1")
			(progn
			  (replace-string "/volume1" "\\\\10.0.2.218") (goto-char 0)
			  (replace-string "/" "\\") )
		  (if (looking-at "^\\\\")
			  (progn
				(let ((fullpath (buffer-string)))
				  (end-of-line)
				  (delete-horizontal-space) (insert-char ?\  1)
				  (let ((cp (point)))
					(insert fullpath)
					(delete-horizontal-space)            (goto-char cp)
					(replace-string "\\\\" "file://///") (goto-char cp)
					(replace-string "\\" "/")            (goto-char cp)
					(replace-string " " "\%20")          (goto-char cp)
					(goto-char 0)
					(insert "[") (goto-char (point-max))
					(transpose-regions (+ (point-min) 1) (- cp 1) (+ 1 cp) (- (point-max) 1))
					(insert "]"))))
			(if (looking-at "^ *\\[file://///10.0.2.218/")
				(progn
				  (goto-char (- (point-max) 1))
				  (delete-char 1)
				  (beginning-of-line) (delete-char 1)
				  (let ((sp (search-forward " ")))
					(delete-region (point-min) sp)
					(beginning-of-line) (replace-string "\\\\10.0.2.218" "http://10.0.2.218")
					(beginning-of-line) (replace-string "\\" "/")
					(beginning-of-line) (replace-string " " "%20")))
			  (if (looking-at "^ *http://10.0.2.218")
				  (progn
					(beginning-of-line) (replace-string "http://10.0.2.218" "//10.0.2.218")
					(beginning-of-line) (replace-string "%20" " "))
				(if (looking-at "^ *//10.0.2.218")
					(progn
					  (beginning-of-line) ; rem, we've already narrowed to line above
					  (replace-string "//10.0.2.218" "http://dl.dropbox.com/u/9140609"))
				  (if (looking-at "http://dl.dropbox.com/u/9140609")
					  (progn
						(beginning-of-line)
						(replace-string "http://dl.dropbox.com/u/9140609" "/volume1"))))))))))))

(defun capture_full_path ()
  (interactive)
  (save-excursion
    (save-restriction
      (progn
		(let ((cp (point)))
		  (end-of-line)
		  (let ((fullpath
				 (concat
				  (expand-file-name dired-directory)
				  (buffer-substring cp (point)))))
			(message "%s" fullpath)
			(kill-new fullpath)))))))

(provide 'user-init-streambox)
