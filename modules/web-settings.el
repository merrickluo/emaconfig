;;; web-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-03-02 21:00:25 Thursday by merrick>
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

(use-package nvm
	:config
	(nvm-use (caar (last (nvm--installed-versions))))
	(push (concat (cadr nvm-current-version) "/bin") exec-path))

(use-package jade)

(use-package js2-mode
	:commands (js2-mode)
	:mode (("\\.js\\'" . js2-mode))
  :config
	(setq js2-basic-offset 2)
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
	(setq js2-strict-missing-semi-warning nil)
	(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
	(add-hook 'js2-mode-hook (lambda () (setq-local indent-tabs-mode nil))))

(use-package json-mode
	:commands (json-mode)
	:mode "\\.json\\'")

(use-package graphql-mode
	:mode "\\.graphql\\'")

(use-package company-tern
	:config
	(add-to-list 'company-backends 'company-tern)
	(setq company-tern-property-marker " <p>"))

(use-package tern
	:config
	(add-hook 'js2-mode-hook (lambda () (tern-mode t))))

(provide 'web-settings)
;;; web-settings.el ends here
