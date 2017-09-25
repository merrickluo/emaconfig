(use-package eclim
	:config
	(setq eclim-autostart t)
	(defun start-eclim()
		(eclim-mode t))
	(add-hook 'java-mode-hook 'start-eclim))

(provide 'java-settings)
;;; java-settings.el ends here
