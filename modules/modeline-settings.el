;;; modeline-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-04-17 10:59:37 Monday by merrick>
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
;;; Code:

;; (use-package smart-mode-line
;; 	:ensure t
;; 	:init
;; 	(use-package smart-mode-line-powerline-theme :ensure t)
;; 	:config
;; 	(display-time)
;; 	(setq sml/theme 'light-powerline)
;; 	(sml/setup))

(use-package spaceline-all-the-icons
	:init
	(use-package spaceline)
	(use-package all-the-icons)
	:config
	(spaceline-all-the-icons-theme)
	(spaceline-all-the-icons--setup-package-updates))

(use-package yahoo-weather
	:config
	(yahoo-weather-mode))

;; (use-package spaceline-all-the-icons
;; 	:init
;; 	(use-package spaceline :demand t)
;; 	:ensure nil
;;   :load-path "~/emaconfig/modules/spaceline-all-the-icons"
;; 	:config
;; 	(setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))


(provide 'modeline-settings)
;;; modeline-settings.el ends here
