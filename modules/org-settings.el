(use-package org
  :ensure org-plus-contrib
	:pin org
	:config
	(add-hook 'org-mode-hook 'yas-minor-mode)
	(setq org-directory "~/Dropbox/docs")
	(setq org-agenda-files '("~/Dropbox/docs"))
	:bind (("C-c a" . org-agenda)))

(provide 'org-settings)
;;; org-settings.el ends here
