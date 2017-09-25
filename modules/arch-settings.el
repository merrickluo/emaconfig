;;; arch-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-09-21 23:01:10 Thursday by Merrick>
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
(use-package arch-packer
	:config
	(setq arch-packer-default-command "pacaur"))

(use-package direnv
	:config
	(direnv-mode))

(provide 'arch-settings)
;;; arch-settings.el ends here
