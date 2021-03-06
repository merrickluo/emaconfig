;; (use-package nvm
;; 	:config
;; 	(nvm-use (caar (last (nvm--installed-versions))))
;; 	(push (concat (cadr nvm-current-version) "/bin") exec-path))

(use-package indium
	:config
	(add-hook 'js2-mode-hook #'indium-interaction-mode)
	(setq indium-update-script-on-save t))

(use-package nodejs-repl
	:config
	(defun setup-nodejs-repl ()
		(define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
		(define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
		(define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
		(define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl))
	(add-hook 'js-mode-hook #'setup-nodejs-repl))

(use-package json-mode
	:commands (json-mode)
	:mode "\\.json\\'")

(use-package graphql-mode
	:mode "\\.graphql\\'")

(use-package tern
	:config
	(add-hook 'web-mode-hook (lambda () (tern-mode nil)))
	(add-hook 'js-mode-hook (lambda () (tern-mode nil)))
	(add-hook 'js2-mode-hook (lambda () (tern-mode nil))))

(use-package company-tern
	:config
	(add-to-list 'company-backends 'company-tern)
	(setq company-tern-property-marker " <p>"))

(use-package js-doc
	:after js2-mode
	:bind (:map js2-mode-map
							("C-c i" . js-doc-insert-function-doc)))

(use-package js2-mode
	:config
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
	(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

	(setq js-indent-level 2)
	(setq js2-basic-offset 2)
	(setq js2-mode-show-strict-warnings nil)
	(setq js2-include-node-externs t))

(use-package js2-refactor
	:after js2-mode
	:config
	(add-hook 'js2-mode-hook 'js2-refactor-mode))

(use-package rjsx-mode
	:after js2-mode
	:mode "\\.js\\'"
	:config
	(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode)))

;; (use-package web-mode
;; 	:config
;; 	;; eslint
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
;; 	(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; 	(setq web-mode-content-types-alist
;; 				'(("jsx" . "\\.js[x]?\\'")))

;; 	;; comment
;; 	(add-to-list 'web-mode-comment-formats '("javascript" . "//"))
;; 	(add-to-list 'web-mode-comment-formats '("jsx" . "//"))

;; 	;; indent
;; 	(setq web-mode-markup-indent-offset 2
;;         web-mode-css-indent-offset 2
;;         web-mode-code-indent-offset 2
;; 				web-mode-attr-indent-offset 2
;; 				js2-basic-offset 2)
;; 	(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
;; 	(add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
;;   (setq js-indent-level 2)
;; 	(add-hook 'web-mode-hook #'(lambda () (smartparens-strict-mode -1) (smartparens-mode t))))

(use-package flycheck
	:config
	(push 'web-mode (flycheck-checker-get 'javascript-eslint 'modes)))

(use-package web-beautify)

(provide 'web-settings)
;;; web-settings.el ends here
