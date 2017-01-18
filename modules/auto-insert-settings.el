;; -*- Emacs-Lisp -*-
;; Last modified: <2017-01-18 21:02:20 Wednesday by merrick>

;; Copyright (C) 2017 A.I.

;; Author: A.I.
;; Email: merrick@luois.me

;; Version: 0.1
;; PUBLIC LICENSE: GPLv3

;;; Code:
(setq auto-insert-query nil
      auto-insert-directory "~/.emacs.d")

(defun insert-snippet (snippet)
  "Insert snippet SNIPPET."
  (interactive "s")
  (insert snippet)
  (yas-expand))

(defun insert-headx-snippet ()
  "Insert headx snippet."
  (insert-snippet "headx"))

(defun insert-abbrev (abbrev-name)
  "Insert abbrev ABBREV-NAME"
  (interactive "s")
  (insert abbrev-name)
  (expand-abbrev))

;; C/C++ head file.
(define-auto-insert "\\.\\([Hh]\\|hh\\|hxx\\|hpp\\)$"
  '(lambda()
     (insert-snippet "headxh")))

;; Add plan Snippet.
(define-auto-insert "\\.\\(todo\\|do\\|plan\\)$"
  '(lambda()
     (insert-snippet "headxplan")))

;; Flex snippet.
(define-auto-insert "\\.l[l]?$"
  '(lambda()
     (insert-snippet "headxflex")))

(mapc
 (lambda (suffix)
   (define-auto-insert (concat "\\." suffix "$") 'insert-headx-snippet))
 '("[Cc][Pp][Pp]"      ;; C++
   "[Cc][Xx][Xx]"      ;; C++
   "[Tt]?[Cc][Cc]"     ;; C++
   "i"                 ;; C++
   "js"                ;; js
   "CMakeLists.txt"    ;; js
   "makefile"          ;; makefile
   "headx"             ;; snippet
   "y[s]?"             ;; yassnippet
   "yy"                ;; bison
   "clj[xs]?"          ;; clojure
   "[Yy][Aa]?[Mm][Ll]" ;; YAML
   "el"                ;; elisp
   "sh"                ;; shell
   "org"               ;; org
   "pl"
   "py"                ;; python
   "htm\\(l\\)?"))

(auto-insert-mode 1)

;; time-stamp settings. Change modified style
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-start "Last modified:[ \t]+\\\\?[\"<]+"
      time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S %:a by %u"
      time-stamp-end "\\\\?[\">]")


(provide 'auto-insert-settings)
;; auto-insert-settings.el ends here
