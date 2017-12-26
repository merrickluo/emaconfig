;; behavior settings
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(setq inhibit-splash-screen t)
(setq initial-scratch-message ";; time ticking
")

(global-set-key (kbd "C-c C-d") 'c-hungry-delete-forward)
(global-set-key (kbd "<f5>") 'revert-buffer)

(defun kill-current-buffer()
	(interactive)
	(kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; kill term buffer after exit
(defadvice term-handle-exit
		(after term-kill-buffer-on-exit activate)
	(kill-buffer))

;; hlem
;; (use-package helm
;; 	:defer t
;;   :bind (("M-x" . helm-M-x)
;;          ("C-x C-f" . helm-find-files)
;;          ("C-x C-b" . helm-buffers-list)
;;          ("C-x C-r" . helm-resume)))

(if (not (string-equal system-type "windows-nt"))
		(use-package exec-path-from-shell
			:config
			(exec-path-from-shell-initialize)))

;; projectile
(use-package projectile
	:demand t
	:init
	(setq projectile-keymap-prefix (kbd "C-x p"))
	:bind (([f1] . smart-find-file)
				 ([f2] . smart-ag))
	:config
	(defun smart-find-file()
		(interactive)
		(if (projectile-project-p)
				(projectile-find-file)
			(counsel-find-file)))
	(defun smart-ag()
		(interactive)
		(let ((text (substring-no-properties (or (thing-at-point 'symbol) ""))))
			(if (projectile-project-p)
					(counsel-ag text (projectile-project-root))
				(counsel-ag text))))
	(def-projectile-commander-method ?t
		"Open Terminal in project root"
		(run-term))
	(setq projectile-completion-system 'ivy)
	(setq projectile-switch-project-action #'projectile-dired)
	(setq projectile-enable-caching nil)
	(projectile-global-mode))

(use-package swiper
	:commands (swiper ivy-resume)
	:config
	(setq counsel-grep-base-command
				"rg -i -M 120 --no-heading --line-number --color never '%s' %s")
	(defun smart-swiper ()
		(interactive)
		(let ((text (substring-no-properties (or (thing-at-point 'symbol) ""))))
			(swiper text)))
	:bind
	(("C-s" . smart-swiper)
	 ("C-c r" . ivy-resume)))

(use-package wgrep)
(use-package iedit)

(use-package ivy-rich
	:pin melpa
	:after swiper
	:config
	(use-package cl)
	(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
	(setq ivy-virtual-abbreviate 'full
				ivy-rich-switch-buffer-align-virtual-buffer t))


(use-package counsel
	:commands (counsel-M-x)
	:bind
	(("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-h f" . counsel-describe-function)
	 ("C-h v" . counsel-describe-variable)
	 ("C-h i" . counsel-info-lookup-symbol)
	 ("C-x b" . ivy-switch-buffer)
	 ([f1] . counsel-projectile-find-file)
	 (:map read-expression-map
				 ("C-r" . counsel-expression-history))))

;; (use-package counsel-projectile
;; 	:pin melpa
;; 	:config
;; 	(ivy-set-display-transformer 'counsel-projectile
;; 															 'ivy-rich-switch-buffer-transformer)
;; 	(ivy-set-display-transformer 'counsel-projectile-switch-to-buffer
;; 															 'ivy-rich-switch-buffer-transformer)
;; 	(counsel-projectile-mode))

(use-package yasnippet
	:commands (yas-minor-mode)
	:defer t
	:config
	(add-to-list 'yas-snippet-dirs (concat emacs-root-path "snippets"))
	(yas-reload-all))

(use-package terminal-here
	:bind (([f3] . smart-run-term))
	:config
	(setq terminal-here-terminal-command (list "xfce4-terminal"))
	(defun smart-run-term()
    (interactive)
		(if (projectile-project-p)
				(terminal-here-project-launch)
			(terminal-here-launch))))

(use-package ace-window
	:bind (("C-x o" . ace-window)))

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
	:bind (("C-x d" . dired-sidebar-toggle-sidebar)))

(provide 'global-settings)
;;; global-settings.el ends here
