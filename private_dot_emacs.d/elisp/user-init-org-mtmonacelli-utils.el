(defun reformat-paragraph-with-line-spacing-to-end-of-file()
  "do stuff"
  (interactive)
  (save-excursion
    (while (not (eobp))
      (reformat-paragraph-with-line-spacing)
      (re-search-forward "[[:space:]]*"))))

(defun reformat-paragraph-with-line-spacing ()
  "do mything"
  (interactive)
  (catch 'mytag
    (progn
      (show-all)
      (org-beginning-of-line)
      (if (looking-at "[[:space:]]*#\\+begin_")
          ;; pre
          (progn
            (re-search-forward "[[:space:]]*#\\+end_")
            (next-line)
            (throw 'mytag "non-local exit value")))
      (if (looking-at "[[:space:]]*\\*+\n")
          (progn
            (re-search-forward "\\*+")
            (insert " ")
            (throw 'mytag "non-local exit value")))
      (if (looking-at "[[:space:]]*\|")
          ;; table
          (progn
            (search-forward "|")
            (org-fill-paragraph)
            (re-search-forward "^[^\|]")
            (throw 'mytag "non-local exit value")))
      (if (looking-at "\\*+[[:space:]]+")
          ;; list
          (progn
            (next-line)
            (throw 'mytag "non-local exit value")))
      (if (looking-at "[[:space:]]*\n\\*+[[:space:]]+")
          ;; list
          (progn
            (re-search-forward "^\\*")
            (next-line)
            (throw 'mytag "non-local exit value")))
      (if (looking-at "[[:space:]]*\\(-\\|\\*?[[:digit:]]+\\.\\)")
          ;; list
          (progn
            (re-search-forward "[[:space:]]*")
            (org-mark-element)
            (org-fill-paragraph)
            (org-forward-element)
            (throw 'mytag "non-local exit value")))
      (if (looking-at "\\*+[[:space:]]")
          (progn
            (next-line)
            (throw 'mytag "non-local exit value")))
      (if (looking-at "#")
          (progn
            (org-forward-element)))
      (progn
        (delete-horizontal-space)
        (open-line 1)
        (forward-char)
        (fill-paragraph)
        (forward-line -1)
        (dotimes '2 (delete-blank-lines))
        (open-line 1)
        (org-forward-sentence)
        (delete-horizontal-space)
        (open-line 2)
        (forward-char 2)
        (fill-paragraph)
        (forward-line -1)
        (dotimes '2 (delete-blank-lines))
        (open-line 1)))))

(provide 'user-init-org-mtmonacelli-utils)
