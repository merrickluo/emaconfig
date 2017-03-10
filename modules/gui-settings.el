;;; gui-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-03-07 18:11:54 Tuesday by merrick>
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

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package monokai-theme
	:config
	(load-theme 'monokai t)
	  (setq monokai-height-minus-1 0.8
        monokai-height-plus-1 1.0
        monokai-height-plus-2 1.0
        monokai-height-plus-3 1.0
        monokai-height-plus-4 1.0))

;; (use-package leuven-theme
;; 	:pin melpa
;; 	:config
;; 	(load-theme 'leuven t)
;; 	(setq leuven-scale-outline-headlines nil))

(provide 'gui-settings)
;;; gui-settings.el ends here
