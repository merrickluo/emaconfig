(setq x-gtk-use-system-tooltips nil)

(use-package arch-packer
	:config
	(setq arch-packer-default-command "pacaur"))

(use-package direnv
	:config
	(direnv-mode))

(use-package pinentry
	:config
	(pinentry-start))

(provide 'arch-settings)
;;; arch-settings.el ends here
