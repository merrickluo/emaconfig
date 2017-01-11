(setq change-log-default-name   "ChangeLog"
      user-full-name            "A.I."
      user-nick-name            "@merrickluo"
      major-mode                'text-mode
      enable-local-variables    :safe
      log-mailing-address       "log@cccc.com"
      ;; My Gmail address, Welcome letter
      user-mail-address         "merrick@luois.me")

(setq-default default-directory "~"
              indicate-buffer-boundaries 'left)

(setq line-move-visual nil
      visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

;; speed up keystroke
(setq echo-keystrokes 0.1
      font-lock-maximum-decoration t
      system-time-locale "C")

(global-font-lock-mode t)

;;; Unbind the stupid minimize that I always hit.
(global-unset-key "\C-z")

(use-package files
  :init
  (setq-default make-backup-files nil
                auto-save-default nil))

(setq-default tab-width 2)
(set-face-attribute 'default nil :font "Fira Code-12")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package leuven-theme
	:ensure t
	:config
	(load-theme 'leuven t))
