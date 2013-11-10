;;; init-emacs.el --- init
;; Base configuration
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory  "config"))

;;; Commentary:
;;

(require 'init-benchmarking) ;; Measure startup time
(require 'init-elpa)

(require 'init-parameters)
(require 'init-emacs-lisp-mode)
(require 'init-ui)
(require 'init-coding)

(require 'init-sr-speedbar)
(require 'init-linum)
(require 'init-eshell)
(require 'init-theme)
(require 'init-global-set-key)

(require 'init-cedet)
(require 'init-org)
(require 'init-uniquify)
(require 'init-ess)
(require 'init-julia)
(require 'init-maxima)

(require 'init-compile)
(require 'init-whitespace)
(require 'init-indent-tabs-mode)
(require 'init-interactive-mode)
(require 'init-python-mode)
(require 'init-texinfo-mode)
(require 'init-markdown-mode)
(require 'init-sage-mode)
(require 'init-xcscope)
(require 'init-jdee)
(require 'init-highlight-line)
(require 'init-epy)

;; elpa pacakges
(require 'init-irfc)
(require 'init-flymake)
(require 'init-helm)
(require 'init-helm-R)
(require 'init-helm-flymake)
(require 'init-ecb)
(require 'init-magit)
(require 'init-session)
(require 'init-w3m)
(require 'init-yasnippet)
(require 'init-slime)
(require 'init-emms)
(require 'init-powershell)
(require 'init-octave-mod)
(require 'init-csharp-mode)
(require 'init-ediff)
(require 'init-erc)
(require 'init-dired)
(require 'init-gtags)
(require 'init-auto-complete)
(require 'init-cc-mode)
(require 'init-markdown)
(require 'init-javascript)
(require 'init-nodejs)

;;; init-emacs.el ends here


(provide 'init-emacs)
