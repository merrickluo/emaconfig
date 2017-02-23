;;; modeline-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-23 17:49:01 Thursday by merrick>
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

(use-package all-the-icons :pin melpa)

(use-package spaceline-all-the-icons
	:after spaceline
	:ensure nil
  :load-path "~/emaconfig/modules/spaceline-all-the-icons")

(use-package spaceline
	:after powerline
  :config
	(setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))

(display-time)

(provide 'modeline-settings)
;;; modeline-settings.el ends here
