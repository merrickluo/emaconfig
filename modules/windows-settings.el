(setq projectile-indexing-method 'alien)
(setq visible-bell t)
(setq inhibit-compacting-font-caches t)
(setq counsel-ag-base-command "ag --nocolor --nogroup --vimgrep %s")
(setq-default buffer-file-coding-system 'utf-8-unix)

(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

(provide 'windows-settings)
;;; windows-settings.el ends here
