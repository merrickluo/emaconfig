(use-package company
	:ensure t
	:config
	(add-hook 'after-init-hook 'global-company-mode)
	(setq company-idle-delay 0)
	(setq company-minimum-prefix-length 2))
