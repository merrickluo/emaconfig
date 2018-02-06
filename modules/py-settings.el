(use-package anaconda-mode
	:config
	(setq python-shell-interpreter "python")
	(add-hook 'python-mode-hook 'anaconda-mode)
	(add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
	:config
	(add-to-list 'company-backends 'company-anaconda))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
	(require 'subr-x)
  (with-temp-buffer
    (insert-file-contents filePath)
    (string-trim (buffer-string))))

(use-package pyenv-mode
	:config
	(defun projectile-pyenv-mode-set ()
		(interactive)
		"Set pyenv version matching project name."
		(let ((python-version-file (concat (projectile-project-root) ".python-version")))
			(if (file-exists-p python-version-file)
          (let ((python-version (get-string-from-file python-version-file)))
						(if (member python-version (pyenv-mode-versions))
								(pyenv-mode-set python-version)
							(pyenv-mode-unset)))
				(pyenv-mode-unset))))
	(add-hook 'persp-switch-hook 'projectile-pyenv-mode-set)
	(add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set))

(provide 'py-settings)
;;; py-settings.el ends here
