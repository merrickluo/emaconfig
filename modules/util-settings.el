(use-package transmission
  :bind
  ("C-c t" . transmission)
  (:map transmission-mode-map
        ("m" . transmission-add-magnet))
  :config
  (defun transmission-add-magnet ()
    (interactive)
    (let ((magnet (read-string "magnet link: ")))
      (transmission-add magnet))))
