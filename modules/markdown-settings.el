(use-package markdown-mode
	:commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; it's markdown too
(use-package apib-mode
	:ensure t
	:mode (("\\.apib\\'" . apib-mode)))

(provide 'markdown-settings)
;;; markdown-settings.el ends here
