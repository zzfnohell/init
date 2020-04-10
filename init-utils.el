;;; init-utils.el --- Utils


;;; Commentary:
;; 

;;; Code:

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(provide 'init-utils)

;;; init-utils.el ends here
