(defun js-mode-bindings ()
"Sets a hotkey for using the json-snatcher plugin"
	 (when (string-match  "\\.json$" (buffer-name))
        (local-set-key (kbd "C-c C-g") 'jsons-print-path)))
(add-hook 'js-mode-hook 'js-mode-bindings)
(add-hook 'js2-mode-hook 'js-mode-bindings)

(provide 'user-init-json-snatcher)


