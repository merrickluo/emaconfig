;; Bootstrap `use-package'
(setq
 package-enable-at-startup nil
 package-archives
 '(("melpa"        . "https://melpa.org/packages/")
   ("org"          . "https://orgmode.org/elpa/")
   ("gnu"          . "https://elpa.gnu.org/packages/")))

(eval-when-compile
	(require 'package)
	(package-initialize)
	(unless (package-installed-p 'use-package)
		(package-refresh-contents)
		(package-install 'use-package)))

(require 'use-package)
(setq use-package-always-pin "melpa")
(setq use-package-always-ensure t)

(defconst emacs-root-path
  (file-name-directory
	 (or load-file-name buffer-file-name))
	"Emacs root settings path (in linux).")
(add-to-list 'load-path (concat emacs-root-path "modules"))

(load-library "personal-settings")
(load-library "gui-settings")
(load-library "global-settings")
(load-library "git-settings")
(load-library "company-settings")
(load-library "go-settings")
(load-library "markdown-settings")
(load-library "clojure-settings")
(load-library "conf-settings")
(load-library "prog-settings")
(load-library "org-settings")
(load-library "web-settings")
(load-library "project-settings")
(load-library "py-settings")
(load-library "cpp-settings")
(load-library "modeline-settings")
(load-library "email-settings")
(load-library "feed-settings")

;; maybe check system is arch
(if (eq system-type 'gnu/linux)
		(load-library "arch-settings"))

(if (eq system-type 'windows-nt)
		(load-library "windows-settings"))

;;(load-library "chinese-settings")

(set-register ?o '(file . "~/Dropbox/docs/"))

(provide 'emaconfig)
;;; emaconfig.el ends here
