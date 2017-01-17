(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens-config
  :ensure smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-strict-mode)
	(add-hook 'prog-mode-hook #'show-paren-mode))


