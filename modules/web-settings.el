;;; web-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-03-28 00:10:23 Tuesday by merrick>
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
;;; Code:

;; (use-package nvm
;; 	:config
;; 	(nvm-use (caar (last (nvm--installed-versions))))
;; 	(push (concat (cadr nvm-current-version) "/bin") exec-path))

(push (concat (getenv "HOME") "/.asdf/shims") exec-path)

(use-package jade
	:config
	(add-hook 'js-mode-hook #'jade-interaction-mode))

(use-package js-mode
	:ensure nil
	:init
	(setq js-indent-level 2)
	(setq flycheck-eslintrc "")
	(defun my/use-eslint-from-node-modules ()
		(let* ((root (locate-dominating-file
									(or (buffer-file-name) default-directory)
									"node_modules"))
					 (eslint (and root
												(expand-file-name "node_modules/eslint/bin/eslint.js"
																					root))))
			(when (and eslint (file-executable-p eslint))
				(setq-local flycheck-javascript-eslint-executable eslint))))
	(setq flycheck-disabled-checkers '(javascript-jshint))
	(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))

;; (use-package json-mode
;; 	:commands (json-mode)
;; 	:mode "\\.json\\'")

(use-package graphql-mode
	:mode "\\.graphql\\'")

(use-package tern
	:config
	(add-hook 'js-mode-hook (lambda () (tern-mode t))))

(use-package company-tern
	:config
	(add-to-list 'company-backends 'company-tern)
	(setq company-tern-property-marker " <p>"))

(defun react-js-mode ()
	(if (equal (getenv "REACT") "1")
      (web-mode)
		(js-mode)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . react-js-mode))

(use-package web-mode
  :mode "\\.jsx\\'"
	:commands web-mode
	:config
	(setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)
	(setq web-mode-content-types-alist
				'(("jsx" . "\\.js[x]?\\'")))
  (setq js-indent-level 2)
	(use-package flycheck
		:config
		(push 'web-mode (flycheck-checker-get 'javascript-eslint 'modes))))

(provide 'web-settings)
;;; web-settings.el ends here
