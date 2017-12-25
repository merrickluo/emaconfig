(use-package mu4e
	:load-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
	:config
	;;location of my maildir
	(setq mu4e-maildir (expand-file-name "~/Maildir"))
	(setq mu4e-trash-folder "/[Gmail]/Trash")
	(setq mu4e-drafts-folder "/[Gmail]/Drafts")
	(setq mu4e-sent-folder "/[Gmail]/Sent Mail")
	(setq mu4e-refile-folder "/[Gmail]/All Mail")

	;;command used to get mail
	;; use this for testing
	;; (setq mu4e-get-mail-command "true")
	;; use this to sync with mbsync
	(setq mu4e-get-mail-command "mbsync gmail")

	;;rename files when moving
	;;NEEDED FOR MBSYNC
	(setq mu4e-change-filenames-when-moving t)
	(setq mu4e-view-show-images t)

	;;set up queue for offline email
	;;use mu mkdir  ~/Maildir/queue to set up first
	(setq smtpmail-queue-mail nil  ;; start in normal mode
				smtpmail-queue-dir   "~/.mail/queue/cur"))

(use-package mu4e-alert
	:after mu4e
	:init
	(setq mu4e-alert-interesting-mail-query
				"flag:unread maildir:/Inbox")
	(mu4e-alert-set-default-style 'notifier)
	(mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display)
    )
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line))
