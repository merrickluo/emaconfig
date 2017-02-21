;;; gui-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-21 17:27:22 Tuesday by merrick>
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
(set-face-attribute 'default nil :font "Operator Mono Book-10")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package leuven-theme
	:pin melpa
	:config
	(load-theme 'leuven t)
	(setq leuven-scale-outline-headlines nil))

(provide 'gui-settings)
;;; gui-settings.el ends here
