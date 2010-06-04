;;; google-search.el --- 

;; Copyright (C) 2010  Taylor Monacelli

;; Author: Taylor Monacelli <taylormonacelli@demolap.local>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 


(require 'url)

(defvar google-search-maxlen 50
  "Maximum string length of search term.  This prevents you from accidentally
sending a five megabyte query string to Netscape.")

(defun google-it (search-string)
  "Search for SEARCH-STRING on google."
  (interactive "sSearch for: ")
  (browse-url (concat "http://www.google.com/search?client=emacs&q="
                      (url-hexify-string
                       (encode-coding-string search-string 'utf-8)))))

(defun google-search-selection ()
  "Create a Google search URL and send it to your web browser."
  (interactive)
  (let (start end term url)
    (if (or (not (fboundp 'region-exists-p)) (region-exists-p))
        (progn
          (setq start (region-beginning)
                end   (region-end))
          (if (> (- start end) google-search-maxlen)
              (setq term (buffer-substring start (+ start google-search-maxlen)))
            (setq term (buffer-substring start end)))
          (google-it term))
      (beep)
      (message "Region not active"))))

(provide 'google-search)


;;; Code:



(provide 'google-search)
;;; google-search.el ends here
