;;; org-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-17 00:16:28 Friday by merrick>
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

(use-package org
  :ensure org-plus-contrib
	:pin org
	:config
	(add-hook 'org-mode-hook 'yas-minor-mode))

(provide 'org-settings)
;;; org-settings.el ends here