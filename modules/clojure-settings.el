;;; clojure-settings.el --- summary
;; Description:
;; 
;; Author: A.I.
;; Email: merrick@luois.me
;; Last modified: <2017-02-17 00:19:54 Friday by merrick>
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

(use-package clojure-mode
	:commands clojure-mode
	:ensure t
	:mode "\\..clj\\'"	"\\.cljs\\'"	"\\.cljc\\'"	"\\.edn\\'")

(use-package cider
	:commands (cider-jack-in)
	:defer t
	:config
	(setq cider-cljs-lein-repl
				"(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel! 'android)
           (figwheel-sidecar.repl-api/cljs-repl))")
  (add-hook 'cider-repl-mode-hook #'eldoc-mode))

(provide 'clojure-settings)
;;; clojure-settings.el ends here
