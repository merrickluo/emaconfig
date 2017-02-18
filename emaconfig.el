;;; emaconfig.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-17 00:14:03 Friday by merrick>
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

;; Bootstrap `use-package'
(defvar package-archives)
(setq
 package-enable-at-startup nil
 package-archives
 '(("melpa-stable" . "http://stable.melpa.org/packages/")
   ("melpa"        . "http://melpa.org/packages/")
   ("org"          . "http://orgmode.org/elpa/")
   ("gnu"          . "http://elpa.gnu.org/packages/")))

(eval-when-compile
	(require 'package)
	(package-initialize)
	(unless (package-installed-p 'use-package)
		(package-refresh-contents)
		(package-install 'use-package)))

(require 'use-package)
(setq use-package-always-pin "melpa-stable")
(setq use-package-always-ensure t)

(defconst emacs-root-path
  (file-name-directory
	 (or load-file-name buffer-file-name))
	"Emacs root settings path (in linux).")
(add-to-list 'load-path (concat emacs-root-path "modules"))

(defun kill-current-buffer()
	(interactive)
	(kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'kill-current-buffer)

(load-library "gui-settings")
(load-library "global-settings")
(load-library "auto-insert-settings")
(load-library "git-settings")
(load-library "modeline-settings")
(load-library "company-settings")
(load-library "go-settings")
(load-library "markdown-settings")
(load-library "clojure-settings")
(load-library "conf-settings")
(load-library "prog-settings")
(load-library "org-settings")

;;(load-library "chinese-settings")

(provide 'emaconfig)
;;; emaconfig.el ends here
