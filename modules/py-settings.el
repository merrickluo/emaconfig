;;; py-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-08-01 14:27:48 Tuesday by merrick>
;; Copyright (C) 2017 A.I. all rights reserved.
;; PUBLIC LICENSE: GPLv3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
(use-package anaconda-mode
	:config
	(use-package company-anaconda)
	(add-hook 'python-mode-hook 'anaconda-mode)
	(add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package pyenv-mode
	:config
	(defun projectile-pyenv-mode-set ()
		"Set pyenv version matching project name."
		(let ((project (projectile-project-name)))
			(if (member project (pyenv-mode-versions))
					(pyenv-mode-set project)
				(pyenv-mode-unset))))

	(add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set))



(provide 'py-settings)
;;; py-settings.el ends here
