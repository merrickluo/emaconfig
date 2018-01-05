(use-package org
  :ensure org-plus-contrib
	:pin org
	:config

	(defun org-insert-bangumi ()
		(interactive)
		(save-excursion
			(let ((name (read-string "Bangumi Name: "))
						(length (read-number "Bangumi length: ")))
				(insert "** " name " [/] \n")
				(dotimes (index length)
					(insert (format "\t- [ ] Episode %d \n" (+ index 1))))))
		(call-interactively 'org-update-statistics-cookies))

	(add-hook 'org-mode-hook 'yas-minor-mode)
	(setq org-directory "~/Dropbox/docs")
	(setq org-agenda-files '("~/Dropbox/docs"))
	:bind (("C-c a" . org-agenda)))
(provide 'org-settings)
;;; org-settings.el ends here
