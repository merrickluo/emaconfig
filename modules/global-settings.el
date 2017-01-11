;; helm
(use-package helm
	:ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-r" . helm-recentf)))

;; projectile
(use-package helm-projectile
	:ensure t
	:init
	(use-package projectile	:ensure t)
	:config
	(projectile-global-mode)
	(helm-projectile-on))
