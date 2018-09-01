;;; init-vc.el --- Version Control

;;; Commentary:
;; 

;;; Code:

(use-package ahg :ensure t)

;; (require 'diff-mode)
;; (require 'easymenu)
;; (require 'log-edit)
;; (require 'ewoc)
;; (require 'vc-annotate)

(use-package magit
	:ensure t
	:config
	(setq magit-refresh-status-buffer nil))

(provide 'init-vc)
;;; init-vc.el ends here
