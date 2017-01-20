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
  (add-hook 'cider-repl-mode-hook #'eldoc-mode))
