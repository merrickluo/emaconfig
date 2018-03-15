(use-package elfeed)

(use-package elfeed-org
	:after elfeed
	:config
	(setq rmh-elfeed-org-files '("~/Dropbox/docs/feeds.org"))
	(elfeed-org))
