(use-package perspective
	:demand t
	:config
	(use-package persp-projectile
		:demand t
		:config
		(persp-mode)))

;; (use-package perspeen
;; 	:demand t
;;   :init
;;   (setq perspeen-use-tab nil)
;; 	:bind
;; 	(("C-z x" . perspeen-tab-del)
;; 	 ("C-z l" . perspeen-tab-next)
;; 	 ("C-z h" . perspeen-tab-prev))
;;   :config
;; 	(perspeen-mode)
;; 	(defun workspace-projectile()
;;     (perspeen-change-root-dir (projectile-project-root))
;; 		(perspeen-rename-ws (projectile-project-name)))
;; 	(add-hook 'projectile-after-switch-project-hook 'workspace-projectile))

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

(setq tramp-default-method "ssh")

(provide 'project-settings)
;;; project-settings.el ends here
