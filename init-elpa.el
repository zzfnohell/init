
;;; init-elpa.el --- ELPA

;;; Commentary:
;; 

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                          ("melpa" . "http://elpa.emacs-china.org/melpa/")))
						 
(when (< emacs-major-version 27)
    (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'use-package-ensure-system-package))

(eval-when-compile (require 'use-package))

(setq use-package-always-ensure t)
(use-package use-package-ensure-system-package)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t))
;; (auto-package-update-maybe)
;; (auto-package-update-now)

(require 'bind-key)

(message "loading init-elpa done.")

(provide 'init-elpa)

;;; init-elpa.el ends here
