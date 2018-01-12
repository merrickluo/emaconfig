(use-package groovy-mode
	:config
  (defun gradle-configs ()
		(setq-local c-basic-offset 4)
		(setq-local tab-width 4))
	(add-hook 'groovy-mode-hook #'gradle-configs))

(use-package eclim
	:config
	(setq eclim-autostart t)
	(defun start-eclim()
		(eclim-mode t))
	(add-hook 'java-mode-hook 'start-eclim))

(provide 'java-settings)
;;; java-settings.el ends here
