(use-package company
  :config
	(global-company-mode)
	(setq company-idle-delay 0)
	(setq company-minimum-prefix-length 2))

;; (use-package company-flx
;;   :pin melpa
;;   :after (company)
;;   :config
;;   (company-flx-mode))
