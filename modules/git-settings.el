(use-package magit
  :commands (magit-status)
  :bind (("C-x v z" . magit-status)))

(use-package git-timemachine
  :commands (git-timemachine)
  :bind (("C-x v t" . git-timemachine)))

;; (use-package magithub
;;   :after magit
;;   :config (magithub-feature-autoinject t))

(provide 'git-settings)
;;; git-settings.el ends here
