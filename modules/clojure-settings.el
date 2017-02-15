(use-package clojure-mode
	:ensure t
	:mode (("\\..clj\\'" . clojure-mode)
				 ("\\.cljs\\'" . clojure-mode)
				 ("\\.cljc\\'" . clojure-mode)
				 ("\\.edn\\'" . clojure-mode)))

(use-package cider
	:commands (cider-jack-in)
	:defer t
	:config
	(setq cider-cljs-lein-repl
				"(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel! 'android)
           (figwheel-sidecar.repl-api/cljs-repl))")
  (add-hook 'cider-repl-mode-hook #'eldoc-mode))
