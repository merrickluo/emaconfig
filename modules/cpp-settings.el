(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path
                           (list "/usr/include/SDL2/"))))

(use-package cmake-mode)
(use-package irony
	:config
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'c-mode-hook 'irony-mode)
	(add-hook 'objc-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
	:after (irony)
	:config
	(add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
	:after (irony)
	:config
	(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
	(setq))

(use-package irony-eldoc
	:after (irony)
	:config
	(add-hook 'irony-mode-hook #'irony-eldoc))

(provide 'cpp-settings)
;;; cpp-settings.el ends here
