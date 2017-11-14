(use-package anaconda-mode
	:config
	(add-hook 'python-mode-hook 'anaconda-mode)
	(add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
	:config
	(add-to-list 'company-backends 'company-anaconda))

(use-package pyenv-mode
	:config
	(defun projectile-pyenv-mode-set ()
		(interactive)
		"Set pyenv version matching project name."
		(let ((project (projectile-project-name)))
			(if (member project (pyenv-mode-versions))
					(pyenv-mode-set project)
				(pyenv-mode-unset))))
	(add-hook 'persp-switch-hook 'projectile-pyenv-mode-set)
	(add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set))

(provide 'py-settings)
;;; py-settings.el ends here
