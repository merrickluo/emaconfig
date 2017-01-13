;; helm
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

(setq default-frame-alist
      '(
        (width . 150) ; character
        (height . 50) ; lines
        ))

(setq init-frame-alist
      '(
        (width . 150) ; character
        (height . 50) ; lines
        ))

(use-package projectile
	:ensure t
	:demand t
	:bind
	(("<f3>" . run-term))
	:init
	(setq projectile-keymap-prefix (kbd "C-x p"))
	:config
	(def-projectile-commander-method ?t
		"Open Terminal in project root"
		(run-term))
	(setq projectile-switch-project-action #'projectile-commander)
	(projectile-mode))

;; projectile
(use-package helm-projectile
	:ensure t
	:after (projectile)
	:init
	:bind
	(("<f1>" . helm-projectile-find-file))
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
	
(use-package helm-pt
	:after (helm)
	:ensure t
	:bind
	(("<f2>" . helm-projectile-pt)))
