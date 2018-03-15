(use-package elfeed
	:bind (("C-c f" . elfeed)))

(use-package elfeed-org
	:after elfeed
	:config
	(setq rmh-elfeed-org-files '("~/Dropbox/docs/feeds.org"))
	(elfeed-org))

(use-package elfeed-goodies
	:after elfeed
	:config
	(elfeed-goodies/setup))
