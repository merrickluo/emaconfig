(use-package clojure-mode
	:commands (clojure-mode clojurescript-mode)
	:ensure t
	:mode (("\\..clj\\'" . clojure-mode)
				 ("\\.cljs\\'" . clojurescript-mode)
				 ("\\.cljc\\'" . clojurescript-mode)
				 ("\\.edn\\'" . clojure-mode)))

(use-package cider
	:commands (cider-jack-in)
	:defer t
	:config
	(setq cider-cljs-lein-repl
				"(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
  (add-hook 'cider-repl-mode-hook #'eldoc-mode))

(provide 'clojure-settings)
;;; clojure-settings.el ends here
