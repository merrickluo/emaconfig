;;; global-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-03-09 21:26:18 Thursday by merrick>
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
;; (use-package helm
;; 	:defer t
;;   :bind (("M-x" . helm-M-x)
;;          ("C-x C-f" . helm-find-files)
;;          ("C-x C-b" . helm-buffers-list)
;;          ("C-x C-r" . helm-resume)))

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
	(setq projectile-switch-project-action #'projectile-commander)
	(setq projectile-enable-caching t)
	(projectile-global-mode))

(use-package swiper
	:commands (swiper ivy-resume)
	:bind
	(("C-s" . swiper)
	 ("C-c C-r" . ivy-resume)))

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

(use-package counsel-projectile
	:pin melpa
	:config
	(ivy-set-display-transformer 'counsel-projectile
															 'ivy-rich-switch-buffer-transformer)
	(ivy-set-display-transformer 'counsel-projectile-switch-to-buffer
															 'ivy-rich-switch-buffer-transformer)
	(counsel-projectile-on))

;; (use-package swiper
;; 	:config
;; 	(ivy-mode 1)
;; 	(setq ivy-use-virtual-buffers t)
;; 	;; (global-set-key "\C-s" 'swiper)
;; 	;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; 	;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; 	;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; 	;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; 	;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; 	;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; 	;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; 	;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; 	;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; 	;; (global-set-key (kbd "C-c g") 'counsel-git)
;; 	;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; 	;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; 	;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; 	;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; 	;; (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;; 	)

;; (use-package helm-projectile
;; 	:pin melpa
;; 	:after (projectile)
;; 	:bind
;; 	(("<f1>" . helm-projectile-find-file)
;; 	 ("<f2>" . helm-projectile-ag))
;; 	:config
;; 	(use-package helm-ag)
;; 	(helm-projectile-on))

(use-package yasnippet
	:commands (yas-minor-mode)
	:defer t
	:config
	(add-to-list 'yas-snippet-dirs (concat emacs-root-path "snippets"))
	(yas-reload-all))

(use-package multi-term
	:pin melpa
	:bind (([f3] . smart-run-term)
				 ("C-<f3>" . dedicated-term))
	:config
	(defun dedicated-term()
		(interactive)
		(unless (multi-term-dedicated-exist-p)
			(multi-term-dedicated-open))
		(multi-term-dedicated-select))
	(defun smart-run-term()
    (interactive)
		(if (projectile-project-p)
				(let* ((term-name (concat "*term " (projectile-project-name) "*"))
							 (buffer (get-buffer term-name)))
          (if (not (eq buffer nil))
							(switch-to-buffer buffer)
						(progn
							(multi-term)
							(rename-buffer term-name)
              ;; (comint-send-string (get-buffer-process term-name)
							;; 										(format "cd %s\n" (projectile-project-root)
							;; 														))
							)))
			(multi-term))))

(use-package ace-window
	:bind (("C-x o" . ace-window)))

(provide 'global-settings)
;;; global-settings.el ends here
