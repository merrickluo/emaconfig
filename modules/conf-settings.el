(use-package dockerfile-mode
	:ensure t
	:mode (("Dockerfile\\'" . dockerfile-mode)))

(use-package yaml-mode
	:ensure t
	:mode (("\\.yml\\'" . yaml-mode)))

(use-package toml-mode
  :pin melpa
	:mode (("\\.toml\\'" . toml-mode)))
