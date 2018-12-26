;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:

(use-package company
  :ensure t
  :demand t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-lsp
  :after (:all company lsp-mode)
  :ensure t
  :demand t
  :config
  (push 'company-lsp company-backends))

(use-package company-jedi
  :ensure t
  :after (:all company jedi)
  :config (add-to-list 'company-backends 'company-jedi))

(use-package company-coq
  :ensure t
  :if (featurep 'proof-site)
  :after (:all company))

(use-package company-tern
  :ensure t
  :after (:all company)
  :config
	(add-to-list 'company-backends 'company-tern)
	(setq company-tern-property-marker "")
	(setq company-tern-meta-as-single-line t)
	(setq company-tooltip-align-annotations t))

(use-package company-quickhelp
  :after (:all company)
  :config (company-quickhelp-mode 1))

(use-package company-math
  :ensure t
  :after (:all company)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode))

;; (use-package company-inf-ruby
;; 	:after (:all company)
;;   :demand t
;;   :config (add-to-list 'company-backends 'company-inf-ruby))


(use-package company-glsl
  :ensure t
  :after (:all company)
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(use-package company-web
  :ensure t
  :config
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-web-jade)
  (add-to-list 'company-backends 'company-web-slim))

(use-package company-shell :ensure t)

(use-package company-axiom :ensure t)

(use-package company-dict :ensure t)

(use-package company-restclient :ensure t)

(provide 'init-company)

;;; init-company.el ends here
