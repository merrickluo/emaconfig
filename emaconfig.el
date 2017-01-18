;; setup package.el and use-package

(setq-default
 package-enable-at-startup nil
 package-archives
 '(("melpa-stable" . "http://stable.melpa.org/packages/")
   ("melpa" . "http://melpa.org/packages/")
   ("org"         . "http://orgmode.org/elpa/")
   ("gnu"         . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default use-package-always-pin "melpa-stable")
(setq-default use-package-always-ensure t)

(defconst emacs-root-path
  (file-name-directory
	 (or load-file-name buffer-file-name))
	"Emacs root settings path (in linux).")
(add-to-list 'load-path (concat emacs-root-path "modules"))

(load-library "gui-settings")
(load-library "global-settings")
(load-library "auto-insert-settings")
(load-library "git-settings")
(load-library "modeline-settings")
(load-library "company-settings")
(load-library "go-settings")
(load-library "markdown-settings")
(load-library "clojure-settings")
(load-library "conf-settings")

(load-library "prog-settings")
