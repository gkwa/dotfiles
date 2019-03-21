;; ;; ------------------------------
;; ;; org-crypt
;; ;; ------------------------------
;; ;; http://doc.norang.ca/org-mode.html#HandlingEncryption
;; (require 'org-crypt)
;;					; Encrypt all entries before saving
;; (org-crypt-use-before-save-magic)
;; (setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;					; GPG key to use for encryption
;; (setq org-crypt-key "F0B66B40")

;; --------------------------------------------------
;; http://twitch.nervestaple.com/2011/10/09/blogging_with_emacs/
;; Note: An Odd Issue

;; Recently, for now reason I can discern, publishing my weblog
;; project would fail after attempting to export the first page to
;; HTML. Org Mode would export the file to HTML and then copy the
;; exported text to the clipboard, this should be text but it wasn't
;; and this was breaking the project export process.

;; Adding the following line to my Org Mode setup fixed this
;; issue. What would I do with that buffer of HTML anyway?
(setq org-export-copy-to-kill-ring nil)

(provide 'user-init-org-crypt)
