(when window-system
	;; use 120 char wide window for largeish displays
	;; and smaller 80 column windows for smaller displays
	;; pick whatever numbers make sense for you
	(if (> (x-display-pixel-width) 1280)
			(add-to-list 'default-frame-alist (cons 'width 160))
		(add-to-list 'default-frame-alist (cons 'width 60)))
	;; for the height, subtract a couple hundred pixels
	;; from the screen height (for panels, menubars and
	;; whatnot), then divide by the height of a char to
	;; get the height we want
	(add-to-list 'default-frame-alist
							 (cons 'height (/ (- (x-display-pixel-height) 600)
																(frame-char-height)))))

(setq-default default-directory "~"
              indicate-buffer-boundaries 'left)

(setq line-move-visual nil
      visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

;; speed up keystroke
(setq echo-keystrokes 0.1
      font-lock-maximum-decoration t
      system-time-locale "C")

(global-font-lock-mode t)

;;; Unbind the stupid minimize that I always hit.
(global-unset-key "\C-z")

(setq-default make-backup-files nil
							auto-save-default nil)

(setq-default tab-width 2)
;;(set-face-attribute 'default nil :font "Essential PragmataPro-13")
;;(set-face-attribute 'default nil :font "Fira Code-13")

(use-package fill-column-indicator
	:demand t
	:config
	(setq fci-rule-width 1)
	(setq fill-column 79)
	(setq fci-rule-color "grey")
	(add-hook 'prog-mode-hook
						(fci-mode t)))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (use-package monokai-theme
;; 	:config
;; 	(load-theme 'monokai t)
;; 	  (setq monokai-height-minus-1 0.8
;;         monokai-height-plus-1 1.0
;;         monokai-height-plus-2 1.0
;;         monokai-height-plus-3 1.0
;;         monokai-height-plus-4 1.0))

;; (use-package leuven-theme
;; 	:config
;; 	(setq leuven-scale-outline-headlines nil))

;; (use-package material-theme
;; 	:config
;; 	(load-theme 'material)
;; 	)

;; (use-package moe-theme
;; 	:config
;; 	(load-theme 'moe-dark))

;; (use-package mixed-pitch
;;   :ensure t
;;   :config
;;   ;; If you want it in all text modes:
;;   (add-hook 'text-mode-hook #'mixed-pitch-mode)
;;   ;; Depending on your specific setup, you may want to adjust the height of
;;   ;; variable pitch fonts:
;;   ;;(set-face-attribute 'variable-pitch :height 160)
;; 	)

(use-package zenburn-theme)

(provide 'gui-settings)
;;; gui-settings.el ends here
