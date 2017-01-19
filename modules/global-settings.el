;; -*- Emacs-Lisp -*-
;; Last modified: <2017-01-19 10:04:06 Thursday by merrick>

;; Copyright (C) 2017 A.I.

;; Author: A.I.
;; Email: merrick@luois.me

;; Version: 0.1
;; PUBLIC LICENSE: GPLv3

;;; Code:
(use-package helm
	:ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-r" . helm-recentf)))

(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(setq inhibit-splash-screen t)
(setq initial-scratch-message ";; time ticking
")

(use-package projectile
  :init
	(setq projectile-keymap-prefix (kbd "C-x p"))
	:config
	(def-projectile-commander-method ?t
		"Open Terminal in project root"
		(run-term))
	(setq projectile-switch-project-action #'projectile-commander)
	(projectile-global-mode))

;; projectile
(use-package helm-ag)

(use-package helm-projectile
	:after (projectile helm-ag)
	:bind
	(("<f1>" . helm-projectile-find-file)
	 ("<f2>" . helm-projectile-ag))
	:config
	(helm-projectile-on))

(defun run-term()
	(interactive)
	(if (projectile-project-p)
			(projectile-run-term shell-file-name)
		(term shell-file-name)))

;; kill term buffer after exit
(defadvice term-handle-exit
  (after term-kill-buffer-on-exit activate)
(kill-buffer))

(global-set-key (kbd "<f3>") 'run-term)

(use-package yasnippet
	:commands (yas-minor-mode)
	:defer t
	:config
	(add-to-list 'yas-snippet-dirs (concat emacs-root-path "snippets")))

(provide 'global-settings)
;;; global-settings.el ends here
