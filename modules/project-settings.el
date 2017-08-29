;;; project-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-08-29 14:54:55 Tuesday by merrick>
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
	(org-projectile-per-project)
	(setq org-projectile-per-project-filepath "my_project_todo_filename.org")
	(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
	(global-set-key (kbd "C-c c") 'org-capture)
	(global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read))

(provide 'project-settings)
;;; project-settings.el ends here
