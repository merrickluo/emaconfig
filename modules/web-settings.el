;;; web-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-04-17 18:20:44 Monday by merrick>
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

(use-package indium
	:config
	(add-hook 'js-mode-hook #'indium-interaction-mode))

(use-package nodejs-repl
	:config
	(defun setup-nodejs-repl ()
		(define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
		(define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
		(define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
		(define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl))
	(add-hook 'js-mode-hook #'setup-nodejs-repl))

;; (use-package js-mode
;; 	:ensure nil
;; 	:init
;; 	(setq js-indent-level 2)
;; 	(setq flycheck-eslintrc "")
;; 	(defun my/use-eslint-from-node-modules ()
;; 		(let* ((root (locate-dominating-file
;; 									(or (buffer-file-name) default-directory)
;; 									"node_modules"))
;; 					 (eslint (and root
;; 												(expand-file-name "node_modules/eslint/bin/eslint.js"
;; 																					root))))
;; 			(when (and eslint (file-executable-p eslint))
;; 				(setq-local flycheck-javascript-eslint-executable eslint))))
;; 	(setq flycheck-disabled-checkers '(javascript-jshint))
;; 	(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))

(use-package js2-mode
	:ensure nil
	:init
  (setq js2-basic-offset 2)
	(setq js2-strict-missing-semi-warning nil)
	(setq js2-strict-trailing-comma-warning nil)
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

(use-package json-mode
	:commands (json-mode)
	:mode "\\.json\\'")

(use-package graphql-mode
	:mode "\\.graphql\\'")

;;(use-package tern
;;	:config
;;	(add-hook 'web-mode-hook (lambda () (tern-mode t)))
;;	(add-hook 'js-mode-hook (lambda () (tern-mode t))))

(use-package company-tern
	:config
	(add-to-list 'company-backends 'company-tern)
	(setq company-tern-property-marker " <p>"))

(defun react-js-mode ()
	(interactive)
	(direnv-update-environment)
	(if (equal (getenv "REACT") "1")
      (web-mode)
		(js2-mode)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . react-js-mode))

(use-package web-mode
  :mode "\\.jsx\\'"
	:commands web-mode
	:config
	(add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
	(setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2

        web-mode-code-indent-offset 2
				web-mode-attr-indent-offset 2)
	(setq web-mode-content-types-alist
				'(("jsx" . "\\.js[x]?\\'")))
  (setq js-indent-level 2)
	(add-hook 'web-mode-hook #'(lambda () (smartparens-strict-mode -1) (smartparens-mode t)))
	(use-package flycheck
		:config
		(push 'web-mode (flycheck-checker-get 'javascript-eslint 'modes))))

(use-package groovy-mode
	:config
  (defun gradle-configs ()
		(setq-local c-basic-offset 4)
		(setq-local tab-width 4))
	(add-hook 'groovy-mode-hook #'gradle-configs))

(provide 'web-settings)
;;; web-settings.el ends here
