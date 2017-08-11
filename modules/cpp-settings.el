;;; cpp-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-08-11 18:00:00 Friday by merrick>
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

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path
                           (list "/usr/include/SDL2/"))))

(use-package cmake-mode)
(use-package irony
	:config
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'c-mode-hook 'irony-mode)
	(add-hook 'objc-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
	:after (irony)
	:config
	(add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
	:after (irony)
	:config
	(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
	(setq))

(use-package irony-eldoc
	:after (irony)
	:config
	(add-hook 'irony-mode-hook #'irony-eldoc))

(provide 'cpp-settings)
;;; cpp-settings.el ends here
