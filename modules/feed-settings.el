(use-package elfeed
	:bind (("C-c f" . elfeed))
	:config
	(setq elfeed-db-directory "~/Dropbox/elfeed"))

(use-package elfeed-org
	:after elfeed
	:config
	(setq rmh-elfeed-org-files '("~/Dropbox/docs/feeds.org"))
	(elfeed-org))
