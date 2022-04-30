; https://github.com/fperrin/powershell-mode
; http://thread.gmane.org/gmane.emacs.sources/3383
; www.emacswiki.org/emacs/PowerShell

(autoload 'powershell-mode "powershell-mode" "Mode PowerShell" t)
(push '("\\.psm[12]?$" . powershell-mode) auto-mode-alist)
(push '("\\.ps[12]?$" . powershell-mode) auto-mode-alist)

(provide 'user-init-powershell)
