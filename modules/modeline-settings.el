;; (use-package smart-mode-line
;; 	:ensure t
;; 	:init
;; 	(use-package smart-mode-line-powerline-theme :ensure t)
;; 	:config
;; 	(display-time)
;; 	(setq sml/theme 'light-powerline)
;; 	(sml/setup))

;; (use-package spaceline-all-the-icons
;; 	:init
;; 	(use-package spaceline)
;; 	(use-package all-the-icons)
;; 	:config
;; 	(spaceline-all-the-icons-theme)
;; 	(spaceline-all-the-icons--setup-package-updates))

(use-package smart-mode-line
	:config
	(setq sml/no-confirm-load-theme t)
	(setq sml/theme 'respectful)
  (setq sml/shorten-directory t)
	(setq sml/shorten-modes t)
  (setq rm-blacklist
				(format "^ \\(%s\\)$"
								(mapconcat #'identity
													 '("Fly.*" "Projectile.*" "PgLn" "company" "ElDoc" "yas" "ARev")
													 "\\|")))
	(sml/setup))

;; (use-package yahoo-weather
;; 	:config
;; 	(yahoo-weather-mode))

;; (use-package spaceline-all-the-icons
;; 	:init
;; 	(use-package spaceline :demand t)
;; 	:ensure nil
;;   :load-path "~/emaconfig/modules/spaceline-all-the-icons"
;; 	:config
;; 	(setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))


(provide 'modeline-settings)
;;; modeline-settings.el ends here
