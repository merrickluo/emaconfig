(use-package go-mode
	:ensure t
  :after (go-eldoc go-autocomplete)
  :commands (gofmt gofmt-before-save)
  :mode "\\.go\\'"
	:bind
	(("M-." . godef-jump)
	 ("M-*" . pop-tag-mark))
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
	(add-hook 'go-mode-hook
						(lambda ()
							(set (make-local-variable 'company-backends) '(company-go)))))

(use-package flycheck
	:ensure t
	:config
	(add-hook 'go-mode-hook flycheck-mode))

(use-package company-go
	:ensure t
	:defer t
	:after (go-mode))

(use-package go-eldoc
	:ensure t
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package protobuf-mode
	:mode "\\.proto\\'")
