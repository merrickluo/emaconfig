;;; conf-settings.el --- summary
;; Description:
;;
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-03-14 10:43:27 Tuesday by merrick>
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

(use-package dockerfile-mode
  :commands dockerfile-mode
	:mode "Dockerfile\\'")

(use-package yaml-mode
  :commands yaml-mode
	:mode "\\.yml\\'")

(use-package toml-mode
  :pin melpa
	:commands toml-mode
	:mode "\\.toml\\'")

(use-package fish-mode
	:mode "\\.fish\\'")

(provide 'conf-settings)
;;; conf-settings.el ends here
