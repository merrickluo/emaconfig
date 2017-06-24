;;; project-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-06-24 11:02:27 Saturday by merrick>
;; Copyright (C) 2017 A.I. all rights reserved.
;; PUBLIC LICENSE: GPLv3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package perspective
	:config
	(persp-mode))

(use-package persp-projectile
	:demand t)

(defun capture-todo-comment (&optional line)
  (let ((c
				 (save-excursion
					 (save-window-excursion
						 (switch-to-buffer (plist-get org-capture-plist :original-buffer))
						 comment-start)
					 )))
    (while (string-prefix-p c line)
      (setq line (string-remove-prefix c line)))
    (comment-string-strip line t t)))

;; TODO hello world
(use-package org-projectile
	:demand t
  :bind (("C-c n p" . org-projectile:project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
	(org-projectile:per-repo)
	(setq org-projectile:per-repo-filename "todos.org")
	(setq org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
	(setq project-todo-template "* %(capture-todo-comment \"%i\") %?\n  %l")
	(add-to-list 'org-capture-templates (org-projectile:project-todo-entry "p" project-todo-template)))

(provide 'project-settings)
;;; project-settings.el ends here
