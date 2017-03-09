;;; prog-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-03-03 20:45:50 Friday by merrick>
;; Copyright (C) 2017 A.I. all rights reserved.
;; PUBLIC LICENSE: GPLv3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change log:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;;
;;; Code:

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
	(add-hook 'prog-mode-hook #'flycheck-mode))

(use-package flycheck-pos-tip
	:config
  (add-hook 'flycheck-mode-hook #'flycheck-pos-tip-mode))

(use-package yasnippet
	:config
	(add-hook 'prog-mode-hook #'yas-minor-mode))


(provide 'prog-settings)
;;; prog-settings.el ends here
