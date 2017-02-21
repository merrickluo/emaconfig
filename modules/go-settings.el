;;; go-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-21 17:21:03 Tuesday by merrick>
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

(use-package go-mode
	:commands (godef-jump go-mode)
	:mode "\\.go\\'"
	:bind
	(:map go-mode-map
				("M-." . godef-jump)
				("M-*" . pop-tag-mark))
  :config
	(add-hook 'before-save-hook 'gofmt-before-save))

(use-package company-go
	:after go-mode
	:config
	(add-hook 'go-mode-hook
						(lambda ()
							(set (make-local-variable 'company-backends) '(company-go)))))

(use-package go-impl
	:after go-mode)

(use-package go-add-tags
	:after go-mode)

(use-package go-eldoc
	:after go-mode
	:config
	(add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-direx
	:after go-mode
	:bind (:map go-mode-map
							("C-c C-j" . go-direx-pop-to-buffer)))

(use-package protobuf-mode
	:mode "\\.proto\\'")

(provide 'go-settings)
;;; go-settings.el ends here
