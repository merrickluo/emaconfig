(setq-local mu4e-load-path
						(if (string-equal system-type "darwin")
								"/usr/local/share/emacs/site-lisp/mu/mu4e"
							"/usr/share/emacs/site-lisp/mu4e"))

(use-package mu4e-contrib
	:load-path mu4e-load-path
	:bind (("C-c m i" . mu4e-inbox))
	:config
	;;location of my maildir
	(setq mu4e-maildir (expand-file-name "~/Maildir"))
	(setq mu4e-trash-folder "/[Gmail]/Trash")
	(setq mu4e-drafts-folder "/[Gmail]/Drafts")
	(setq mu4e-sent-folder "/[Gmail]/Sent Mail")
	(setq mu4e-refile-folder "/[Gmail]/All Mail")

	;;command used to get mail
	;; use this for testing
	(setq mu4e-get-mail-command "true")
	;; use this to sync with mbsync
	;; (setq mu4e-get-mail-command "mbsync gmail")

	;;rename files when moving
	;;NEEDED FOR MBSYNC
	(setq mu4e-change-filenames-when-moving t)
	(setq mu4e-view-show-images t)
	(setq mu4e-view-prefer-html t)
	(setq mu4e-html2text-command "w3m -T text/html")

	;; email send settings
	(setq message-send-mail-function 'smtpmail-send-it
				mu4e-sent-messages-behavior 'delete)

	(setq smtpmail-default-smtp-server "smtp.gmail.com"
				smtpmail-smtp-server "smtp.gmail.com"
				smtpmail-smtp-service 587
				smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
				smtpmail-smtp-user "merrick@luois.me"
				;; smtpmail-debug-info t
				user-mail-address "merrick@luois.me"
				)

	(setq mu4e-attachment-dir "~/Downloads")
	;; hotkey
	(defun mu4e-inbox ()
		"jump to mu4e inbox"
		(interactive)
		(mu4e~headers-jump-to-maildir "/INBOX")))

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
