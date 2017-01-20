(use-package go-mode
	:ensure t
  :after (go-eldoc company-go)
	:mode "\\.go\\'"
	:bind
	(:map go-mode-map
				("M-." . godef-jump)
				("M-*" . pop-tag-mark))
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
	(add-hook 'go-mode-hook
						(lambda ()
							(set (make-local-variable 'company-backends) '(company-go)))))

(use-package company-go :defer t)
(use-package go-eldoc
  :defer t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-impl :defer t)

(use-package protobuf-mode
	:mode "\\.proto\\'")
