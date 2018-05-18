(use-package company
  :hook
  (eshell-mode . (lambda () (company-mode -1)))
	:config
	(define-key company-active-map (kbd "C-n") 'company-select-next)
	(define-key company-active-map (kbd "C-p") 'company-select-previous)
	(define-key company-search-map (kbd "C-n") 'company-select-next)
	(define-key company-search-map (kbd "C-p") 'company-select-previous)
	(global-company-mode)
	(setq company-idle-delay 0)
	(setq company-dabbrev-downcase nil)
	(setq company-minimum-prefix-length 2))

;; (use-package company-flx
;;   :pin melpa
;;   :after (company)
;;   :config
;;   (company-flx-mode))

(provide 'company-settings)
;;; company-settings.el ends here
