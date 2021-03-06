(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens-config
  :ensure smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-strict-mode)
	(add-hook 'prog-mode-hook #'show-paren-mode))

(use-package flycheck
	:config
	(add-hook 'prog-mode-hook #'flycheck-mode)
	(add-hook 'emacs-lisp-mode-hook (lambda () (flycheck-mode -1))))

;; (use-package flycheck-pos-tip
;; 	:config
;;   (add-hook 'flycheck-mode-hook #'flycheck-pos-tip-mode))

(use-package yasnippet
	:config
	(add-hook 'prog-mode-hook #'yas-minor-mode))


(provide 'prog-settings)
;;; prog-settings.el ends here
