;;; global-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-16 23:45:51 Thursday by merrick>
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
;; behavior settings

(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(setq inhibit-splash-screen t)
(setq initial-scratch-message ";; time ticking
")

;; kill term buffer after exit
(defadvice term-handle-exit
		(after term-kill-buffer-on-exit activate)
	(kill-buffer))

;; hlem
(use-package helm
	:defer t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-r" . helm-recentf)))

;; projectile
(use-package projectile
	:init
	(setq projectile-keymap-prefix (kbd "C-x p"))
	:config
	(def-projectile-commander-method ?t
		"Open Terminal in project root"
		(run-term))
	(setq projectile-switch-project-action #'projectile-commander)
	(setq projectile-enable-caching t)
	(projectile-global-mode))

(use-package helm-projectile
	:pin melpa
	:after (projectile)
	:bind
	(("<f1>" . helm-projectile-find-file)
	 ("<f2>" . helm-projectile-ag))
	:config
	(use-package helm-ag)
	(helm-projectile-on))

(defun projectile-run-multi-term (program)
	"Run multi-term in project root, PROGRAM is shell to run."
	(interactive)
  (let* ((term (concat "multi-term " (projectile-project-name)))
         (buffer (concat "*" term "*")))
    (unless (get-buffer buffer)
      (require 'term)
      (let ((program (or program
                         (read-from-minibuffer "Run program: "
                                               (or explicit-shell-file-name
                                                   (getenv "ESHELL")
                                                   (getenv "SHELL")
                                                   "/bin/sh")))))
        (projectile-with-default-dir (projectile-project-root)
          (set-buffer (make-term term program))
          (term-mode)
          (term-char-mode))))
    (switch-to-buffer buffer)))

(defun run-term()
	(interactive)
	(if (projectile-project-p)
			(projectile-run-multi-term shell-file-name)
		(multi-term shell-file-name)))

(global-set-key (kbd "<f3>") 'run-term)

(use-package yasnippet
	:commands (yas-minor-mode)
	:defer t
	:config
	(add-to-list 'yas-snippet-dirs (concat emacs-root-path "snippets"))
	(yas-reload-all))

(use-package multi-term
	:pin melpa)

(use-package ace-window
	:bind (("C-x o" . ace-window)))

(provide 'global-settings)
;;; global-settings.el ends here
