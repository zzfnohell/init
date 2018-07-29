;;; init-elpa.el --- ELPA

;;; Commentary:
;; 

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
						 '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
						 '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
						 '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
						 '("popkit" . "http://elpa.popkit.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
	(require 'use-package)
  )

(setq use-package-always-ensure t)

(require 'bind-key)

(provide 'init-elpa)

;;; init-elpa.el ends here
