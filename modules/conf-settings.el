(use-package dockerfile-mode
  :commands dockerfile-mode
	:mode "Dockerfile\\'")

(use-package yaml-mode
  :commands yaml-mode
	:mode "\\.yml\\'")

(use-package toml-mode
  :pin melpa
	:commands toml-mode
	:mode "\\.toml\\'")

(use-package fish-mode
	:mode "\\.fish\\'")

(provide 'conf-settings)
;;; conf-settings.el ends here
