;;; company-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-16 23:40:16 Thursday by merrick>
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
;;; Code:

(use-package company
	:commands (global-company-mode company-mode)
  :config
	(global-company-mode)
	(setq company-idle-delay 0)
	(setq company-minimum-prefix-length 2))

;; (use-package company-flx
;;   :pin melpa
;;   :after (company)
;;   :config
;;   (company-flx-mode))

(provide 'company-settings)
;;; company-settings.el ends here
