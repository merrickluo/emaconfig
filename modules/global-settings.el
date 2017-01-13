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

;; projectile
(use-package helm-projectile
	:ensure t
	:init
	(use-package projectile	:ensure t)
	:config
	(projectile-global-mode)
	(helm-projectile-on))

(use-package helm-pt
	:after (helm)
	:ensure t
	:bind
	(("<f2>" . helm-projectile-pt)))
