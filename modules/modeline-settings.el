(use-package smart-mode-line
	:ensure t
	:init
	(use-package smart-mode-line-powerline-theme :ensure t)
	:config
	(display-time)
	(setq sml/theme 'light-powerline)
	(sml/setup))
